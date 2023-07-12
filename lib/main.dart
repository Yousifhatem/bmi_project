import 'package:bmi_project/constants.dart';
import 'package:bmi_project/pages/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgrounColor,
        colorScheme: Theme.of(context)
            .colorScheme
            .copyWith(secondary: Colors.lightGreen, primary: Colors.red),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: backgrounColor,
          centerTitle: true,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
