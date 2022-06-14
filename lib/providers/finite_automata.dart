import '../models/fa_transition.dart';

class FiniteAutomata {
  // List<FAState> stateList = FAState.values;
  final List<FATransition> _transitionList = [];

  List<FAState> get acceptingState {
    return [
      FAState.q2,
      FAState.q3,
      FAState.q20,
    ];
  }

  // Pakai List (bukan pakai map tuple) karena dart tidak ada tuple
  List<FATransition> get transitionList {
    _addTransition(FAState.q0, " ", FAState.q0);
    _addTransition(FAState.q2, " ", FAState.q2);

    _addTransition(FAState.q0, "s", FAState.q1);
    _addTransition(FAState.q1, "a", FAState.q2);

    _addTransition(FAState.q0, "k", FAState.q4);
    _addTransition(FAState.q4, "o", FAState.q2);

    _addTransition(FAState.q4, "i", FAState.q5);
    _addTransition(FAState.q5, "t", FAState.q6);
    _addTransition(FAState.q6, "o", FAState.q7);
    _addTransition(FAState.q7, "r", FAState.q8);
    _addTransition(FAState.q8, "a", FAState.q9);
    _addTransition(FAState.q9, "n", FAState.q10);
    _addTransition(FAState.q10, "g", FAState.q2);

    _addTransition(FAState.q0, "m", FAState.q11);
    _addTransition(FAState.q11, "a", FAState.q12);
    _addTransition(FAState.q12, "k", FAState.q8);

    _addTransition(FAState.q12, "i", FAState.q13);
    _addTransition(FAState.q13, "n", FAState.q2);

    _addTransition(FAState.q0, "n", FAState.q14);
    _addTransition(FAState.q14, "a", FAState.q15);
    _addTransition(FAState.q15, "e", FAState.q2);

    _addTransition(FAState.q0, "b", FAState.q16);
    _addTransition(FAState.q16, "o", FAState.q17);
    _addTransition(FAState.q17, "l", FAState.q1);

    _addTransition(FAState.q16, "a", FAState.q18);
    _addTransition(FAState.q18, "s", FAState.q19);
    _addTransition(FAState.q19, "o", FAState.q2);

    _addTransition(FAState.q11, "o", FAState.q20);
    _addTransition(FAState.q20, "t", FAState.q21);
    _addTransition(FAState.q21, "o", FAState.q22);
    _addTransition(FAState.q22, "r", FAState.q2);

    return _transitionList;
  }

  void _addTransition(
      FAState currentState, String currentSymbol, FAState nextState) {
    _transitionList.add(FATransition(currentState, currentSymbol, nextState));
  }
}
