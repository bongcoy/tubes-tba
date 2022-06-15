class PTransition {
  final String currNTerminal;
  final String currTerminal;
  final List<String> nextSymbol;

  PTransition(this.currNTerminal, this.currTerminal, this.nextSymbol);
}