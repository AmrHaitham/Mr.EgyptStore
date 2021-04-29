import 'package:flutter/material.dart';
import 'package:mr_egypt_store/Constants.dart';
import 'package:mr_egypt_store/screens/LoginPage.dart';
import 'package:mr_egypt_store/services/UserInfo.dart';

class LogInBtn extends StatelessWidget {
  UserInfo _userInfo = UserInfo();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(_userInfo.getUserID());
        if(_userInfo.ifAnonymous()){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }
        else{

        }
      },
      child: Container(
        width: 100,
        margin: EdgeInsets.only(top: 8,bottom: 8,right: 10),
        decoration: BoxDecoration(
          color: Constants.redColor,
          borderRadius: BorderRadius.circular(10),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.5),
          //     spreadRadius: 5,
          //     blurRadius: 7,
          //     offset: Offset(0, 3), // changes position of shadow
          //   ),
          // ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("Login",style: Constants.regularHeading,),
            ),
            Padding(
              padding: const EdgeInsets.only(right:3,left: 15),
              child: Icon(Icons.login),
            ),
          ],
        ),
      ),
    );
  }
}
