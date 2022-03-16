import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class ShadowButton extends StatefulWidget {
  ShadowButton({
    Key? key,
    this.buttonColor = Colors.red,
    this.buttonText = "404",
    this.width = 50,
    this.hight = 20,
    this.iconsymbol,
    required this.Tapactivation,
  }) : super(key: key);
  final double width;
  final double hight;
  final Icon? iconsymbol;
  final Color buttonColor;
  final String buttonText;
  Function? Tapactivation;
  @override
  _ShadowButtonState createState() => _ShadowButtonState();
}

class _ShadowButtonState extends State<ShadowButton> {
  bool _isElevated = true;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isElevated = !_isElevated;
        });
        if (widget.Tapactivation != null) widget.Tapactivation!();
      },
      child: AnimatedContainer(
      duration: const Duration(microseconds: 150),
      width: widget.width,
      height: widget.hight,
      decoration: BoxDecoration(
        color: widget.buttonColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: _isElevated
            ? [
                BoxShadow(
                  blurRadius: 15,
                  color: Colors.grey[500]!,
                  offset: Offset(4, 4),
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1,
                )
              ]
            : null,
      ),
      child: Container(
        width: widget.width,
        height: widget.hight,
        decoration: BoxDecoration(
          //color: Color(0x65090F13),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: widget.iconsymbol != null ? 
                      widget.iconsymbol! :Text(
                        widget.buttonText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
        ),
    );
  }

  static String utf8convert(String text) {
    List<int> bytes = text.toString().codeUnits;
    return utf8.decode(bytes);
  }
}
