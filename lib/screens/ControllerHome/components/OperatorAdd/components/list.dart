import 'package:flutter/material.dart';
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
  late final String email;
  late final String password;

  User(
      {required this.userId,
      required this.name,
      required this.email,
      required this.password});

  factory User.fromMap(Map<String, dynamic> map) {
    final userId = map['user_id'] as BigInt?;
    final name = map['name'] as String;
    final email = map['email'] as String;
    final password = map['password'] as String;

    return User(
      userId: userId ?? BigInt.zero,
      name: name != null && name.isNotEmpty ? name : 'N/A',
      email: email != null && email.isNotEmpty ? email : 'N/A',
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
    final results = await connect?.query('''
    SELECT * FROM tbl_user ORDER BY user_id DESC LIMIT 10  
  ''');

    final userList = results?.map((row) {
      final userId = BigInt.parse(row[0].toString());
      final name = row[1] as String;
      final email = row[2] as String;
      final password = row[3] as String;

      return User(
        userId: userId,
        name: name,
        email: email,
        password: password,
      );
    }).toList();

    await connect!.close();

    return userList!;
  }

  Future<void> deleteUser(BigInt userId) async {
    final connect = await connectToDB();
    await connect!.execute('''
          delete from tbl_user where user_id = @userId
    ''', substitutionValues: {
      'userId': userId.toString(),
    });
    await connect.close();

    setState(() {
      userListFuture = listQuery();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Last 10 Users'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<User>>(
        future: userListFuture,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final userList = snapshot.data ?? [];
            return Padding(
              padding: const EdgeInsets.all(100),
              child: ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  final user = userList[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(
                        "id: ${user.userId.toString()}       mail : ${user.email}"),
                    leading: Icon(Icons.account_box,
                        size: 50, color: Colors.yellow.shade100),
                    isThreeLine: true,
                    trailing: Icon(
                      Icons.delete,
                      color: Colors.orange.shade100,
                      size: 28,
                    ),
                    dense: false,
                    onTap: () {
                      deleteUser(user.userId);
                    },
                    enabled: true,
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            final userList = snapshot.data ?? [];
            // debug 3 data return null
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                final user = userList[index];

                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
            );
          }
        },
      ),
    );
  }
}
