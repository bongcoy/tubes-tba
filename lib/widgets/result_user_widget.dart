import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_tba/providers/in_out_provider.dart';
import 'package:tubes_tba/widgets/result_tile.dart';

import '../constants/size.dart';
import '../constants/string.dart';

class ResultUserWidget extends StatelessWidget {
  const ResultUserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("BUILD RESULT USER WIDGET");
    final InOutProvider inOutProv = Provider.of<InOutProvider>(context);
    inOutProv.emptyInput();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(inputResultText),
        const SizedBox(height: smallDistanceSize),
        Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(circularRoundSize),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(paddingContainerSize),
          child: inOutProv.inputUser == null
              ? const Text(
                  noInputText,
                  style: TextStyle(
                    color: Colors.redAccent,
                  ),
                )
              : SelectableText(
                  inOutProv.inputUser!,
                ),
        ),
        const SizedBox(height: mediumDistanceSize),
        const Text(outputResultText),
        const SizedBox(height: smallDistanceSize),
        Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(circularRoundSize),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(paddingContainerSize),
          child: inOutProv.separatedResultWord.isEmpty
              ? const Text(
                  noOutputText,
                  style: TextStyle(
                    color: Colors.redAccent,
                  ),
                )
              : SizedBox(
                  height: 216,
                  child: ListView.builder(
                    itemCount: inOutProv.separatedResultWord.length,
                    itemBuilder: (ctx, index) {
                      String word = "";
                      bool result = false;
                      inOutProv.separatedResultWord[index].map((key, value) {
                        word = key;
                        result = value;
                        return MapEntry(word, result);
                      });
                      return ResultTile(
                        title: word,
                        result: result,
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}
