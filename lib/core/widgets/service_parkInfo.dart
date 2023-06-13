import 'package:flutter/material.dart';
import 'package:self_park/core/services/ParkInfoService.dart';

import '../models/ParkInfoGetModel.dart';

class ServiceParkInfo extends StatefulWidget {
  const ServiceParkInfo({super.key});

  @override
  State<ServiceParkInfo> createState() => _ServiceParkInfoState();
}

class _ServiceParkInfoState extends State<ServiceParkInfo> {
  List<ParkInfoGetAllModel>? _items;
  late Future<List<ParkInfoGetAllModel>> parkListFuture;

  String? title;
  bool _isloading = false;

  // late final Dio _networkManager;
  // final _baseUrl = 'http://192.168.2.190:8080/api/v1/';

  @override
  void initState() {
    super.initState();
    // _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
    // fetchPostItems();
    title = 'Last 10 Park';
    parkListFuture = fetchPostItems();
  }

  void _changeLoading() {
    _isloading = !_isloading;
  }

  Future<List<ParkInfoGetAllModel>> fetchPostItem() async {
    _changeLoading();
    final List<ParkInfoGetAllModel> parkList =
        await ParkInfoService.fetchPostItems();
    final List<ParkInfoGetAllModel> lastTenItems =
        parkList.sublist(parkList.length - 10);
    _changeLoading();
    return lastTenItems;
  }

  // void fetchPostItems() async {
  //   _changeLoading();
  //   final response = await _networkManager.get('parkInfo/getAll');

  //   if (response.statusCode == HttpStatus.ok) {
  //     final _datas = response.data;

  //     if (_datas is List) {
  //       setState(() {
  //         final List<ParkInfoGetAllModel> newList =
  //             _datas.map((e) => ParkInfoGetAllModel.fromJson(e)).toList();
  //         _items = newList.sublist(newList.length - 10);
  //       });
  //     }
  //   }
  //   _changeLoading();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ''),
        actions: [
          _isloading
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink()
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        itemCount: _items?.length ?? 0,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: _PostCard(model: _items?[index]),
          );
        },
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required ParkInfoGetAllModel? model,
  }) : _model = model;

  final ParkInfoGetAllModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(_model?.parkName ?? ''),
        subtitle: Text(_model?.district ?? ''),
        onTap: () {},
      ),
    );
  }
}
