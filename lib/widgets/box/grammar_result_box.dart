import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/size.dart';
import '../../constants/string.dart';
import '../../providers/in_out_provider.dart';

class GrammarResultBox extends StatelessWidget {
  const GrammarResultBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InOutProvider inOutProv = Provider.of<InOutProvider>(context);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(circularRoundSize),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(paddingContainerSize),
      child: inOutProv.grammarResult == null
          ? const Text(
              noOutputText,
              style: TextStyle(color: Colors.redAccent),
            )
          : inOutProv.grammarResult!
              ? const Text(
                  acceptGrammarText,
                  style: TextStyle(color: Colors.green),
                )
              : const Text(
                  rejectGrammarText,
                  style: TextStyle(color: Colors.redAccent),
                ),
    );
  }
}
