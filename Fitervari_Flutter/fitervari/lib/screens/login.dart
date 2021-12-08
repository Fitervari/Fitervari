import 'package:fitervari/services/qrcodescan.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class LoginScreen extends StatefulWidget {
  createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    if ('qrcodeabfrage' == null) {
      Navigator.pushReplacementNamed(context, '/topics');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/Asset 3@4x.png',
              width: 150,
              height: 150,
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Fitervari',
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'the easy way to train',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ]),
            Text(
                'Trainieren leicht gemacht mit Unterstützung von personalisierten Trainingsplänen und detaillierten Trainingsstatistiken.'),
            LoginButton(
              text: 'LOGIN MIT QR-CODE',
              icon: FontAwesomeIcons.qrcode,
              color: Colors.black45,
              //loginMethod: auth.googleSignIn,
            ),
            //LoginButton(text: 'Continue as Guest', loginMethod: auth.anonLogin)
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;

  const LoginButton(
      {Key? key,
      required this.text,
      required this.icon,
      this.color = Colors.black45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: FlatButton.icon(
        padding: EdgeInsets.all(30),
        icon: Icon(icon, color: Colors.white),
        color: color,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const QRViewExample()),
          );
          if (QRViewExample == null) {
            Navigator.pushReplacementNamed(context, '/topics');
          }
        },
        label: Expanded(
          child: Text('$text', textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
