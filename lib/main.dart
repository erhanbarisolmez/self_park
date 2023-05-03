import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:self_park/screens/Login/index.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _AppbarTheme()._apbarTheme,
      home: const Scaffold(
        body: LoginPage(), //LoginPage ControllerHome  OperatorHome
      ),
    );
  }
}

class _AppbarTheme {
  final _apbarTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
