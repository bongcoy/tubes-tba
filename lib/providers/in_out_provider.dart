import 'package:flutter/material.dart';
import 'package:tubes_tba/providers/finite_automata.dart';

class InOutProvider with ChangeNotifier {
  String? inputUser;
  bool? result;

  void setResult(String input){
    inputUser = input;
    result = true;
    print(FiniteAutomata().transitionList.length);
    notifyListeners();
  }

  void emptyInput(){
    if ((inputUser != "" || inputUser != null) && result != null){
      inputUser = null;
      result = null;
      notifyListeners();
    }
  }

}