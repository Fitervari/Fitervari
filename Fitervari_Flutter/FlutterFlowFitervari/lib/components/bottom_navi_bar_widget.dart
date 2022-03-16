import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../plan_page/plan_page_widget.dart';
import '../profile_page/profile_page_widget.dart';
import '../statistic_page/statistic_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNaviBarWidget extends StatefulWidget {
  const BottomNaviBarWidget({Key? key}) : super(key: key);

  @override
  _BottomNaviBarWidgetState createState() => _BottomNaviBarWidgetState();
}

class _BottomNaviBarWidgetState extends State<BottomNaviBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if ((FFAppState().NavBarPage) == 0)
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: FaIcon(
              FontAwesomeIcons.chartBar,
              color: Color(FFAppState().systemColor),
              size: 30,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
        if ((FFAppState().NavBarPage) != 0)
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: FaIcon(
              FontAwesomeIcons.chartBar,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () async {
              setState(() => FFAppState().NavBarPage = 0);
              await Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => StatisticPageWidget(),
                ),
                (r) => false,
              );
            },
          ),
        if ((FFAppState().NavBarPage) == 1)
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: FaIcon(
              FontAwesomeIcons.running,
              color: Color(FFAppState().systemColor),
              size: 30,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
        if ((FFAppState().NavBarPage) != 1)
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: FaIcon(
              FontAwesomeIcons.running,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () async {
              setState(() => FFAppState().NavBarPage = 1);
              await Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => PlanPageWidget(),
                ),
                (r) => false,
              );
            },
          ),
        if ((FFAppState().NavBarPage) == 2)
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: FaIcon(
              FontAwesomeIcons.userAlt,
              color: Color(FFAppState().systemColor),
              size: 25,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
        if ((FFAppState().NavBarPage) != 2)
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: FaIcon(
              FontAwesomeIcons.userAlt,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () async {
              setState(() => FFAppState().NavBarPage = 2);
              await Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePageWidget(),
                ),
                (r) => false,
              );
            },
          ),
      ],
    );
  }
}
