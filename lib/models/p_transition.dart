enum NTerminal {
  G, S, P, O
}

enum Terminal {
  sa,
  ko,
  kitorang,
  makang,
  main,
  nae,
  mo,
  bola,
  baso,
  motor,
}

class PTransition {
  final NTerminal currNTerminal;
  final Terminal currTerminal;
  final List<dynamic> nextState;

  PTransition(this.currNTerminal, this.currTerminal, this.nextState);
}