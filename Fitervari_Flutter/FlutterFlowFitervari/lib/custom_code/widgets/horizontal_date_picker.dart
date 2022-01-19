// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:calendar_timeline/calendar_timeline.dart';

class HorizontalDatePicker extends StatefulWidget {
  const HorizontalDatePicker({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _HorizontalDatePickerState createState() => _HorizontalDatePickerState();
}

class _HorizontalDatePickerState extends State<HorizontalDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: CalendarTimeline(
        initialDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
        firstDate: DateTime(2019, 1, 1),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        onDateSelected: (date) => print(date),
        leftMargin: 0,
        monthColor: Color(FFAppState().systemColor),
        dayColor: Color(FFAppState().systemColor),
        activeDayColor: Colors.white,
        activeBackgroundDayColor: Color(FFAppState().systemColor),
        dotsColor: Colors.blue,
        selectableDayPredicate: (date) => date.day != 23,
        locale: 'en_ISO',
      ),
    );
  }
}
