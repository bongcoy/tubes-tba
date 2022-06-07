import 'package:flutter/material.dart';
import 'package:tubes_tba/constants/size.dart';

class OurDataTaskTable extends StatelessWidget {
  const OurDataTaskTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Table(
          columnWidths: const {
            1: FlexColumnWidth(columnWidthSize),
          },
          border: TableBorder.all(),
          children: [
            buildRow(["Bahasa", "Papua"])
          ],
        ),
        const SizedBox(
          height: mediumDistanceSize,
        ),
        Table(
          columnWidths: const {
            1: FlexColumnWidth(columnWidthSize),
          },
          border: TableBorder.all(),
          children: [
            buildRow(["NIM", "Nama"]),
            buildRow(["1301200465", "Muhammad Ikhsan"]),
            buildRow(["1301204269", "Imam Rifai Kadir Sibali"]),
            buildRow(["1301204499", "Muhammad Pascal Dewantara"]),
          ],
        ),
      ],
    );
  }

  TableRow buildRow(List<String> cells) => TableRow(
        children: cells.map((e) {
          return Padding(
            padding: const EdgeInsets.all(paddingCellSize),
            child: Text(e),
          );
        }).toList(),
      );
}
