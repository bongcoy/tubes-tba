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

    addTransition(FAState.q2, "k", FAState.q2);
    addTransition(FAState.q2, "o", FAState.q2);

    addTransition(FAState.q2, "i", FAState.q2);
    addTransition(FAState.q2, "t", FAState.q2);
    addTransition(FAState.q2, "o", FAState.q2);
    addTransition(FAState.q2, "r", FAState.q2);
    addTransition(FAState.q2, "a", FAState.q2);
    addTransition(FAState.q2, "n", FAState.q2);
    addTransition(FAState.q2, "g", FAState.q2);

    addTransition(FAState.q2, "m", FAState.q2);
    addTransition(FAState.q2, "a", FAState.q2);
    addTransition(FAState.q2, "k", FAState.q2);

    addTransition(FAState.q2, "i", FAState.q2);
    addTransition(FAState.q2, "n", FAState.q2);

    addTransition(FAState.q2, "n", FAState.q2);
    addTransition(FAState.q2, "a", FAState.q2);
    addTransition(FAState.q2, "e", FAState.q2);

    addTransition(FAState.q2, "b", FAState.q2);
    addTransition(FAState.q2, "o", FAState.q2);
    addTransition(FAState.q2, "l", FAState.q2);
    addTransition(FAState.q2, "a", FAState.q2);

    addTransition(FAState.q2, "a", FAState.q2);
    addTransition(FAState.q2, "s", FAState.q2);
    addTransition(FAState.q2, "o", FAState.q2);

    addTransition(FAState.q2, "o", FAState.q2);
    addTransition(FAState.q2, "t", FAState.q2);
    addTransition(FAState.q2, "o", FAState.q2);
    addTransition(FAState.q2, "r", FAState.q2);

    return [];
  }

  void addTransition(FAState currentState, String currentSymbol, FAState nextState){
    _transitionList.add(Transition(currentState, currentSymbol, nextState));
  }

}