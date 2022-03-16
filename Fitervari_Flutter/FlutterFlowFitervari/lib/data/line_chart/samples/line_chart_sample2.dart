import 'package:fitervari_flutter/app_state.dart';
import 'package:fitervari_flutter/data/healthdata.dart';
import 'package:fitervari_flutter/flutter_flow/flutter_flow_util.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({Key? key}) : super(key: key);

  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: TextButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'avg',
              style: TextStyle(
                  fontSize: 12,
                  color:
                      showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            if (value == 0) return '0';
            if (value ==
                getMaxXHealthdata(DateTime(DateTime.now().year,
                    DateTime.now().month, DateTime.now().day - 4)))
              return getMaxXHealthdata(DateTime(DateTime.now().year,
                      DateTime.now().month, DateTime.now().day - 4))
                  .toString();
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            if (value == getMaxYHealthdata)
              return getMaxYHealthdata().toString();
            if (value == 0) return '0';
            return '';
          },
          reservedSize: 32,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.white, width: 1),
      ),
      minX: 8.8,
      maxX: 13.2,
      minY: 0,
      maxY: getMaxYHealthdata(),
      lineBarsData: [
        LineChartBarData(
          spots: getDatapoints(),
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}

double getMaxXHealthdata(DateTime dateTime) {
  double maxh = 0;
  for (Healthdata healthdata in FFAppState().userHealthdata!) {
    if (double.parse(DateTime.parse(healthdata.time).hour.toString()) > maxh)
      maxh = double.parse(DateTime.parse(healthdata.time).hour.toString());
  }
  return maxh;
}

double getMaxYHealthdata() {
  double maxh = 0;
  for (Healthdata healthdata in FFAppState().userHealthdata!) {
    if (healthdata.value > maxh)
      maxh = healthdata.value;
  }
  return maxh;
}

List<FlSpot> getDatapoints() {
  List<FlSpot> datapoints = [];

  for (Healthdata healthdata in FFAppState().userHealthdata!) {
    if (DateTime.parse(healthdata.time).day == 2)
      datapoints.add(
        FlSpot(
          double.parse((DateTime.parse(healthdata.time).hour +
                  1 * (DateTime.parse(healthdata.time).minute / 60))
              .toString()),
          healthdata.value,
        ),
      );
  }
  return datapoints;
}
