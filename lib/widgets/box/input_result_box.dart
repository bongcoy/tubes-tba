import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/size.dart';
import '../../constants/string.dart';
import '../../providers/in_out_provider.dart';

class InputResultBox extends StatelessWidget {
  const InputResultBox({Key? key}) : super(key: key);

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
    )
    ;
  }
}
