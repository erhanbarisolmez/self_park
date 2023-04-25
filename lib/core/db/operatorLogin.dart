import 'package:postgres/postgres.dart';
import 'dart:io';
import 'dart:convert';

void main(List<String> arguments) async {
  final conn = PostgreSQLConnection("localhost", 5432, 'postgres',
      username: 'postgres', password: 'postgres');
  await conn.open();

  print('Connect to Postgres database...');

  var results = await conn.query(
      ''''select * from tbl_admin where email='erhan@gmail.com' and "password"='erhan123'''
      '');

  await conn.close();
}

// void login() async {
//   final response = PostgreSQLConnection("10.0.2.2", 5432, 'postgres',
//       username: 'postgres', password: 'postgres');
//   await response.open();
//   print('bağlandı');
//   var results = await response
//       .query('''select * from tbl_admin where email='@mail' and "password"='@pass' ''',
//           substitutionValues: {
//         'mail': _Control().email.text,
//         'password': _Control().password.text
//       });

//   // var results = await response.query('select * from tbl_user');

//   await response.close();
// }
