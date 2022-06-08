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

        if (_checkIsAccepting(currentTransition.nextState)){
          if (state == FAState.q11 && charList[idxChar+1] == "t"){ // kondisi khusus (karena ada final state di tengah)
            state = FAState.q20;
          }else{
            print("Kata saat ini: '$currentWord' adalah VALID");
            separatedResultWord.add({currentWord: true});
            state = FAState.q0;
            currentWord = "";
          }
        }else{
          state = currentTransition.nextState;
        }

      }else{
        print("State = $state, CurrChar = ${charList[idxChar]}, CurrWord = $currentWord");
        // currentTransition = _searchTransition(state, charList[idxChar]);

        if (idxChar <= charList.length-2){
          separatedResultWord.add({currentWord: false});
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