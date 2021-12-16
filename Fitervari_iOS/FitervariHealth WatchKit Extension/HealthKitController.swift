//
//  HealthKitController.swift
//  FitervariHealth WatchKit Extension
//
//  Created by Tobias Kern on 14.12.21.
//

import Foundation
import HealthKit

class HealthKitController: ObservableObject {
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
	
	init() {
		healthStore.requestAuthorization(toShare: writing, read: reading) { success, error in
			//
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
	}
}
