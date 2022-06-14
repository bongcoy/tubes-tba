import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_tba/providers/in_out_provider.dart';
import 'package:tubes_tba/widgets/box/accepted_sentence_box.dart';
import 'package:tubes_tba/widgets/box/history_box.dart';
import 'package:tubes_tba/widgets/box/input_result_box.dart';

import '../constants/size.dart';
import '../constants/string.dart';

class ResultUserWidget extends StatelessWidget {
  const ResultUserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("BUILD RESULT USER WIDGET");
    final InOutProvider inOutProv = Provider.of<InOutProvider>(context,listen: false);
    inOutProv.emptyInput();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(inputResultText),
        SizedBox(height: smallDistanceSize),
        InputResultBox(),
        SizedBox(height: mediumDistanceSize),

        Text(outputResultText),
        SizedBox(height: smallDistanceSize),
        HistoryBox(),
        SizedBox(height: mediumDistanceSize),

        Text(outputResultText),
        SizedBox(height: smallDistanceSize),
        AcceptedSentenceBox(),
        SizedBox(height: mediumDistanceSize),
      ],
    );
  }
}
