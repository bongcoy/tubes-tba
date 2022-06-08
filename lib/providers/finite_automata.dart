import 'package:flutter/material.dart';

import '../models/transition.dart';

class FiniteAutomata with ChangeNotifier {
  // List<FAState> stateList = FAState.values;
  final List<Transition> _transitionList = [];

  List<Transition> get transitionList {
    addTransition(FAState.q0, " ", FAState.q0);
    addTransition(FAState.q2, " ", FAState.q2);

    addTransition(FAState.q0, "s", FAState.q1);
    addTransition(FAState.q1, "a", FAState.q2);

    addTransition(FAState.q0, "k", FAState.q4);
    addTransition(FAState.q4, "o", FAState.q2);

    addTransition(FAState.q4, "i", FAState.q5);
    addTransition(FAState.q5, "t", FAState.q6);
    addTransition(FAState.q6, "o", FAState.q7);
    addTransition(FAState.q7, "r", FAState.q8);
    addTransition(FAState.q8, "a", FAState.q9);
    addTransition(FAState.q9, "n", FAState.q10);
    addTransition(FAState.q10, "g", FAState.q2);

    addTransition(FAState.q0, "m", FAState.q11);
    addTransition(FAState.q11, "a", FAState.q12);
    addTransition(FAState.q12, "k", FAState.q8);

    addTransition(FAState.q12, "i", FAState.q13);
    addTransition(FAState.q13, "n", FAState.q2);

    addTransition(FAState.q0, "n", FAState.q14);
    addTransition(FAState.q14, "a", FAState.q15);
    addTransition(FAState.q15, "e", FAState.q2);

    addTransition(FAState.q0, "b", FAState.q16);
    addTransition(FAState.q16, "o", FAState.q17);
    addTransition(FAState.q17, "l", FAState.q1);

    addTransition(FAState.q16, "a", FAState.q18);
    addTransition(FAState.q18, "s", FAState.q19);
    addTransition(FAState.q19, "o", FAState.q2);

    addTransition(FAState.q11, "o", FAState.q20);
    addTransition(FAState.q20, "t", FAState.q21);
    addTransition(FAState.q21, "o", FAState.q22);
    addTransition(FAState.q22, "r", FAState.q2);

    return _transitionList;
  }

  void addTransition(FAState currentState, String currentSymbol, FAState nextState){
    _transitionList.add(Transition(currentState, currentSymbol, nextState));
  }

}