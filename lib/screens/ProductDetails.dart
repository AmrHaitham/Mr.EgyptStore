import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_egypt_store/Constants.dart';
import 'package:mr_egypt_store/screens/LoginPage.dart';
import 'package:mr_egypt_store/services/UserInfo.dart';
import 'package:mr_egypt_store/widgets/custom_btn.dart';
import 'package:mr_egypt_store/widgets/custom_counter_btn.dart';
class ProductDetail extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;

  const ProductDetail({Key key, this.documentSnapshot}) : super(key: key);
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  UserInfo _userInfo = UserInfo();
  bool addToFav = false;
  List<String> imageList= [];
  int index = 0;
  List<String> sizeList=['41','42','43','44','45'];
  int q = 1;
  static List<Widget> modelBuilder<M>(
      List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();

  @override
  Widget build(BuildContext context) {
    for(String image in widget.documentSnapshot.data()["image"]){
      imageList.add(image);
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        title: Text("${widget.documentSnapshot['name']}",style: Constants.boldHeading),
        actions: [
          Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white70,
            ),
            child: IconButton(
              icon: Icon(addToFav ? Icons.favorite_outlined:Icons.favorite_border_outlined,color: addToFav ? Constants.redColor :Colors.black ,),
              onPressed: (){
                if(addToFav == false){
                  setState(() {
                    addToFav = true;
                  });
                }else if(addToFav == true){
                  setState(() {
                    addToFav = false;
                  });
                }
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.45,
                decoration: BoxDecoration(
                  color: Constants.blueColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
                ),
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        autoPlay: true
                      ),
                      items: imageList.map((e)=> ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          fit: StackFit.expand,
                          children:[
                            Image.network(
                              e,
                              width: 1000,
                              height: 200,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      )).toList(),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white70
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("${widget.documentSnapshot['price']*q} EG",style: Constants.boldRedHeading,),
                          Row(
                            children: [
                              CustomCounterBtn(text: "+",onPressed: (){
                                setState(() {
                                  q++;
                                });
                              },),
                              CustomCounterBtn(text: "${q}",outlineBtn: true,),
                              CustomCounterBtn(text: "-",onPressed: (){
                                setState(() {
                                  if(q != 1){
                                    q--;
                                  }
                                });
                              },)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Select Size",style: Constants.blackBoldHeading,),
                          Container(
                            height: 100,
                            width: 100,
                            child: CupertinoPicker(
                              itemExtent: 50,
                              onSelectedItemChanged: (index){
                                setState(() {
                                  this.index = index;
                                });
                              },
                              children:modelBuilder<String>(
                                sizeList,
                                    (index, value) {
                                  final isSelected = this.index == index;
                                  final color = isSelected ? Constants.redColor : Colors.black;
                                  return Center(
                                    child: Text(
                                      value,
                                      style: TextStyle(color: color, fontSize: 24),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child:CustomBtn(
              text: "Add to cart",
              bIcon: Icons.add_shopping_cart,
              iconColor: Colors.white,
              onPressed: (){
                if(_userInfo.ifAnonymous()){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                }
                else{

                }
            },)
          ),
        ],
      ),
    );
  }
}
