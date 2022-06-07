import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_tba/providers/in_out_provider.dart';

import '../constants/string.dart';

class InputUserWidget extends StatefulWidget {
  const InputUserWidget({Key? key}) : super(key: key);

  @override
  State<InputUserWidget> createState() => _InputUserWidgetState();
}

class _InputUserWidgetState extends State<InputUserWidget> {
  final TextEditingController _inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _inputController.clear();
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD INPUT USER WIDGET");
    final InOutProvider inOutProv = Provider.of<InOutProvider>(context,listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(inputRequestText),
        TextFormField(
          controller: _inputController,
          decoration: const InputDecoration(
            hintText: "Contoh: Nae, Main, Ko, Kitorang",
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              inOutProv.setResult(_inputController.text.toString());
              _inputController.clear();
            },
            child: const Text(buttonResultText),
          ),
        )
      ],
    );
  }
}
