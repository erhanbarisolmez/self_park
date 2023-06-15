import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:self_park/core/widgets/parkInfoEdit.dart';

import '../models/ParkInfoGetModel.dart';

class ServiceParkInfo extends StatefulWidget {
  const ServiceParkInfo({super.key});

  @override
  State<ServiceParkInfo> createState() => _ServiceParkInfoState();
}

class _ServiceParkInfoState extends State<ServiceParkInfo> {
  List<ParkInfoGetAllModel>? _items;
  List<ParkInfoGetAllModel>? _searchList = [];
  final TextEditingController _searchController = TextEditingController();
  late Future<List<ParkInfoGetAllModel>> parkListFuture;

  String? title;
  bool _isloading = false;

  late final Dio _networkManager;
  final _baseUrl = 'http://192.168.4.190:8080/api/v1/';

  late ParkInfoGetAllModel parkName;

  @override
  void initState() {
    super.initState();
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
    fetchPostItems();
    title = 'Park List';
    _searchController.addListener(_onSearchTextChanged);
  }

  void _onSearchTextChanged() {
    String searchText = _searchController.text.toLowerCase();

    setState(() {
      if (searchText.isEmpty) {
        _searchList = _items;
      } else {
        _searchList = _items
            ?.where((park) =>
                park.parkName!.toLowerCase().contains(searchText) ||
                park.district!.toLowerCase().contains(searchText))
            .toList();
      }
    });
  }

  void _changeLoading() {
    _isloading = !_isloading;
  }

  void fetchPostItems() async {
    _changeLoading();
    final response = await _networkManager.get('parkInfo/getAll');

    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;

      if (_datas is List) {
        setState(() {
          _items = _datas.map((e) => ParkInfoGetAllModel.fromJson(e)).toList();
          _searchList = _items;
        });
      }
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ''),
        actions: [
          _isloading
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink(),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SearchBar(
                    controller: _searchController,
                    hintText: 'Search',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        itemCount: _searchList?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          final park = _searchList![index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(park.parkName ?? ''),
              leading: Icon(
                Icons.local_parking,
                size: 50,
                color: Colors.yellow.shade100,
              ),
              subtitle: Text(' ${park.district ?? ''}'),
              trailing: SizedBox(
                width: 96,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        navigateToEdit(context);
                      },
                      icon: Icon(
                        Icons.mode_edit,
                        color: Colors.orange.shade100,
                        size: 28,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.orange.shade100,
                        size: 28,
                      ),
                      onPressed: () {
                        //deletePark(park.parkId);
                      },
                    ),
                  ],
                ),
              ),
              onTap: () {
                //openParkDetail(park);
              },
            ),
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
        subtitle: Text('${_model?.district} '),
        onTap: () => {},
      ),
    );
  }
}

void navigateToEdit(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => const UpdateParkView(),
    ),
  );
}
