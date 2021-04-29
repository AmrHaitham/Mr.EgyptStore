import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mr_egypt_store/Constants.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String image;
  final num price;
  final bool availability;
  final String code;

  const ProductCard(
      {Key key, this.name, this.image, this.price, this.availability, this.code})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _name = name ?? "النوع";
    String _image = image ?? "";
    num _price = price ?? 0;
    bool _availability = availability ?? true;
    String _code = code ?? "";
    // bool addToFav = false;
    return Container(
      width: double.infinity,
      height:MediaQuery.of(context).size.height*0.27,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          if(_image ==null && _image=="")
            Container(
              height:MediaQuery.of(context).size.height*0.27,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/picture.png")
              ),
            ),
          Container(
            height:MediaQuery.of(context).size.height*0.27,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                image: NetworkImage(
                    _image
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white70,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${_name}",style: Constants.blackBoldHeading,),
                    Text("${_price} EG",style: Constants.regularRedHeading,)
                  ],
                ),
              )
          ),
          Align(
            alignment:  Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white70,
              ),
              child: Text("#${_code}",style: Constants.regularBlackHeading,),
            )
          ),
          if(_availability == false)
          Align(
              alignment:  Alignment.topRight,
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Constants.redColor,
                ),
                child: Text("Not Available",style: Constants.regularHeading,),
              )
          )
        ],
      ),
    );
  }
}
