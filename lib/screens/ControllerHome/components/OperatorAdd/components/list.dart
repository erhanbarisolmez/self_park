import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:self_park/core/db/connect.dart';
import 'package:self_park/core/db/query/controller/addOperator/listQuery.dart';

class ListViewHome extends StatefulWidget {
  const ListViewHome({super.key});

  @override
  State<ListViewHome> createState() => _ListViewState();
}

class User {
  final int userId;
  final String name;
  final String mail;
  final String password;

  User(
      {required this.userId,
      required this.name,
      required this.mail,
      required this.password});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['user_id'] as int,
      name: map['name'] as String,
      mail: map['mail'] as String,
      password: map['password'] as String,
    );
  }
}

class _ListViewState extends State<ListViewHome> {
  get connect => connectToDB();
  get userList => listQuery();

  //get row => userList;

  listQuery() async {
    final connect = await connectToDB(); // core/db/connect.dart
    final results = await connect.query('''
       select  * from tbl_user ORDER BY user_id desc LIMIT 3
  ''');
    final userList = results
        .map((row) => User.fromMap(row as Map<String, dynamic>))
        .toList();
    await connect.close();

    for (final user in userList) {
      print('''
        ${user.userId},
        ${user.name},
        ${user.mail},
        ${user.password}
    ''');
    }
  }

  @override
  Widget build(BuildContext context) {
    listQuery();

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: FutureBuilder(
        future: listQuery(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final userList =
                snapshot.data!.map((row) => User.fromMap(row)).toList();
          }
          return ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.white24,
              );
            },
            itemCount: userList.hashCode,
            itemBuilder: (context, index) {
              final user = userList[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.mail),
              );
            },
          );
        },
      ),
    );
  }
}
