import 'package:flutter/material.dart';
import 'package:tubes_tba/models/transition.dart';
import 'package:tubes_tba/providers/finite_automata.dart';

class InOutProvider with ChangeNotifier {
  String? inputUser;
  String? processedInput;
  List<Map<String,bool>> separatedResultWord = [];

  void setResult(String input){
    inputUser = input == "" ? null : input;
    processedInput = inputUser == null ? null : "${inputUser!.toLowerCase()}#";

    _lexicalAnalyzer();

    notifyListeners();
  }

  void emptyInput(){
    if (inputUser == null && separatedResultWord.isNotEmpty){
      inputUser = null;
      separatedResultWord.clear();
    }
  }

  bool _checkIsAccepting(FAState state){
    return FiniteAutomata().acceptingState.contains(state);
  }

  Transition? _searchTransition(FAState currentState, String currentSymbol){
    for (Transition trans in FiniteAutomata().transitionList){
      if (trans.currentState == currentState && trans.currentSymbol == currentSymbol){
        return trans;
      }else{
        // print("State saat ini: ${currentState}, Symbol saat ini: ${currentSymbol}");
        // print("${trans.currentState}, ${trans.currentSymbol}, ${trans.nextState}");
      }
    }
    return null;
  }

  void _lexicalProcess(List<String> charList){
    FAState state = FAState.q0;
    Transition? currentTransition;
    int idxChar = 0;
    String currentWord = "";

    while(charList[idxChar] != "#"){
      currentTransition = _searchTransition(state, charList[idxChar]);
      currentWord += charList[idxChar];

      if (currentTransition != null){
        state = currentTransition.nextState;

        // print("CHAR SAAT INI ${charList[idxChar]},");
        // print("isAccept = ${_checkIsAccepting(state)}, isLast = ${charList[idxChar] != "#"}");
        if (_checkIsAccepting(state)){
          print("Kata saat ini: '$currentWord' adalah VALID");
          separatedResultWord.add({currentWord: true});
          currentWord = "";
        }
      }else{
        if (charList[idxChar+1] == "#"){
          separatedResultWord.add({currentWord: false});
          currentWord = "";
        }
      }

      idxChar++;
    }

    print("Hasil: $separatedResultWord");
  }

  void _lexicalAnalyzer(){
    List<String>? charList = processedInput?.split("");

    try {
      if (charList != null){
        _lexicalProcess(charList);
      }
    }catch (err) {
      print(err);
      rethrow;
    }

  }
}