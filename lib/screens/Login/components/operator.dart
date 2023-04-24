import 'dart:async';

import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'package:self_park/core/db/con.dart';

import '../../../language/language_items.dart';
import '../../OperatorHome/index.dart';

class Operator extends StatelessWidget {
  const Operator({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Center(
        child: deviceOrientation == Orientation.portrait
            ? const MyColumn()
            : const MyRow(),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyColumn extends StatelessWidget {
  const MyColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _PaddingUtility().normalPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _mailTextField(),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 600,
            child: _passwordTextField(),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OperatorHome()));
              },
              child: const Text(
                'OK',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TextField _passwordTextField() {
  return const TextField(
    obscureText: true,
    enableSuggestions: false,
    autocorrect: false,
    decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        labelText: LanguageItems.passwordTitle,
        prefixIconColor: Colors.white,
        prefixIcon: Icon(Icons.password_outlined),
        focusedBorder: OutlineInputBorder()),
  );
}

SizedBox _mailTextField() {
  return const SizedBox(
    width: 600,
    child: TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          labelText: LanguageItems.mailTitle,
          prefixIconColor: Colors.white,
          prefixIcon: Icon(Icons.mail_lock_outlined),
          focusedBorder: OutlineInputBorder()),
    ),
  );
}

class MyRow extends StatelessWidget {
  const MyRow({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _PaddingUtility().normalPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _mailTextField(),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 600,
            child: _passwordTextField(),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OperatorHome()));
              },
              child: const Text(
                'OK',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PaddingUtility {
  final logoPadding = const EdgeInsets.only(top: 20);
  final normalPadding = const EdgeInsets.all(8.0);
}
