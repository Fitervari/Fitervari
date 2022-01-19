import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../plan_page/plan_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Image.network(
                  'https://i.picsum.photos/id/954/200/300.jpg?blur=5&hmac=RNpIMbo-9KoPawkYMH5aSZJ08inob3vLakxpQF2CSE0',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.06),
                child: Text(
                  'Trainieren leicht gemacht mit Unterstützung von personalisierten Trainingsplänen und detaillierten Trainingsstatistiken.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.title3.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFFD85555),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.85),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlanPageWidget(),
                      ),
                      (r) => false,
                    );
                    setState(() => FFAppState().NavBarPage = 1);
                  },
                  text: 'Login mit QR-Code',
                  options: FFButtonOptions(
                    width: 180,
                    height: 40,
                    color: Color(FFAppState().systemColor),
                    textStyle: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.06, -0.8),
                child: Image.asset(
                  'assets/images/Asset_3@4x.png',
                  width: 170,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.42),
                child: Text(
                  'Fitervari',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.title1.override(
                    fontFamily: 'Poppins',
                    color: Colors.red,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.32),
                child: Text(
                  'the easy way to train',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.title3.override(
                    fontFamily: 'Poppins',
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
