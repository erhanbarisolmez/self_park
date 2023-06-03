import 'package:flutter/material.dart';
import 'package:self_park/core/db/connect.dart';

import 'models/edit.dart';

Future<void> searchPark(String retrievedParkName) async {
  late Park park;
  final connect = await connectToDB();
  final queryResult = await connect?.query(
      'SELECT  park_id, parkName, capacity,  emptyCapacity, freeTime, district, workHours from tbl_ispark where parkName = @parkName',
      substitutionValues: {'parkName': retrievedParkName});

  if (queryResult != null && queryResult.isNotEmpty) {
    final row = queryResult.first;

    final retrievedParkName = row[0] as String;
    final retrievedParkCapacity = row[1].toString();
    final retrievedEmptyCapacity = row[2].toString();
    final retrievedFreeTime = row[3].toString();
    final retrievedDistrict = row[4] as String;
    final retrievedWorkHours = row[5] as String;

    park = Park(
        parkName: retrievedParkName,
        capacity: retrievedParkCapacity,
        emptyCapacity: retrievedEmptyCapacity,
        freeTime: retrievedFreeTime,
        district: retrievedDistrict,
        workHours: retrievedWorkHours);
  } else {}
}

class _controller {
  late TextEditingController parkNameController;
  late TextEditingController capacityController;
  late TextEditingController emptyCapacityController;
  late TextEditingController freeTimeController;
  late TextEditingController districtController;
  late TextEditingController workHoursController;
}
