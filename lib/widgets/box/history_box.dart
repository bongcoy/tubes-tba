import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_tba/widgets/result_tile.dart';

import '../../constants/size.dart';
import '../../constants/string.dart';
import '../../providers/in_out_provider.dart';

class HistoryBox extends StatelessWidget {
  const HistoryBox({Key? key}) : super(key: key);

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
    );
  }
}
