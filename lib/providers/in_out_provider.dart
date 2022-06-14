import 'package:flutter/material.dart';
import 'package:tubes_tba/models/fa_transition.dart';
import 'package:tubes_tba/providers/finite_automata.dart';

class InOutProvider with ChangeNotifier {
  String? inputUser;
  String? processedInput;
  List<Map<String,bool>> separatedResultWord = [];
  List<String>? acceptedSentence;
  List<String> stack = [];
  bool? grammarResult;

  void setResult(String input){
    inputUser = input == "" ? null : input;
    processedInput = inputUser == null ? null : "${inputUser!.toLowerCase()}#";
    acceptedSentence = [];

    stack.add("#");
    stack.add("G");

    _lexicalAnalyzer();
    _parser();

    notifyListeners();
  }

  void emptyInput(){
    if (inputUser == null && separatedResultWord.isNotEmpty){
      inputUser = null;
      separatedResultWord.clear();
      acceptedSentence?.clear();
      stack.clear();
    }
  }

  bool _checkIsAccepting(FAState state){
    return FiniteAutomata().acceptingState.contains(state);
  }

  FATransition? _searchTransition(FAState currentState, String currentSymbol){
    for (FATransition trans in FiniteAutomata().transitionList){
      if (trans.currentState == currentState && trans.currentSymbol == currentSymbol){
        return trans;
      }
    }
    return null;
  }

  void _lexicalProcess(List<String> charList){
    FAState state = FAState.q0;
    FATransition? currentTransition;
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
            // debugPrint("Kata saat ini: '$currentWord' adalah VALID");
            separatedResultWord.add({currentWord: true});
            acceptedSentence?.add(currentWord.trim());
            state = FAState.q0;
            currentWord = "";
          }
        }else{
          state = currentTransition.nextState;
        }

      }else{
        separatedResultWord.add({currentWord: false});
        currentWord = "";
        state = FAState.q0;
      }

      idxChar++;
    }

  }

  void _lexicalAnalyzer(){
    List<String>? charList = processedInput?.split("");

    try {
      if (charList != null){
        _lexicalProcess(charList);
      }
    }catch (err) {
      rethrow;
    }
  }

  void _parseProcess(){

  }

  void _parser(){
    try {
      _parseProcess();
    }catch (err) {
      rethrow;
    }
  }
}