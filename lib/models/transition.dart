enum FAState {
  q1,
  q2,
  q3,
  q4,
  q5,
  q6,
  q7,
  q8,
  q9,
  q10,
  q11,
  q12,
  q13,
  q14,
  q15,
  q16,
}

class Transition {
  final FAState currentState;
  final String currentSymbol;
  final FAState nextState;

  Transition(this.currentState, this.currentSymbol, this.nextState);
}
