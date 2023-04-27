import 'package:postgres/postgres.dart';
import 'package:self_park/core/db/connect.dart';

Future<bool> authenticateAdmin(String email, String password) async {
// Kullanıcının kimlik doğrulamasını kontrol etmek için kullanılacak fonksiyon
  PostgreSQLConnection connection = await connectToDB(); // core/db/connect.dart
  var result = await connection.query(
      '''select * from tbl_admin where email=@email and password=@password''',
      substitutionValues: {'email': email, 'password': password});
  await connection.close();
  if (result.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}
