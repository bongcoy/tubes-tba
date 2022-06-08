import 'package:flutter/material.dart';

class ResultTile extends StatelessWidget {
  final String title;
  final bool result;

  const ResultTile({Key? key, required this.title, required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: result
          ? const Icon(
              Icons.check,
              color: Colors.green,
            )
          : const Icon(
              Icons.clear,
              color: Colors.red,
            ),
      title: Text('"$title"'),
      trailing: Text(result.toString()),
    );
  }
}
