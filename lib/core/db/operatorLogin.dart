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
