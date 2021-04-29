import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mr_egypt_store/Constants.dart';
import 'package:mr_egypt_store/screens/HomeScreen.dart';
import 'package:mr_egypt_store/services/UserInfo.dart';
class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  UserInfo _userInfo = UserInfo();

  int state = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color:Constants.grayColor,
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Constants.redColor,
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(20),
                child: ListTile(
                  leading: Icon(Icons.account_circle,size: 50,color: Colors.white,),
                  title: Text('HI GUEST',style: Constants.boldHeading,),
                  subtitle: Text('Egypt',style: Constants.regularHeading,),
                  onTap: () => {

                  },
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 5000),
                curve: Curves.fastLinearToSlowEaseIn,
                margin: EdgeInsets.only(bottom: 10 , top: 10,right: 30),
                decoration: BoxDecoration(
                  color:(state == 0)?Constants.blueColor:Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
                ),
                child: ListTile(
                    leading: Icon(Icons.home_filled,size: 30,color: (state == 0)?Colors.white:Colors.black,),
                    title: Text('Home',style: (state == 0)?Constants.boldHeading:Constants.blackBoldHeading,),
                    onTap: (){
                      // Navigator.pushReplacement(context,
                      // MaterialPageRoute(
                      // builder: (context)=>Home()));
                      setState(() {
                        state = 0;
                      });
                    },
                  ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 5000),
                curve: Curves.fastLinearToSlowEaseIn,
                margin: EdgeInsets.only(bottom: 10 , top: 10,right: 30),
                decoration: BoxDecoration(
                    color:(state == 1)?Constants.blueColor:Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
                ),
                child: ListTile(
                  leading: Icon(Icons.list_alt,size: 30,color: (state == 1)?Colors.white:Colors.black),
                  title: Text('Your Orders',style: (state == 1)?Constants.boldHeading:Constants.blackBoldHeading,),
                  onTap: (){
                   setState(() {
                     state = 1;
                   });
                  },
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 5000),
                curve: Curves.fastLinearToSlowEaseIn,
                margin: EdgeInsets.only(bottom: 10 , top: 10,right: 30),
                decoration: BoxDecoration(
                    color:(state == 2)?Constants.blueColor:Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
                ),
                child: ListTile(
                  leading: Icon(Icons.local_offer_outlined,size: 30,color: (state == 2)?Colors.white:Colors.black),
                  title: Text('Offers',style: (state == 2)?Constants.boldHeading:Constants.blackBoldHeading,),
                  onTap: (){
                    setState(() {
                      state = 2;
                    });
                  },
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 5000),
                curve: Curves.fastLinearToSlowEaseIn,
                margin: EdgeInsets.only(bottom: 10 , top: 10,right: 30),
                decoration: BoxDecoration(
                    color:(state == 3)?Constants.blueColor:Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
                ),
                child: ListTile(
                  leading: Icon(Icons.favorite,size: 30,color: (state == 3)?Colors.white:Colors.black),
                  title: Text('Favorites',style: (state == 3)?Constants.boldHeading:Constants.blackBoldHeading,),
                  onTap: (){
                    setState(() {
                      state = 3;
                    });
                  },
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 5000),
                curve: Curves.fastLinearToSlowEaseIn,
                margin: EdgeInsets.only(bottom: 10 , top: 10,right: 30),
                decoration: BoxDecoration(
                    color:(state == 4)?Constants.blueColor:Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
                ),
                child: ListTile(
                  leading: Icon(Icons.border_color,size: 30,color: (state == 4)?Colors.white:Colors.black),
                  title: Text('About',style: (state == 4)?Constants.boldHeading:Constants.blackBoldHeading,),
                  onTap: (){
                    setState(() {
                      state = 4;
                    });
                  },
                ),
              ),
              if(_userInfo.ifAnonymous()!=true)
                Container(
                  margin: EdgeInsets.only(left: 30,right: 30,top: MediaQuery.of(context).size.height*0.35),
                  decoration: BoxDecoration(
                    color: Constants.redColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                      onPressed: (){

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.logout,size: 30,color: Colors.white,),
                          Text('Logout',style: Constants.boldHeading,),
                          Container(width: 30,)
                        ],
                    )
                  ),
                )
            ],
          ),
        ),
    );
  }
}
