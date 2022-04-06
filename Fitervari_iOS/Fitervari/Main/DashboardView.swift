//
//  DashboardView.swift
//  Fitervari
//
//  Created by Tobias Kern on 23.09.21.
//

import SwiftUI
import Communicator
import Alamofire
import RefreshableScrollView

fileprivate class ViewModel: ObservableObject {
	@Published var trainings: [WorkoutPlanWithDate] = []
	
	init() {
		/*
		UserAPI.getUserWorkoutPlans(userId: "me") { data, error in
			if let data = data {
				self.trainings = data
			}
		}
		*/
		
		AF.request("https://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari/api/users/1/workoutPlans", method: .get, headers: [ "Authorization": "Bearer \(AuthenticationHandler.shared.token!)" ]).responseDecodable(of: [WorkoutPlanWithDate].self, decoder: OtherCustomDecoder()) { res in
			// debugPrint(res)
			self.trainings = res.value!
		}
	}
	
	/*
	func refresh(refreshControl: UIRefreshControl) {
		AF.request("https://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari/api/users/1/workoutPlans", method: .get, headers: [ "Authorization": "Bearer \(AuthenticationHandler.shared.token!)" ]).responseDecodable(of: [WorkoutPlanWithDate].self, decoder: OtherCustomDecoder()) { res in
			debugPrint(res)
			self.trainings = res.value!
			refreshControl.endRefreshing()
		}
	}
	*/
	
	func refresh() {
		AF.request("https://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari/api/users/1/workoutPlans", method: .get, headers: [ "Authorization": "Bearer \(AuthenticationHandler.shared.token!)" ]).responseDecodable(of: [WorkoutPlanWithDate].self, decoder: OtherCustomDecoder()) { res in
			// debugPrint(res)
			self.trainings = res.value!
		}
	}
}

struct DashboardView: View {
	@ObservedObject private var viewModel = ViewModel()
	
	@State private var selected: WorkoutPlanWithDate? = nil
	@State private var navigate = false
	
	static let dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "EEEE, d. MMMM yyyy"
		return formatter
	}()
    
    var body: some View {
		ScrollView {
			if #available(iOS 15.0, *) {
				ForEach(viewModel.trainings, id: \.id) { training in
					// "Pyramidentraining Woche 1-4"
					Card(title: "\(training.name!)") {
						VStack {
							HStack(spacing: 0) {
								/*
								Text("Tag 1/4: ")
									.bold()
								 */
								
								/*
								training.exercises.map { exercise in
									exercise.exerciseSets.first.
								}
								Text("Brust, Bizeps, Bauch")
								 */
							}
							.foregroundColor(.white)
							.frame(maxWidth: .infinity, alignment: .leading)
							
							Spacer()
						}
						
					} background: {
						Color.accentColor // Color.green
					}
					.frame(height: 170)
					.onTapGesture {
						ConnectivityProvider.shared.sendMessage(data: SelectedTrainingMessage(training: training))
						self.selected = training
						navigate = true
					}
					.onChange(of: navigate) { [navigate] newValue in
						if navigate && !newValue {
							ConnectivityProvider.shared.sendMessage(data: SelectedTrainingMessage(training: nil))
						}
					}
				}
				
				NavigationLink(destination: TrainingView(training: self.$selected), isActive: $navigate) {
					EmptyView()
				}
			}
		}
		.navigationTitle("\(DashboardView.dateFormatter.string(from: Date()))")
		.toolbar {
			Button {
				viewModel.refresh()
			} label: {
				Image(systemName: "arrow.clockwise.circle")
			}
			
			/*
			Button {
				pickerSheetVisible.toggle()
			} label: {
				Image(systemName: "calendar")
			}
			 */
		}
		/*
		.onRefresh(spinningColor: .gray, text: "", textColor: .gray, backgroundColor: .white) { refreshControl in
			viewModel.refresh(refreshControl: refreshControl)
		}
		*/
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .accentColor(.orange)
    }
}
