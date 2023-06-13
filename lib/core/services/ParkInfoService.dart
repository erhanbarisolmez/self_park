import 'dart:io';

import 'package:dio/dio.dart';
import 'package:self_park/core/models/ParkInfoGetModel.dart';

import 'mixinService.dart';

late Future<List<ParkInfoGetAllModel>> parkListFuture;

class ParkInfoService with ServiceMixin {
  ParkInfoService() {
    initializeNetworkManager();
  }
}

Future<List<ParkInfoGetAllModel>> fetchPostItems() async {
  final response = await _networkManager.get('parkInfo/getAll');
  if (response.statusCode == HttpStatus.ok) {
    final _datas = response.data;

    if (_datas is List) {
      final List<ParkInfoGetAllModel> parkList =
          _datas.map((e) => ParkInfoGetAllModel.fromJson(e)).toList();
      return parkList;
    }
  }
  return [];
}
