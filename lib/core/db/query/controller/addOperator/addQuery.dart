import 'package:postgres/postgres.dart';
import 'package:self_park/core/db/connect.dart';

Future<bool> addQuery(String name, String email, String password) async {
// Controller, operator ekleme sorgusu
  PostgreSQLConnection connection = await connectToDB(); // core/db/connect.dart
  var result = await connection.query(
      '''insert into tbl_user("name",email,"password") values(@name,@email,@password)''',
      substitutionValues: {"name": name, 'email': email, 'password': password});
  await connection.close();
  if (result.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}
