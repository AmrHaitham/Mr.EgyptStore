import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_egypt_store/Constants.dart';
import 'package:mr_egypt_store/widgets/Custom_input.dart';
import 'package:mr_egypt_store/widgets/custom_btn.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double height = 0;
  double height2 = 0;
  bool fullScreen = true;
  Color cont1 = Constants.blueColor;
  Color cont2 = Constants.blueColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.grayColor,
      body: Stack(
        children: [
          AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              curve: Curves.fastLinearToSlowEaseIn,
              height: fullScreen ?MediaQuery.of(context).size.height:MediaQuery.of(context).size.height*0.5,
              decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/loginBackground.jpeg"),
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop),
                fit: BoxFit.cover,
              ),
            )
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2),
                child: Text(
                  "Welcome to our store",
                  style: Constants.blackBoldHeading,
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:50.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomBtn(text: "Get Started",onPressed: (){
                setState(() {
                  height = MediaQuery.of(context).size.height*0.7;
                  fullScreen = false;
                });
              },),
              ),
            ),
            Align(
              alignment:Alignment.bottomCenter,
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                curve: Curves.fastLinearToSlowEaseIn,
                height: height,
                decoration: BoxDecoration(
                  color: cont1,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Custom_input(hint: "email",),
                            Custom_input(hint: "password",isPasswordField: true,),
                            CustomBtn(text: "login",bIcon: Icons.login,iconColor: Colors.white,)
                          ],
                        ),
                      ),
                      Divider(color: Constants.grayColor,),
                      Column(
                        children: [
                          SignInButton(
                            Buttons.Facebook,
                            onPressed: () {

                            },
                          ),
                          SignInButton(
                            Buttons.Google,
                            onPressed: () {

                            },
                          ),
                          CustomBtn(text: "Create new ccount",outlineBtn: true,onPressed: (){
                            setState(() {
                              cont1 = Colors.white70;
                              cont2 = Constants.blueColor;
                              height2 = MediaQuery.of(context).size.height*0.68;
                            });
                          },)
                        ],
                      )
                    ],
                  ),
                )
              ),
            ),
          Align(
            alignment:Alignment.bottomCenter,
            child: AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                curve: Curves.fastOutSlowIn,
                height: height2,
                decoration: BoxDecoration(
                    color: cont2,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Custom_input(hint: "Full name",),
                            Custom_input(hint: "email",),
                            Custom_input(hint: "password",isPasswordField: true,),
                            Custom_input(hint: "Confirm password",isPasswordField: true,),
                          ],
                        ),
                      ),
                      CustomBtn(text: "Create Account",onPressed: (){

                      },),
                      CustomBtn(text: "Back to login",outlineBtn: true,onPressed: (){
                        setState(() {
                          cont1 = Constants.blueColor;
                          cont2 = Colors.white70;
                          height = MediaQuery.of(context).size.height*0.7;
                          height2 = 0;
                        });
                      },),
                    ],
                  ),
                )
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: Container(
                width: 50,
                height: 45,
                margin: EdgeInsets.only(top: 10 , left: 20),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back,color: Constants.grayColor,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
