//
//  HealthKitController.swift
//  FitervariHealth WatchKit Extension
//
//  Created by Tobias Kern on 14.12.21.
//

import Foundation
import HealthKit
import Combine

class HealthKitController: ObservableObject {
	static let shared = HealthKitController()
	
	private var healthStore = HKHealthStore()
	
	private let writing: Set = [
		HKQuantityType.workoutType(),
	]
	
	private let reading: Set = [
		HKQuantityType.quantityType(forIdentifier: .heartRate)!,
		HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!,
		HKQuantityType.quantityType(forIdentifier: .oxygenSaturation)!,
	]
	
	private var session: HKWorkoutSession?
	private var builder: HKLiveWorkoutBuilder?
	
	private var hrObserverQuery: HKObserverQuery?
	private var ebObserverQuery: HKObserverQuery?
	
	let heartRate = PassthroughSubject<Int, Error>()
	let energyBurned = PassthroughSubject<Int, Error>()
	
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
	
	func startWorkout() {
		let configuration = HKWorkoutConfiguration()
		configuration.activityType = .crossTraining // research later!
		configuration.locationType = .unknown
		
		do {
			session = try HKWorkoutSession(healthStore: healthStore, configuration: configuration)
			builder = session?.associatedWorkoutBuilder()
		} catch {
			fatalError()
		}
		
		builder?.dataSource = HKLiveWorkoutDataSource(healthStore: healthStore, workoutConfiguration: configuration)
		
		let hr = HKQuantityType.init(HKQuantityTypeIdentifier.heartRate)
		let eb = HKQuantityType.init(HKQuantityTypeIdentifier.activeEnergyBurned)
		
		hrObserverQuery = HKObserverQuery(sampleType: hr, predicate: nil) { (query, completionHandler, errorOrNil) in
			
			print(errorOrNil)
			debugPrint(errorOrNil)
			/*
			let q = HKSampleQuery(sampleType: hr, predicate: nil, limit: 1, sortDescriptors: nil) { query, sample, error in
				if let sample = sample {
					if !sample.isEmpty {
						let data = (sample.first! as! HKQuantitySample).quantity.doubleValue(for: HKUnit(from: "count/min"))
						DispatchQueue.main.async {
							self.heartRate.send(Int(data))
						}
					}
				}
			}
			*/
			
			print("hr received")
			// self.healthStore.execute(q)
		}
		
		ebObserverQuery = HKObserverQuery(sampleType: eb, predicate: nil) { (query, completionHandler, errorOrNil) in
			
			print(errorOrNil)
			debugPrint(errorOrNil)
			/*
			let q = HKSampleQuery(sampleType: eb, predicate: nil, limit: 1, sortDescriptors: nil) { query, sample, error in
				if let sample = sample {
					if !sample.isEmpty {
						let data = (sample.first! as! HKQuantitySample).quantity.doubleValue(for: HKUnit.kilocalorie())
						DispatchQueue.main.async {
							self.energyBurned.send(Int(data))
						}
					}
				}
			}
			*/
			
			print("eb received")
			// self.healthStore.execute(q)
		}
		
		healthStore.execute(hrObserverQuery!)
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
			})
		})
		
		healthStore.stop(hrObserverQuery!)
		healthStore.stop(ebObserverQuery!)
	}
}
