import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_tba/constants/size.dart';
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
    debugPrint("BUILD INPUT USER WIDGET");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(inputRequestText),
        TextFormField(
          controller: _inputController,
          decoration: const InputDecoration(
            hintText: hintExampleText,
          ),
        ),
        const SizedBox(height: smallDistanceSize),
        Consumer<InOutProvider>(
          builder: (context, value, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_inputController.text != "") {
                      value.emptyInput();
                      value.setResult(_inputController.text.toString());
                      _inputController.clear();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: const Text(addSuccesText),
                            action: SnackBarAction(
                              label: okText,
                              onPressed: () {},
                            )),
                      );

                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: const Text(addFailText),
                            action: SnackBarAction(
                              label: okText,
                              onPressed: () {},
                            )),
                      );
                    }
                  },
                  child: const Text(buttonResultText),
                ),
                const SizedBox(width: smallDistanceSize,),
                ElevatedButton(
                  onPressed: () {
                    if (value.processedInput != null) {
                      value.emptyInput();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: const Text(deleteSuccesText),
                            action: SnackBarAction(
                              label: okText,
                              onPressed: () {},
                            )),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: const Text(deleteFailText),
                            action: SnackBarAction(
                              label: okText,
                              onPressed: () {},
                            )),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                  ),
                  child: const Icon(Icons.delete),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
