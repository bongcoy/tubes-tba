import 'package:flutter/material.dart';
import 'package:stack/stack.dart' as stk;
import 'package:tubes_tba/models/p_transition.dart';

import '../models/fa_transition.dart';
import '../providers/finite_automata.dart';
import '../providers/parse_table.dart';

class InOutProvider with ChangeNotifier {
  String? inputUser;
  String? processedInput;
  List<Map<String, bool>> separatedResultWord = [];
  List<String>? acceptedSentence;
  stk.Stack<String>? stack;
  bool? grammarResult;

  void setResult(String input) {
    inputUser = input == "" ? null : input;
    processedInput = inputUser == null ? null : "${inputUser!.toLowerCase()}#";

    _lexicalAnalyzer();
    _parser();

    notifyListeners();
  }

  void emptyInput() {
    if (processedInput != null && separatedResultWord.isNotEmpty) {
      inputUser = null;
      separatedResultWord.clear();
      acceptedSentence?.clear();
      stack = null;
      grammarResult = null;

      notifyListeners();
    }
  }

  bool _checkIsAccepting(FAState state) {
    return FiniteAutomata().acceptingState.contains(state);
  }

  FATransition? _searchFATransition(
      FAState currentState, String currentSymbol) {
    for (FATransition trans in FiniteAutomata().transitionList) {
      if (trans.currentState == currentState &&
          trans.currentSymbol == currentSymbol) {
        return trans;
      }
    }
    return null;
  }

  void _lexicalProcess(List<String> charList) {
    FAState state = FAState.q0;
    FATransition? currentTransition;
    int idxChar = 0;
    String currentWord = "";
    acceptedSentence = [];

    while (charList[idxChar] != "#") {
      currentTransition = _searchFATransition(state, charList[idxChar]);
      currentWord += charList[idxChar];

      if (currentTransition != null) {
        if (_checkIsAccepting(currentTransition.nextState)) {
          if (state == FAState.q11 && charList[idxChar + 1] == "t") {
            // kondisi khusus (karena ada final state di tengah)
            state = FAState.q20;
          } else {
            // debugPrint("Kata saat ini: '$currentWord' adalah VALID");
            separatedResultWord.add({currentWord: true});
            acceptedSentence?.add(currentWord.trim());
            state = FAState.q0;
            currentWord = "";
          }
        } else {
          state = currentTransition.nextState;
        }
      } else {
        separatedResultWord.add({currentWord: false});
        currentWord = "";
        state = FAState.q0;
      }

      idxChar++;
    }
  }

  void _lexicalAnalyzer() {
    List<String>? charList = processedInput?.split("");

    try {
      if (charList != null) {
        _lexicalProcess(charList);
      }
    } catch (err) {
      rethrow;
    }
  }

  PTransition? _searchPTransition(String currentNTerminal, String currentWord) {
    for (PTransition trans in ParseTable().transitionList) {
      if (trans.currNTerminal == currentNTerminal &&
          trans.currTerminal == currentWord) {
        return trans;
      }
    }
    return null;
  }

  void _parseProcess(List<String> wordList) {
    PTransition? currentTransition;
    int idxWord = 0;
    String top = "";
    String word = "";

    while (stack!.isNotEmpty) {
      top = stack!.top();
      word = acceptedSentence![idxWord];
      stack?.print();

      if (ParseTable().nonTerminalList.contains(top)) {
        currentTransition = _searchPTransition(top, word);
        if (currentTransition != null) {
          stack?.pop();
          List<String> symbolsToBePushed = currentTransition.nextSymbol;
          for (int i = symbolsToBePushed.length - 1; i >= 0; i--) {
            stack?.push(symbolsToBePushed[i]);
          }
          debugPrint("SINIII TRANSISI");
          stack?.print();
        } else {
          break;
        }
      } else if (ParseTable().terminalList.contains(top)) {
        if (top == acceptedSentence![idxWord]) {
          stack?.pop();
          idxWord++;
          if (idxWord == acceptedSentence?.length) {
            stack?.pop();
          }
        } else {
          break;
        }
      } else {
        break;
      }
    }

    if (stack!.isEmpty){
      grammarResult = true;
    }else{
      grammarResult = false;
    }
  }

  void _parser() {
    try {
      if (acceptedSentence != null) {
        stack = stk.Stack();

        stack?.push("#");
        stack?.push("G");
        _parseProcess(acceptedSentence!);
      }
    } catch (err) {
      rethrow;
    }
  }
}
