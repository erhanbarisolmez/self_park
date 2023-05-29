import 'package:flutter/material.dart';
import 'package:self_park/core/db/connect.dart';
import 'package:self_park/language/language_items.dart';

class UpdateViewHome extends StatefulWidget {
  const UpdateViewHome({Key? key}) : super(key: key);

  @override
  State<UpdateViewHome> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateViewHome> {
  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Center(
        child: deviceOrientation == Orientation.portrait
            ? const UpdateColumn()
            : const UpdateRow(),
      ),
    );
  }
}

class UpdateColumn extends StatefulWidget {
  const UpdateColumn({Key? key}) : super(key: key);

  @override
  State<UpdateColumn> createState() => _UpdateColumnState();
}

class _UpdateColumnState extends State<UpdateColumn> {
  late User user;

  void onNameChanged(String value) {
    setState(() {
      user.name = value;
    });
  }

  void onEmailChanged(String value) {
    setState(() {
      user.email = value;
    });
  }

  void onPasswordChanged(String value) {
    setState(() {
      user.password = value;
    });
  }

  Future<void> searchUser(String retrievedEmail) async {
    final connect = await connectToDB();
    final queryResult = await connect?.query(
        'SELECT name, email, password FROM tbl_user WHERE email = @email',
        substitutionValues: {'email': retrievedEmail});

    if (queryResult != null && queryResult.isNotEmpty) {
      final row = queryResult[0];

      final retrievedName = row[0][1] as String;
      final retrievedEmail = row[0][2] as String;
      final retrievedPassword = row[0][3] as String;

      setState(() {
        user = User(
          name: retrievedName,
          email: retrievedEmail,
          password: retrievedPassword,
        );
      });
    } else {
      setState(() {
        user = User(name: '', email: '', password: '');
      });
    }

    await connect?.close();
  }

  Future<void> updateUser() async {
    final connect = await connectToDB();
    await connect?.execute(
      'UPDATE tbl_user SET name = @name, password = @password WHERE email = @email',
      substitutionValues: {
        'name': user.name,
        'password': user.password,
        'email': user.email,
      },
    );
    await connect?.close();
  }

  @override
  void initState() {
    super.initState();
    user = User(name: '', email: '', password: '');
  }

  @override
  Widget build(BuildContext context) {
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
                    'Edit Operator',
                    style: TextStyle(color: Colors.amber, fontSize: 28),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                SizedBox(
                  width: 600,
                  child: TextField(
                    onChanged: onNameChanged,
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
                const SizedBox(height: 20),
                SizedBox(
                  width: 600,
                  child: TextField(
                    onChanged: onEmailChanged,
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
                const SizedBox(height: 20),
                SizedBox(
                  width: 600,
                  child: TextField(
                    onChanged: onPasswordChanged,
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
                  child: SizedBox(
                    width: 600,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {
                              searchUser(user.email);
                            },
                            child: const Text('Search'),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle().copyWith(
                              fixedSize: MaterialStatePropertyAll(
                                Size(400, 50),
                              ),
                            ),
                            onPressed: () {
                              updateUser();
                            },
                            child: const Text('Update'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UpdateRow extends StatefulWidget {
  const UpdateRow({Key? key}) : super(key: key);

  @override
  State<UpdateRow> createState() => _UpdateRowState();
}

class _UpdateRowState extends State<UpdateRow> {
  @override
  Widget build(BuildContext context) {
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
                    'Edit Operator',
                    style: TextStyle(color: Colors.amber, fontSize: 28),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                const SizedBox(
                  width: 600,
                  child: TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: LanguageItems.nameTitle,
                      prefixIconColor: Colors.white,
                      prefixIcon: Icon(Icons.person_2),
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  width: 600,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: LanguageItems.mailTitle,
                      prefixIconColor: Colors.white,
                      prefixIcon: Icon(Icons.mail_outline),
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  width: 600,
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
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
                  child: SizedBox(
                    width: 600,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {},
                            child: const Text('Search'),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle().copyWith(
                              fixedSize: MaterialStatePropertyAll(
                                Size(400, 50),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text('Update'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

ButtonStyle _buttonStyle() {
  return const ButtonStyle(
    fixedSize: MaterialStatePropertyAll(Size(190, 50)),
    backgroundColor: MaterialStatePropertyAll(Colors.black12),
  );
}

class User {
  String name;
  String email;
  String password;

  User({
    required this.name,
    required this.email,
    required this.password,
  });
}
