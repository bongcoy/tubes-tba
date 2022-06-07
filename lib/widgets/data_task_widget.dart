import 'package:flutter/material.dart';

import '../constants/size.dart';
import '../constants/string.dart';
import 'our_data_task_table.dart';

class DataTaskWidget extends StatelessWidget {
  const DataTaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("BUILD DATA TASK WIDGET");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(ourTaskDataText),
        SizedBox(height: smallDistanceSize,),
        OurDataTaskTable(),
      ],
    );
  }
}

// TODO: Masukin Tulisan Grammar
// G -> Subjek Predikat Objek
// Subjek -> sa | ko | kitorang
// Predikat -> makang | main | nae | mo
// Objek -> bola | baso | motor