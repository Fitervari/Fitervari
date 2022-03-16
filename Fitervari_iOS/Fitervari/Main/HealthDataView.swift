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
	var sessions: [WorkoutSession]
	
    var body: some View {
		let values = sessions[0].healthData!
			.filter({ hd in
				hd.type == "Puls"
			})
		
		let kvalues = sessions[0].healthData!
			.filter({ hd in
				hd.type == "kcal"
			})
		
		/*
		let avg = values.reduce(0.0) {
			return $0 + $1/Double(values.count)
		}
		*/
		
		let dp = values.map { val -> LineChartDataPoint in
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = "mm:ss"
			return LineChartDataPoint(value: Double(val.value), xAxisLabel: dateFormatter.string(from: val.time))
		}
		
		let kdp = kvalues.map { val -> LineChartDataPoint in
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = "mm:ss"
			return LineChartDataPoint(value: Double(val.value), xAxisLabel: dateFormatter.string(from: val.time))
		}
		
		VStack {
			/*
			Text("MINIMUM: \(Int(round(values.min()!)))")
				.frame(maxWidth: .infinity, alignment: .leading)
			Text("MAXIMUM: \(Int(round(values.max()!)))")
				.frame(maxWidth: .infinity, alignment: .leading)
			Text("AVERAGE: \(Int(round(avg)))")
				.frame(maxWidth: .infinity, alignment: .leading)
			 */
			
			/*
			LineChart(chartData: LineChartData.init(dataSets: LineDataSet(dataPoints: dp), metadata: ChartMetadata(title: "Puls")))
				.aspectRatio(3, contentMode: .fit)
			
			LineChart(chartData: LineChartData.init(dataSets: LineDataSet(dataPoints: kdp), metadata: ChartMetadata(title: "Kcal")))
				.headerBox(chartData: LineChartData.init(dataSets: LineDataSet(dataPoints: kdp), metadata: ChartMetadata(title: "Kcal")))
				.aspectRatio(3, contentMode: .fit)
			 */
			
			PulseGraphView(data: LineChartData.init(dataSets: LineDataSet(dataPoints: dp, legendTitle: "Puls", style: LineStyle(lineType: .curvedLine, strokeStyle: Stroke(lineWidth: 2))), metadata: ChartMetadata(title: "Puls"), xAxisLabels: getXLabels(data: values), chartStyle: LineChartStyle(infoBoxPlacement: .header, xAxisLabelsFrom: .chartData())), rawData: values)
			
			// Spacer()
//				.frame(height: 60)
			
			// CaloriesGraphView(data: LineChartData.init(dataSets: LineDataSet(dataPoints: kdp), metadata: ChartMetadata(title: "Kalorien (in kcal)"), chartStyle: LineChartStyle(infoBoxPlacement: .header, markerType: .full(attachment: .point), xAxisLabelsFrom: .chartData(rotation: .degrees(0)), baseline: .minimumWithMaximum(of: 5000))))
			
			Spacer()
				.frame(height: 300)
			
			/*
			Spacer()
				.frame(height: 100)
			
			
			Chart(data:
				values.map { v in
					CGFloat(v / values.max()!)
				}
			)
			.chartStyle(
				AreaChartStyle(.quadCurve, fill: Color.blue)
			)
			.aspectRatio(3, contentMode: .fit)
			 */
		}
		.padding(margin(for: UIScreen.main.bounds.width))
		.navigationTitle("Gesundheitsdaten")
    }
	
	func getXLabels(data: [HealthData]) -> [String] {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "mm:ss"
		
		let middleIndex = (data.endIndex + data.startIndex) / 2
		let fMiddleIndex = (data.startIndex + middleIndex) / 2
		let lMiddleIndex = (data.endIndex + middleIndex) / 2
		
		return [
			dateFormatter.string(from: data.first!.time),
			dateFormatter.string(from: data[fMiddleIndex].time),
			dateFormatter.string(from: data[middleIndex].time),
			dateFormatter.string(from: data[lMiddleIndex].time),
			dateFormatter.string(from: data.last!.time),
		]
	}
}

struct PulseGraphView: View {
	var data: LineChartData
	var rawData: [HealthData]
	
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

/*
struct CaloriesGraphView: View {
	var data: LineChartData
	
	var body: some View {
		FilledLineChart(chartData: data)
			.touchOverlay(chartData: data, unit: .suffix(of: "kcal"))
			.yAxisGrid(chartData: data)
			.xAxisGrid(chartData: data)
			.yAxisLabels(chartData: data)
			.xAxisLabels(chartData: data)
			.headerBox(chartData: data)
			.legends(chartData: data)
			//.aspectRatio(3, contentMode: .fit)
	}
}
*/

/*
struct HealthDataView_Previews: PreviewProvider {
    static var previews: some View {
        HealthDataView()
    }
}
*/
