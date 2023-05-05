import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:self_park/language/language_items.dart';
import 'package:self_park/core/db/query/controller/addOperator/addQuery.dart';

class AddViewHome extends StatefulWidget {
  const AddViewHome({super.key});

  @override
  State<AddViewHome> createState() => _AddViewState();
}

class _AddViewState extends State<AddViewHome> {
  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Center(
        child: deviceOrientation == Orientation.portrait
            ? const AddColumn()
            : const AddRow(),
      ),
    );
  }
}

class AddColumn extends StatefulWidget {
  const AddColumn({super.key});

  @override
  State<AddColumn> createState() => _AddColumnState();
}

class _AddColumnState extends State<AddColumn> {
  @override
  Widget build(BuildContext context) {
    var _name = TextEditingController();
    var _email = TextEditingController();
    var _password = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                const SizedBox(
                  child: Text(
                    'Add Operator',
                    style: TextStyle(color: Colors.amber, fontSize: 28),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                SizedBox(
                  width: 600,
                  child: TextField(
                    controller: _name,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: LanguageItems.nameTitle,
                      prefixIconColor: Colors.white,
                      prefixIcon: Icon(Icons.person_2),
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 600,
                  child: TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: LanguageItems.mailTitle,
                      prefixIconColor: Colors.white,
                      prefixIcon: Icon(Icons.mail_outline),
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 600,
                  child: TextField(
                    controller: _password,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: LanguageItems.passwordTitle,
                      prefixIconColor: Colors.white,
                      prefixIcon: Icon(Icons.password_outlined),
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: const ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(600, 50)),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black12),
                      ),
                      onPressed: () async {
                        String name = _name.text;
                        String email = _email.text;
                        String password = _password.text;
                        bool isAddOperator =
                            await addQuery(name, email, password);
                        if (!isAddOperator) {
                          showDialog(
                            context: (context),
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Success'),
                                content: const Text('Operator created.'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          showDialog(
                            context: (context),
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content: const Text('Error failed.'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: const Text(
                        'Add',
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddRow extends StatefulWidget {
  const AddRow({super.key});

  @override
  State<AddRow> createState() => _AddRowState();
}

class _AddRowState extends State<AddRow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  const SizedBox(
                    child: Text(
                      'Add Operator',
                      style: TextStyle(color: Colors.amber, fontSize: 28),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(8.0)),
                  const SizedBox(
                    width: 500,
                    child: Expanded(
                      child: TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelText: LanguageItems.nameTitle,
                          prefixIconColor: Colors.white,
                          prefixIcon: Icon(Icons.person_2),
                          focusedBorder: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    width: 500,
                    child: Expanded(
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelText: LanguageItems.mailTitle,
                          prefixIconColor: Colors.white,
                          prefixIcon: Icon(Icons.mail_outline),
                          focusedBorder: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    width: 500,
                    child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        labelText: LanguageItems.passwordTitle,
                        prefixIconColor: Colors.white,
                        prefixIcon: Icon(Icons.password_outlined),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        style: const ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(500, 50)),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.black12),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Success'),
                                content: const Text('Operator created.'),
                                actions: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text(
                          'Add',
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
