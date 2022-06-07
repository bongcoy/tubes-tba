import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

/* Copyrights to IF4407 - Kelompok 05:
1301200465 - Muhammad Ikhsan
1301204269 - Imam Rifai Kadir Sibali
1301204499 - Muhammad Pascal Dewantara
 */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const HomeScreen();
}

