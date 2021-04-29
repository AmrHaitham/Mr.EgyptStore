import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mr_egypt_store/Constants.dart';
import 'package:mr_egypt_store/screens/ProductDetails.dart';
import 'package:mr_egypt_store/services/Collections.dart';
import 'package:mr_egypt_store/services/UserInfo.dart';
import 'package:mr_egypt_store/widgets/Custom_input.dart';
import 'package:mr_egypt_store/widgets/LogInBtn.dart';
import 'package:mr_egypt_store/widgets/NavDrawer.dart';
import 'package:mr_egypt_store/widgets/ProductCard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  String _searchValue;
  Collections _collections = Collections();
  UserInfo _userInfo = UserInfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
          title: Text("MR. EGYPT",style: Constants.boldHeading,),
          centerTitle: true,
          actions: [
            if(_userInfo.ifAnonymous()==true)
            LogInBtn()
          ],
        elevation: 0,
      ),
      body: Stack(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream:(_searchValue =="" || _searchValue ==null)
                  ?_collections.getProductRef().snapshots()
                  :_collections.getProductRef().where("code", isEqualTo: _searchValue).snapshots(),
              builder: (context,snapshot){
                return (snapshot.connectionState == ConnectionState.waiting)
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                    padding: EdgeInsets.only(
                      top: 90,
                      left: 10,
                      right: 10,
                    ),
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (ctx, index) {
                      DocumentSnapshot document = snapshot.data.docs[index];
                      return Container(
                        padding: const EdgeInsets.all(12),
                        child: GestureDetector(
                          child: ProductCard(
                            name: document.data()['name'],
                            image: document.data()['image'][0],
                            price: document.data()['price'],
                            code: document.data()['code'],
                            availability: document.data()['availability'],
                          ),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProductDetail(documentSnapshot: document,)),
                            );
                          },
                        ),
                      );
                    });
              }),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.11,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(28), bottomRight: Radius.circular(28)),
                  gradient: LinearGradient(
                      colors: [
                        Theme.of(context).accentColor,
                        Theme.of(context).accentColor.withOpacity(0)
                      ],
                      begin: Alignment(0,0),
                      end: Alignment(0,15)
                  )
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Custom_input(
              hint: "search by code...",
              onChanged: (value){
                _searchValue = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
