import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_tba/constants/size.dart';
import 'package:tubes_tba/providers/in_out_provider.dart';
import 'package:tubes_tba/widgets/data_task_widget.dart';
import 'package:tubes_tba/widgets/input_user_widget.dart';
import 'package:tubes_tba/widgets/result_user_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint("BUILD HOMESCREEN");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Lexical Analyzer IF4407 - Kelompok 05"),
        ),
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (ctx) => InOutProvider(),
            )
          ],
          child: Padding(
            padding: const EdgeInsets.all(paddingScreenSize),
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  DataTaskWidget(),
                  SizedBox(height: bigDistanceSize),
                  InputUserWidget(),
                  SizedBox(height: bigDistanceSize),
                  ResultUserWidget(),
                  SizedBox(height: bigDistanceSize),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}