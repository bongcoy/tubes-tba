import 'package:flutter/material.dart';

class InOutProvider with ChangeNotifier {
  String? inputUser;
  bool? result;

  void getResult(){
    result = true;
    notifyListeners();
  }

  void setInput(){

  }
}