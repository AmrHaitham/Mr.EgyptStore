import 'package:flutter/material.dart';
import 'package:mr_egypt_store/Constants.dart';
import 'package:provider/provider.dart';
import 'package:mr_egypt_store/providers/pageState.dart';

class PageDrawerWidget extends StatelessWidget {
  @required final String name ;
  @required final int num;
  @required final Function onTab;
  @required final IconData icon;

  const PageDrawerWidget({Key key, this.name, this.num, this.onTab, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  AnimatedContainer(
      duration: Duration(milliseconds: 100),
      curve: Curves.slowMiddle,
      margin: EdgeInsets.only(bottom: 10 , top: 10,right: 30),
      decoration: BoxDecoration(
          color:(context.watch<PageState>().pageNumber == num)?Constants.blueColor:Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
      ),
      child: ListTile(
        leading: Icon(icon,size: 30,color: (context.watch<PageState>().pageNumber == num)?Colors.white:Colors.black,),
        title: Text('${name}',style: (context.watch<PageState>().pageNumber == num)?Constants.boldHeading:Constants.blackBoldHeading,),
        onTap: (){
          context.read<PageState>().setPageNumber(num);
          onTab();
        }
      ),
    );
  }
}
