import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mr_egypt_store/Constants.dart';
import 'package:mr_egypt_store/screens/HomeScreen.dart';
import 'package:mr_egypt_store/services/UserInfo.dart';
import 'package:mr_egypt_store/widgets/pageDraweWidget.dart';
import 'package:provider/provider.dart';
import 'package:mr_egypt_store/providers/pageState.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  UserInfo _userInfo = UserInfo();

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
              PageDrawerWidget(
                icon: Icons.home_filled,
                name: "Home",
                num: 0,
                onTab: (){

                },
              ),
              PageDrawerWidget(
                icon: Icons.list_alt,
                name: 'Your Orders',
                num: 1,
                onTab: (){

                },
              ),
              PageDrawerWidget(
                icon: Icons.local_offer_outlined,
                name: 'Offers',
                num: 2,
                onTab: (){

                },
              ),
              PageDrawerWidget(
                icon: Icons.favorite,
                name: 'Favorites',
                num: 3,
                onTab: (){

                },
              ),
              PageDrawerWidget(
                icon: Icons.border_color,
                name: 'About',
                num: 4,
                onTab: (){

                },
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
