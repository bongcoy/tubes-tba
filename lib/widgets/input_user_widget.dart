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
  Widget build(BuildContext context) {
    final InOutProvider inOutProvider = Provider.of<InOutProvider>(context);

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
              inOutProvider.inputUser = _inputController.text.toString();
            },
            child: const Text(buttonResultText),
          ),
        )
      ],
    );
  }
}