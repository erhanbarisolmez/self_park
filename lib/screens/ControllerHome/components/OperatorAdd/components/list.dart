import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:self_park/core/db/connect.dart';
//import 'package:self_park/core/db/query/controller/addOperator/listQuery.dart';

class ListViewHome extends StatefulWidget {
  const ListViewHome({super.key});

  @override
  State<ListViewHome> createState() => _ListViewState();
}

class User {
  late final BigInt userId;
  late final String name;
  late final String mail;
  late final String password;

  User(
      {required this.userId,
      required this.name,
      required this.mail,
      required this.password});

  factory User.fromMap(Map<String, dynamic> map) {
    final userId = map['user_id'] as BigInt?;
    final name = map['name'] as String?;
    final mail = map['email'] as String?;
    final password = map['password'] as String?;
    return User(
      userId: userId ?? BigInt.zero,
      name: name != null && name.isNotEmpty ? name : 'N/A',
      mail: mail != null && mail.isNotEmpty ? mail : 'N/A',
      password: password != null && password.isNotEmpty ? password : 'N/A',
    );
  }
}

class _ListViewState extends State<ListViewHome> {
  late Future<List<User>> userListFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userListFuture = listQuery();
  }

  Future<List<User>> listQuery() async {
    final connect = await connectToDB(); // core/db/connect.dart
    final results = await connect.query('''
        select * from tbl_user ORDER BY user_id desc LIMIT 3  
  ''');
    final userList = results // debug data geliyor.
        .map((row) => User.fromMap(row.asMap().cast<String, dynamic>()))
        .toList();

    await connect.close();
    // for (final user in userList) {
    //   print('''
    //     ${user.userId},
    //     ${user.name},
    //     ${user.mail},
    //     ${user.password}
    // ''');
    // }
    return userList;
  }

  @override
  Widget build(BuildContext context) {
    // listQuery();

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<User>>(
        future: userListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final userList = snapshot.data ?? [];
            // debug 3 data return null
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                final user = userList[index];

                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.mail),
                );
              },
            );
          }

          // if (snapshot.hasData) {
          //   return ListView.builder(
          //     itemCount: snapshot.data?.length,
          //     itemBuilder: (context, index) {
          //       return Text(snapshot.data![index].name);
          //     },
          //   );
          // } else if (snapshot.hasError) {
          //   return Text(snapshot.error.toString());
          // }
          // return const CircularProgressIndicator();
        },
      ),
    );
  }
}
