import 'package:postgres/postgres.dart';

Future<PostgreSQLConnection> connectToDB() async {
  // PostgreSQL veritabanına bağlanmak için kullanılacak fonksiyon
  PostgreSQLConnection connection = PostgreSQLConnection(
      "10.0.2.2", 5432, 'postgres',
      username: 'postgres', password: 'postgres');
  await connection.open();

  return connection;
}
