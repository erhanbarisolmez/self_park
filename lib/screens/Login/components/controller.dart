import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'package:self_park/screens/ControllerHome/index.dart';

import '../../../language/language_items.dart';

class Controller extends StatelessWidget {
  const Controller({super.key});

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
                        builder: (context) => const ControllerHome()));
              },
              child: const Text(
                'Admin',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TextField _passwordTextField() {
  return TextField(
    controller: _Control().pass,
    obscureText: true,
    enableSuggestions: false,
    autocorrect: false,
    decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        labelText: LanguageItems.passwordTitle,
        prefixIconColor: Colors.white,
        prefixIcon: Icon(Icons.password_outlined),
        focusedBorder: OutlineInputBorder()),
  );
}

SizedBox _mailTextField() {
  return SizedBox(
    width: 600,
    child: TextField(
      controller: _Control().mail,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
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
                login();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ControllerHome()));
              },
              child: const Text(
                'Admin ',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void login() async {
  final response = PostgreSQLConnection("10.0.2.2", 5432, 'postgres',
      username: 'postgres', password: 'postgres');
  await response.open();
  print('bağlandı');
  var results = await response
      .query('''select * from tbl_admin where email='@mail' and "password"='@pass' ''',
          substitutionValues: {
        'mail': _Control().mail.text,
        'password': _Control().pass.text
      });

  // var results = await response.query('select * from tbl_user');

  await response.close();
}

class _PaddingUtility {
  final logoPadding = const EdgeInsets.only(top: 20);
  final normalPadding = const EdgeInsets.all(8.0);
}

class _Control {
  TextEditingController mail = TextEditingController();
  TextEditingController pass = TextEditingController();
}
