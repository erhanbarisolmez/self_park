import 'package:postgres/postgres.dart';
import 'package:self_park/core/db/connect.dart';

Future<bool> listQuery(results) async {
  // Operator, son 10 eklenen listeleme sorgusu
  PostgreSQLConnection connection = await connectToDB(); // core/db/connect.dart
  var results = await connection.query('''
       select  * from tbl_user ORDER BY user_id desc LIMIT 3 
  ''');
  for (var row in results) {
    print('''
        id: ${row[0]}
        name: ${row[1]}
        email: ${row[2]}
        password: ${row[3]}
    ''');
  }
  if (results.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}
