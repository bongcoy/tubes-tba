import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_tba/providers/in_out_provider.dart';

import '../constants/size.dart';
import '../constants/string.dart';

class ResultUserWidget extends StatelessWidget {
  const ResultUserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InOutProvider inOutProv = Provider.of<InOutProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(inputResultText),
        Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(circularRoundSize),
          ),
          alignment: Alignment.center,
          child: Text(
            inOutProv.inputUser ?? "null",
          ),
        ),
        const SizedBox(height: mediumDistanceSize,),
        const Text(outputResultText),
        Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(circularRoundSize),
          ),
          alignment: Alignment.center,
          child: Text(
            inOutProv.result == null ? "null" : inOutProv.result.toString(),
          ),
        ),
      ],
    );
  }
}
