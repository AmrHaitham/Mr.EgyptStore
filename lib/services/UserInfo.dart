import 'package:firebase_auth/firebase_auth.dart';

class UserInfo{
  FirebaseAuth _auth = FirebaseAuth.instance;
  String getUserID(){
    return _auth.currentUser.uid;
  }
  bool ifAnonymous(){
    return _auth.currentUser.isAnonymous;
  }
}