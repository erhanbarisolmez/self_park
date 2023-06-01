import 'package:self_park/core/db/connect.dart';
import 'package:self_park/core/db/query/controller/addPark/models/park.dart';

Future<List<Park>> parkList() async {
  final connect = await connectToDB();
  final results = await connect?.query('''
    select * from tbl_ispark order by user_id LIMIT10
  ''');

  final parkListResult = results?.map((row) {
    final parkId = BigInt.parse(row[0].toString());
    final parkName = row[1] as String;
    final capacity = row[2] as String;
    final emptyCapacity = row[3] as String;
    final freeTime = row[4] as String;
    final district = row[5] as String;
    final workHours = row[6] as String;

    return Park(
        parkId: parkId,
        parkName: parkName,
        capacity: capacity,
        emptyCapacity: emptyCapacity,
        freeTime: freeTime,
        district: district,
        workHours: workHours);
  }).toList();

  await connect!.close();

  return parkListResult!;
}
