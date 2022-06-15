import '../models/p_transition.dart';

class ParseTable {
  final List<PTransition> _transitionList = [];

  List<String> get nonTerminalList {
    return [
      "G",
      "S",
      "P",
      "O",
    ];
  }

  List<String> get terminalList {
    return [
      "sa",
      "ko",
      "kitorang",
      "makang",
      "main",
      "nae",
      "mo",
      "bola",
      "baso",
      "motor",
    ];
  }

  // Pakai List (bukan pakai map tuple) karena dart tidak ada tuple
  List<PTransition> get transitionList {
    _addTransition("G", "sa", ["S", "P", "O"]);
    _addTransition("G", "ko", ["S", "P", "O"]);
    _addTransition("G", "kitorang", ["S", "P", "O"]);

    _addTransition("S", "sa", ["sa"]);
    _addTransition("S", "ko", ["ko"]);
    _addTransition("S", "kitorang", ["kitorang"]);

    _addTransition("P", "makang", ["makang"]);
    _addTransition("P", "main", ["main"]);
    _addTransition("P", "nae", ["nae"]);
    _addTransition("P", "mo", ["mo"]);

    _addTransition("O", "bola", ["bola"]);
    _addTransition("O", "baso", ["baso"]);
    _addTransition("O", "motor", ["motor"]);

    return _transitionList;
  }

  void _addTransition(
      String currentNTerminal, String currentTerminal, List<String> nextState) {
    _transitionList
        .add(PTransition(currentNTerminal, currentTerminal, nextState));
  }
}
