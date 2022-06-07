import 'package:flutter/material.dart';

class InOutProvider with ChangeNotifier {
  String? inputUser;
  bool? result;

  void setResult(String input){
    inputUser = input;
    result = true;
    notifyListeners();
  }

}