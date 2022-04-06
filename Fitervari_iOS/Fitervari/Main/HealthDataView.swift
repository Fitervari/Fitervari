//
//  HealthDataView.swift
//  Fitervari
//
//  Created by Tobias Kern on 15.03.22.
//

import SwiftUI
import Charts
import SwiftUICharts

struct HealthDataView: View {
	@Binding var session: WorkoutSessionDetailed?
	
    var body: some View {
		let values = session!.healthData
			.filter({ hd in
				hd.type == "Puls"
			})
		
		let kvalues = session!.healthData
			.filter({ hd in
				hd.type == "kcal"
			})
		
		let kvalcum = kvalues.reduce(into: []) { $0.append(($0.last ?? 0) + $1.value) }
		
		let dp = values.map { val -> LineChartDataPoint in
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = "mm:ss"
			return LineChartDataPoint(value: val.value) //, xAxisLabel: dateFormatter.string(from: val.time))
		}
		
		let kdp = kvalcum.map { val -> LineChartDataPoint in
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = "mm:ss"
			return LineChartDataPoint(value: val) // , xAxisLabel: dateFormatter.string(from: val.time))
		}
		
		VStack {
			if(dp.count > 0) {
				PulseGraphView(data: LineChartData.init(dataSets: LineDataSet(dataPoints: dp, legendTitle: "Puls", style: LineStyle(lineType: .curvedLine, strokeStyle: Stroke(lineWidth: 2))), metadata: ChartMetadata(title: "Puls"), xAxisLabels: getXLabels(data: values), chartStyle: LineChartStyle(infoBoxPlacement: .header, xAxisLabelsFrom: .chartData()))) //, rawData: values)
			} else {
				Text("Für die Metrik Puls sind keine Gesundheitsdaten verfügbar.")
					.frame(maxWidth: .infinity, alignment: .topLeading)
			}
			
			Spacer()
				.frame(height: 60)
			
			if(kdp.count > 0) {
				CaloriesGraphView(data: LineChartData.init(dataSets: LineDataSet(dataPoints: kdp, legendTitle: "Kalorien", style: LineStyle(lineType: .curvedLine, strokeStyle: Stroke(lineWidth: 2))), metadata: ChartMetadata(title: "Kalorien"), xAxisLabels: getXLabels(data: kvalues), chartStyle: LineChartStyle(infoBoxPlacement: .header, xAxisLabelsFrom: .chartData())))
			} else {
				Text("Für die Metrik Kalorien sind keine Gesundheitsdaten verfügbar.")
					.frame(maxWidth: .infinity, alignment: .topLeading)
			}
			
			//Spacer()
				//.frame(height: 300)
		}
		.padding(margin(for: UIScreen.main.bounds.width))
		.navigationTitle("Gesundheitsdaten")
		.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
	
	func getXLabels(data: [HealthDataProcessed]) -> [String] {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "mm:ss"
		
		let middleIndex = (data.endIndex + data.startIndex) / 2
		let fMiddleIndex = (data.startIndex + middleIndex) / 2
		let lMiddleIndex = (data.endIndex + middleIndex) / 2
		
		if data.count < 3 {
			return []
		} else if data.count == 4 {
			return [
				dateFormatter.string(from: data.first!.time),
				dateFormatter.string(from: data[fMiddleIndex].time),
				// dateFormatter.string(from: data[middleIndex].time),
				dateFormatter.string(from: data[lMiddleIndex].time),
				dateFormatter.string(from: data.last!.time),
			]
		} else {
			return [
				dateFormatter.string(from: data.first!.time),
				dateFormatter.string(from: data[fMiddleIndex].time),
				dateFormatter.string(from: data[middleIndex].time),
				dateFormatter.string(from: data[lMiddleIndex].time),
				dateFormatter.string(from: data.last!.time),
			]
		}
	}
}

struct PulseGraphView: View {
	var data: LineChartData
	// var rawData: [HealthDataProcessed]
	
	var body: some View {
		LineChart(chartData: data)
			.touchOverlay(chartData: data, unit: .suffix(of: "bpm"))
			.averageLine(chartData: data, markerName: "Durchschnitt", lineColour: .primary, strokeStyle: StrokeStyle(lineWidth: 2, dash: [5,10]))
			// .linearTrendLine(chartData: data, firstValue: Double(rawData.first!.value), lastValue: Double(rawData.last!.value), lineColour: ColourStyle(colour: Color.blue), strokeStyle: StrokeStyle(lineWidth: 2, dash: [5, 10]))
			.yAxisGrid(chartData: data)
			.xAxisGrid(chartData: data)
			.yAxisLabels(chartData: data)
			.xAxisLabels(chartData: data)
			.headerBox(chartData: data)
			.legends(chartData: data)
			//.aspectRatio(3, contentMode: .fit)
	}
}

struct CaloriesGraphView: View {
	var data: LineChartData
	
	var body: some View {
		FilledLineChart(chartData: data)
			.touchOverlay(chartData: data, unit: .suffix(of: "cal"))
			// 	.averageLine(chartData: data, markerName: "Durchschnitt", lineColour: .primary, strokeStyle: StrokeStyle(lineWidth: 2, dash: [5,10]))
			.yAxisGrid(chartData: data)
			.xAxisGrid(chartData: data)
			.yAxisLabels(chartData: data)
			.xAxisLabels(chartData: data)
			.headerBox(chartData: data)
			.legends(chartData: data)
			//.aspectRatio(3, contentMode: .fit)
	}
}

/*
struct HealthDataView_Previews: PreviewProvider {
    static var previews: some View {
        HealthDataView()
    }
}
*/
