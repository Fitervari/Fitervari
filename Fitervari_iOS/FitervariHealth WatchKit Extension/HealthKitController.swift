//
//  HealthKitController.swift
//  FitervariHealth WatchKit Extension
//
//  Created by Tobias Kern on 14.12.21.
//

import Foundation
import HealthKit
import Combine
import Alamofire

class HealthKitController: ObservableObject {
	static let shared = HealthKitController()
	
	private var healthStore = HKHealthStore()
	
	private let writing: Set = [
		HKQuantityType.workoutType(),
	]
	
	private let reading: Set = [
		HKQuantityType.quantityType(forIdentifier: .heartRate)!,
		HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!,
	]
	
	private var session: HKWorkoutSession?
	private var builder: HKLiveWorkoutBuilder?
	
	private var hrObserverQuery: HKObserverQuery?
	private var ebObserverQuery: HKObserverQuery?
	
	let heartRate = PassthroughSubject<Int, Error>()
	let energyBurned = PassthroughSubject<Double, Error>()
	
	var exerciseSet: Int64 = -1
	
	private init() {
		healthStore.requestAuthorization(toShare: writing, read: reading) { success, error in
			//
		}
	}
	
	func prepare() {
		
	}
	
	func recoverWorkout() {
		healthStore.recoverActiveWorkoutSession { session, error in
			if let session = session {
				let configuration = HKWorkoutConfiguration()
				configuration.activityType = .crossTraining // research later!
				configuration.locationType = .unknown
				
				session.associatedWorkoutBuilder().dataSource = HKLiveWorkoutDataSource(healthStore: self.healthStore, workoutConfiguration: configuration)
				session.end()
				session.associatedWorkoutBuilder().endCollection(withEnd: Date(), completion: { success, error in
					guard success else {
					  return
				  }
				  
				  self.builder?.finishWorkout(completion: { workout, error in
					  guard workout != nil else {
						  return
					  }
					  
					  /*
					  var msg = WorkoutDataMessage(dateInterval: DateInterval(start: workout!.startDate, end: workout!.endDate), segments: workout?.workoutEvents.)
					  */
				  })
			  })
			}
		}
	}
	
	/*
	var hrSamples: [Date: Int] = [:]
	var ebSamples: [Date: Double] = [:]
	*/
	
	var FSession: WorkoutSession?
	
	func startWorkout(planId: Int64) async {
		let configuration = HKWorkoutConfiguration()
		configuration.activityType = .crossTraining // research later!
		configuration.locationType = .unknown
		
		do {
			session = try HKWorkoutSession(healthStore: healthStore, configuration: configuration)
			builder = session?.associatedWorkoutBuilder()
			
			let date = Date()
			let formatter = DateFormatter()
			formatter.locale = Locale(identifier: "en_US_POSIX")
			formatter.timeZone = TimeZone(secondsFromGMT: 0)
			formatter.dateFormat = "yyyy-MM-dd"
			
			let otherFormatter = DateFormatter()
			otherFormatter.locale = Locale(identifier: "en_US_POSIX")
			otherFormatter.timeZone = TimeZone(secondsFromGMT: 0)
			otherFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
			
			let timeFormatter = DateFormatter()
			timeFormatter.dateFormat = "hh:mm"
			
			let session = WorkoutSession(date: formatter.string(from: date), date2: otherFormatter.string(from: date), startTime: timeFormatter.string(from: date)) // Date()) TODO: fix!
			
			print(formatter.string(from: date))
			
			let req = AF.request("https://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari/api/workoutPlans/\(planId)/workoutSessions", method: .post, parameters: session, encoder: JSONParameterEncoder.default)
			
			/*
			try await withCheckedContinuation { (continuation: CheckedContinuation<Void, Never>) in
				AF.request("https://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari/api/workoutPlans/\(planId)/workoutSessions", method: .post, parameters: session, encoder: JSONParameterEncoder.default).responseDecodable(of: WorkoutSession.self, decoder: OtherCustomDecoder()) { res in
					debugPrint(res)
					// self.trainings = res.value!
				}
				
				/*
				req.responseString(completionHandler: { response in
					print(response.value!)
					continuation.resume()
					//continuation.resume(with: Result.success(""))
					fatalError()
				})
				 */
			}
			 */
			
			FSession = try await req.serializingDecodable(WorkoutSession.self, decoder: OtherCustomDecoder()).value
			
		} catch {
			debugPrint(error)
			fatalError()
		}
		
		builder?.dataSource = HKLiveWorkoutDataSource(healthStore: healthStore, workoutConfiguration: configuration)
		
		let sort = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
		
		let hr = HKQuantityType.init(.heartRate)
		hrObserverQuery = HKObserverQuery(sampleType: hr, predicate: nil) { (query, completionHandler, errorOrNil) in
			if let error = errorOrNil {
				debugPrint(error)
				return
			}
			
			let q = HKSampleQuery(sampleType: hr, predicate: nil, limit: 1, sortDescriptors: [sort]) { query, sample, error in
				if let sample = sample {
					if !sample.isEmpty {
						let data = (sample.first! as! HKQuantitySample).quantity.doubleValue(for: HKUnit(from: "count/min"))
						DispatchQueue.main.async {
							self.heartRate.send(Int(data))
							// self.hrSamples[Date()] = Int(data)
							
							print("session id: \(self.FSession!.id!)")
							print("set: \(self.exerciseSet)")
							
							let timeFormatter = DateFormatter()
							timeFormatter.locale = Locale(identifier: "en_US_POSIX")
							timeFormatter.timeZone = TimeZone(secondsFromGMT: 0)
							timeFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
							
							let data = HealthData(type: 1, value: Int64(data), time: timeFormatter.string(from: Date()), training: self.FSession!.id!, exerciseSet: self.exerciseSet) //, training: self.FSession!.id!, exerciseSet: 1)
							
							// print(data)
							
							
							AF.request("https://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari/api/healthdata", method: .post, parameters: data, encoder: JSONParameterEncoder.default)
								.validate()
								.response { response in
									print("sent hr data")
								}
						}
					}
				}
			}
			
			self.healthStore.execute(q)
		}
		
		healthStore.execute(hrObserverQuery!)
		
		let eb = HKQuantityType.init(.activeEnergyBurned)
		ebObserverQuery = HKObserverQuery(sampleType: eb, predicate: nil) { (query, completionHandler, errorOrNil) in
			if let error = errorOrNil {
				debugPrint(error)
				return
			}
			
			let q = HKSampleQuery(sampleType: eb, predicate: nil, limit: 1, sortDescriptors: [sort]) { query, sample, error in
				if let sample = sample {
					if !sample.isEmpty {
						let data = (sample.first! as! HKQuantitySample).quantity.doubleValue(for: HKUnit.kilocalorie())
						DispatchQueue.main.async {
							self.energyBurned.send(data)
							// self.ebSamples[Date()] = data
						}
					}
				}
			}
			
			self.healthStore.execute(q)
		}
		
		healthStore.execute(ebObserverQuery!)
		
		session?.startActivity(with: Date())
		builder?.beginCollection(withStart: Date()) { success, error in
			guard success else {
				return
			}
			
			//
		}
	}
	
	func switchSegment() {
		// builder.add
	}
	
	func stopWorkout() {
		let date = Date()
		let timeFormatter = DateFormatter()
		timeFormatter.dateFormat = "hh:mm"
		
		FSession!.endTime = timeFormatter.string(from: date) // TODO: fix!
		// FSession!.endTime = Date()
		
		AF.request("https://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari/api/workoutSessions/\(FSession!.id!)", method: .put, parameters: FSession, encoder: JSONParameterEncoder.default)
			.validate()
			.response { response in
				print("finished training")
			}
		
		session?.end()
		builder?.endCollection(withEnd: Date(), completion: { success, error in
			guard success else {
				return
			}
			
			self.builder?.finishWorkout(completion: { workout, error in
				guard workout != nil else {
					return
				}
				
				/*
				var msg = WorkoutDataMessage(dateInterval: DateInterval(start: workout!.startDate, end: workout!.endDate), segments: workout?.workoutEvents.)
				*/
				
				/*
				self.hrSamples = [:]
				self.ebSamples = [:]
				*/
			})
		})
		
		healthStore.stop(hrObserverQuery!)
		healthStore.stop(ebObserverQuery!)
	}
}
