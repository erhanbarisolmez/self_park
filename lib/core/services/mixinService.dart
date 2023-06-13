import 'package:dio/dio.dart';

mixin ServiceMixin {
  late final Dio _networkManager;
  final _baseUrl = 'http://192.168.2.190:8080/api/v1/';

  void initializeNetworkManager() {
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
  }
}
