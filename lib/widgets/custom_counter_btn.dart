// Developed by ENG Amr Haitham amro88981@gmail.com
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_egypt_store/Constants.dart';

class CustomCounterBtn extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool outlineBtn;

  const CustomCounterBtn({Key key, this.text, this.onPressed, this.outlineBtn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _outlineBtn = outlineBtn ?? false ;


    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50.0,
        width: _outlineBtn?50:30.0,
        decoration: BoxDecoration(
          color: _outlineBtn ? Colors.transparent :Constants.redColor,
          border: Border.all(
              color: Constants.redColor,
              width: 2.0
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 16
        ),
        child: Stack(
            children:[
              Center(
                    child: Text(
                      text ?? "Text",
                      style: TextStyle(
                          fontSize: 20.0,
                          color:  _outlineBtn ? Colors.black : Colors.white,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
            ]
        ),
      ),
    );
  }
}
