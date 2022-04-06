//
//  HistoryView.swift
//  Fitervari
//
//  Created by Tobias Kern on 28.02.22.
//

import SwiftUI
import Alamofire
import RefreshableScrollView

fileprivate class ViewModel: ObservableObject {
	@Published var sessions: [WorkoutSessionDetailed]?
	
	var month: Month
	
	init(month: Month) {
		self.month = month
		AF.request("https://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari/api/users/1/workoutSessions", method: .get, headers: [ "Authorization": "Bearer \(AuthenticationHandler.shared.token!)" ]).responseDecodable(of: [WorkoutSessionDetailed].self, decoder: CustomDecoder()) { res in
			// debugPrint(res)
			self.sessions = res.value!
		}
	}
	
	func reload(month: Month) {
		self.month = month
		AF.request("https://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari/api/users/1/workoutSessions", method: .get, headers: [ "Authorization": "Bearer \(AuthenticationHandler.shared.token!)" ]).responseDecodable(of: [WorkoutSessionDetailed].self, decoder: CustomDecoder()) { res in
			// debugPrint(res)
			self.sessions = res.value!
		}
	}
	
	/*
	func refresh(refreshControl: UIRefreshControl) {
		AF.request("https://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari/api/users/1/workoutSessions", method: .get, headers: [ "Authorization": "Bearer \(AuthenticationHandler.shared.token!)" ]).responseDecodable(of: [WorkoutSessionDetailed].self, decoder: CustomDecoder()) { res in
			debugPrint(res)
			self.sessions = res.value!
			refreshControl.endRefreshing()
		}
	}
	 */
	
	func refresh() {
		AF.request("https://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari/api/users/1/workoutSessions", method: .get, headers: [ "Authorization": "Bearer \(AuthenticationHandler.shared.token!)" ]).responseDecodable(of: [WorkoutSessionDetailed].self, decoder: CustomDecoder()) { res in
			// debugPrint(res)
			self.sessions = res.value!
		}
	}
}

struct HistoryView: View {
	@State private var date: Date = Date()
	@State private var pickerSheetVisible = false
	
	@ObservedObject private var viewModel = ViewModel(month: Month(Date()))
	
	static let dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "MMMM yyyy"
		return formatter
	}()
	
    var body: some View {
		let weeks = Array(Month(date).makeIterator())
		
		VStack {
			if #available(iOS 15.0, *) {
				WeekView(week: weeks.first(where: { w in
					w.interval.contains(date)
				})!, weeks: weeks, date: $date, viewModel: viewModel)
			}
		}
		.navigationTitle(HistoryView.dateFormatter.string(from: date))
		.toolbar {
			Button {
				pickerSheetVisible.toggle()
			} label: {
				Image(systemName: "calendar")
			}
			
			Button {
				viewModel.refresh()
			} label: {
				Image(systemName: "arrow.clockwise.circle")
			}
		}
		.sheet(isPresented: $pickerSheetVisible) {
			NavigationView {
				VStack {
					Spacer()
					
					DatePicker("Datum auswählen", selection: $date, displayedComponents: .date)
						.datePickerStyle(.graphical)
					
					Spacer()
					
					if #available(iOS 15.0, *) {
						Button {
							pickerSheetVisible = false
							viewModel.reload(month: Month(date))
						} label: {
							Text("Fertig")
								.frame(maxWidth: .infinity)
						}
						.tint(.accentColor)
						.controlSize(.large)
						.buttonStyle(.borderedProminent)
					}
				}
				.navigationTitle("Datum auswählen")
				.navigationBarTitleDisplayMode(.inline)
			}
			.padding(.horizontal, margin(for: UIScreen.main.bounds.width))
		}
    }
}

@available(iOS 15.0, *)
struct WeekSelector: View {
	var weeks: [Week]
	@Binding var date: Date
	
	var body: some View {
		SingleAxisGeometryReader { width in
			HStack(spacing: 8) {
				ForEach(weeks, id: \.id) { w in
					Button {
						date = max(Calendar.current.date(from: Calendar.current.dateComponents([ .year, .month ], from: date))!, w.interval.start)
					} label: {
						VStack(spacing: 7) {
							Text("\(w.startDay)")
							Color.white.frame(height: CGFloat(4) / UIScreen.main.scale)
							Text("\(w.endDay)")
						}
					}
					.buttonStyle(.borderedProminent)
					.tint(w.interval.contains(date) ? .accentColor : .gray)
					.frame(width: calcWidthOfSegments(amount: weeks.count, spacing: 8, availableWidth: width))
				}
			}
		}
	}
	
	func calcWidthOfSegments(amount: Int, spacing: CGFloat, availableWidth: CGFloat) -> CGFloat {
		let baseWidth = availableWidth / CGFloat(amount)
		let spacingOffset = CGFloat(amount - 1) * spacing / CGFloat(amount)
		
		return max(baseWidth - spacingOffset, 0)
	}
}

@available(iOS 15.0, *)
struct WeekView: View {
	@EnvironmentObject private var accountModel: AccountModel
	@Environment(\.defaultMinListRowHeight) private var minRowHeight
	
	@State private var navigate = false
	@State private var session: WorkoutSessionDetailed?
	
	var week: Week
	var weeks: [Week]
	
	@Binding var date: Date
	@ObservedObject fileprivate var viewModel: ViewModel
	
	// @Binding fileprivate var sessions: [WorkoutSessionDetailed]?
	
	static let dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "EEEE, d. MMM"
		return formatter
	}()
	
	var body: some View {
		if accountModel.user.creationDate > week.interval.end {
			VStack {
				WeekSelector(weeks: weeks, date: $date)
				
				if #available(iOS 15.0, *) {
					Button {
						viewModel.refresh()
					} label: {
						HStack {
							Text("Neu laden")
							Spacer()
							Image(systemName: "arrow.clockwise")
								.font(Font.body.weight(.semibold))
						}
						.frame(maxWidth: .infinity)
					}
					.tint(.gray)
					.controlSize(.large)
					.buttonStyle(.borderedProminent)
				}
				
				Spacer()
				Text("Für diese Woche sind keine Daten verfügbar.")
					.foregroundColor(.gray)
				Spacer()
			}
			.padding(.horizontal, margin(for: UIScreen.main.bounds.width))
			
		} else if viewModel.sessions == nil {
			VStack {
				WeekSelector(weeks: weeks, date: $date)
				
				if #available(iOS 15.0, *) {
					Button {
						viewModel.refresh()
					} label: {
						HStack {
							Text("Neu laden")
							Spacer()
							Image(systemName: "arrow.clockwise")
								.font(Font.body.weight(.semibold))
						}
						.frame(maxWidth: .infinity)
					}
					.tint(.gray)
					.controlSize(.large)
					.buttonStyle(.borderedProminent)
				}
				
				Spacer()
				ProgressView()
				Spacer()
			}
			.padding(.horizontal, margin(for: UIScreen.main.bounds.width))
			
		} else if viewModel.sessions!.filter({ session in week.interval.contains(session.date2) }).isEmpty {
			VStack {
				WeekSelector(weeks: weeks, date: $date)
				
				if #available(iOS 15.0, *) {
					Button {
						viewModel.refresh()
					} label: {
						HStack {
							Text("Neu laden")
							Spacer()
							Image(systemName: "arrow.clockwise")
								.font(Font.body.weight(.semibold))
						}
						.frame(maxWidth: .infinity)
					}
					.tint(.gray)
					.controlSize(.large)
					.buttonStyle(.borderedProminent)
				}
				
				Spacer()
				Text("In dieser Woche fanden keine Trainings statt.")
					.foregroundColor(.gray)
				Spacer()
			}
			.padding(.horizontal, margin(for: UIScreen.main.bounds.width))
			
		} else {
			ScrollView {
				VStack(alignment: .leading, spacing: 20) {
					VStack {
						WeekSelector(weeks: weeks, date: $date)
						
						if #available(iOS 15.0, *) {
							Button {
								viewModel.refresh()
							} label: {
								HStack {
									Text("Neu laden")
									Spacer()
									Image(systemName: "arrow.clockwise")
										.font(Font.body.weight(.semibold))
								}
								.frame(maxWidth: .infinity)
							}
							.tint(.gray)
							.controlSize(.large)
							.buttonStyle(.borderedProminent)
						}
					}
					
					/*
					ForEach(0..<7) { dayOffset in
						let day = Calendar.current.date(byAdding: DateComponents(day: dayOffset), to: week.interval.start)
						
						VStack(alignment: .leading, spacing: 0) {
							/*
							Text(WeekView.dateFormatter.string(from: day!))
							
							Spacer()
								.frame(height: 4)
							
							/*
							Divider()
							VStack(alignment: .leading, spacing: 0) {
								Text("ABC")
									.frame(height: minRowHeight)
								Divider()
							}
							*/
							
							
							Card(title: "Pyramidentraining Woche 1-4") {
								VStack {
									HStack(spacing: 0) {
										Text("Tag 1/4 (16:30-16:45): ")
											.bold()
										
										Text("Brust, Bizeps, Bauch")
									}
									.foregroundColor(.white)
									.frame(maxWidth: .infinity, alignment: .leading)
								}
								
							} background: {
								Color.accentColor // Color.green
							}
							 */
							
							StackedCard(title: "Pyramidentraining Woche 1-4", stackedTitle: "\(WeekView.dateFormatter.string(from: day!))", stackedTitle2: "16:30 - 16:45") { //(16:30-16:45)
								VStack {
									HStack(spacing: 0) {
										Text("Tag 1/4: ")
											.bold()
										
										Text("Brust, Bizeps, Bauch")
									}
									.foregroundColor(.white)
									.frame(maxWidth: .infinity, alignment: .leading)
								}
							 
							} background: {
								Color.accentColor // Color.green
							}
						}
					}
					*/
					
					/*
					if week.interval.contains(Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 3))!) {
						if viewModel.sessions.count != 0 {
							StackedCard(title: "Oberkörper 1", stackedTitle: "Do, 3. Mär 2022", stackedTitle2: "10:32 - 12:40") { //(16:30-16:45)
								VStack {
									/*
									HStack(spacing: 0) {
										Text("Tag 1/4: ")
											.bold()
										
										Text("Brust, Bizeps, Bauch")
									}
									.foregroundColor(.white)
									.frame(maxWidth: .infinity, alignment: .leading)
									 */
								}
							} background: {
								Color.accentColor // Color.green
							}
							.onTapGesture {
								navigate = true
							}
						}
					}
					 */
					
					ForEach(viewModel.sessions!.filter({ session in week.interval.contains(session.date2) }), id: \.id) { session in
						StackedCard(title: session.workoutPlan.name, stackedTitle: "\(WeekView.dateFormatter.string(from: session.date2))", stackedTitle2: session.endTime == nil ? "\(session.startTime)" : "\(session.startTime) - \(session.endTime!)") {
							VStack {
								/*
								HStack(spacing: 0) {
									Text("Tag 1/4: ")
										.bold()
									
									Text("Brust, Bizeps, Bauch")
								}
								.foregroundColor(.white)
								.frame(maxWidth: .infinity, alignment: .leading)
								 */
							}
						} background: {
							Color.accentColor // Color.green
						}
						.onTapGesture {
							self.session = session
							navigate = true
						}
					}
					
					NavigationLink(destination: HealthDataView(session: $session), isActive: $navigate) {
						EmptyView()
					}
					
					Spacer()
						.frame(height: 20)
				}
				.frame(maxWidth: .infinity, alignment: .topLeading)
				.padding(.horizontal, margin(for: UIScreen.main.bounds.width))
			}
			/*
			.onRefresh(spinningColor: .gray, text: "", textColor: .gray, backgroundColor: .white) { refreshControl in
				viewModel.refresh(refreshControl: refreshControl)
			}
			*/
		}
	}
}

struct Month {
	let year: Int
	let month: Int
	
	init(_ date: Date) {
		let comps = Calendar.current.dateComponents([ .year, .month ], from: date)
		
		self.year = comps.year!
		self.month = comps.month!
	}
	
	func makeIterator() -> MonthIterator {
		return MonthIterator(self)
	}
}

struct MonthIterator: IteratorProtocol, Sequence {
	let calendar: Calendar
	let month: Month
	
	var counter = 0
	var nextDate: Date?
	
	init(_ month: Month) {
		var calendar = Calendar.current
		calendar.minimumDaysInFirstWeek = 1
		
		self.calendar = calendar
		self.month = month
		
		let currentDate = calendar.date(from: DateComponents(year: month.year, month: month.month))
		
		if currentDate != nil {
			if calendar.dateComponents([ .weekday ], from: currentDate!).weekday! == calendar.firstWeekday {
				self.nextDate = calendar.date(byAdding: DateComponents(day: 1), to: currentDate!)
			} else {
				self.nextDate = currentDate
			}
		} else {
			self.nextDate = nil
		}
	}
	
	mutating func next() -> Week? {
		guard nextDate != nil else {
			return nil
		}
		
		guard let _week = calendar.dateInterval(of: .weekOfMonth, for: nextDate!) else {
			return nil
		}
		
		let comps = DateComponents(year: month.year, month: month.month, weekday: calendar.firstWeekday)
		nextDate = calendar.nextDate(after: nextDate!, matching: comps, matchingPolicy: .nextTime) // TODO: matching policy
		
		if nextDate != nil {
			nextDate = calendar.date(byAdding: DateComponents(day: 1), to: nextDate!)
		}
		
		var week = _week
		week.end = calendar.date(byAdding: DateComponents(second: -1), to: week.end)!
		
		counter += 1
		return Week(month: month, week: counter, week)
	}
}


struct Week: Identifiable {
	let id: Int
	
	let interval: DateInterval
	
	/*
	let month: Month
	let week: Int
	*/
	
	let startDay: Int
	let endDay: Int
	
	init(month: Month, week: Int, _ interval: DateInterval) {
		self.id = week
		// self.id = Int("\(month.year)\(month.month)\(week)")!
		
		/*
		self.month = month
		self.week = week
		*/
		
		startDay = Calendar.current.dateComponents([ .day ], from: interval.start).day!
		endDay = Calendar.current.dateComponents([ .day ], from: interval.end).day!
		
		self.interval = interval
	}
}

/*
struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
*/
