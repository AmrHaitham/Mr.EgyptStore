// Developed by ENG Amr Haitham amro88981@gmail.com
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_egypt_store/Constants.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool outlineBtn;
  final bool isLoading;
  final IconData bIcon;
  final Color iconColor;

   CustomBtn({Key key, this.text, this.onPressed, this.outlineBtn,this.isLoading, this.bIcon, this.iconColor}) : super(key: key);
  double chight ;
  @override
  Widget build(BuildContext context) {
    bool _outlineBtn = outlineBtn ?? false ;
    bool _isLoading = isLoading ?? false ;

    if(MediaQuery.of(context).size.height<683.4285714285714) {
      chight = 40;
    }
    else {
      chight = 60;
    }
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: chight,
        decoration: BoxDecoration(
          color: _outlineBtn ? Colors.transparent :Constants.grayColor,
          border: Border.all(
              color: Constants.grayColor,
              width: 2.0
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16
        ),
        child: Stack(
          children:[
            Visibility(
              visible: _isLoading ? false : true ,
              child:Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(bIcon,color: iconColor,),
                  Text(
                  text ?? "Text",
                  style: TextStyle(
                    fontSize: 17.0,
                    color:  _outlineBtn ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                  ),
                  Container()
                ],
              ),
            )
            ),
            Visibility(
              visible: _isLoading,
              child:Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(),
              ),
            )
            )
          ]
        ),
      ),
    );
  }
}
