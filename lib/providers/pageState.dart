import 'package:flutter/material.dart';
class PageState with ChangeNotifier{
  int _pageNumber = 0;

  int get pageNumber => _pageNumber;

  void setPageNumber(int num){
    _pageNumber = num;
    notifyListeners();
  }
}