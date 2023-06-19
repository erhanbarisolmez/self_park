import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_park/core/widgets/parkInfoEdit.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../models/ParkInfoGetModel.dart';

class ServiceParkInfo extends StatefulWidget {
  const ServiceParkInfo({Key? key}) : super(key: key);

  @override
  State<ServiceParkInfo> createState() => _ServiceParkInfoState();
}

class _ServiceParkInfoState extends State<ServiceParkInfo> {
  List<ParkInfoGetAllModel>? _items;
  List<ParkInfoGetAllModel>? _searchList = [];
  late final TextEditingController _searchController = TextEditingController();
  late Future<List<ParkInfoGetAllModel>> parkListFuture;
  IO.Socket? socket;

  String? title;
  bool _isloading = false;

  late final Dio _networkManager;
  final _baseUrl = 'http://192.168.4.190:8080/api/v1/';

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

  Stream<List<ParkInfoGetAllModel>> ParkListStream() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 100));
      yield _items ?? [];
    }
  }

  @override
  void initState() {
    super.initState();
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
    parkListFuture = fetchPostItems();
    title = 'Park List';
    _searchController.addListener(_onSearchTextChanged);
    connectToSocket();
  }

  Future<List<ParkInfoGetAllModel>> fetchPostItems() async {
    try {
      final response = await _networkManager.get('parkInfo/getAll');

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          setState(() {
            _items =
                _datas.map((e) => ParkInfoGetAllModel.fromJson(e)).toList();
            _searchList = _items;
          });
        }
      }
    } catch (e) {
      print('Error post items : $e');
    }

    return _searchList != null ? _searchList! : [];
  }

  Future<void> deletePark() async {
    final response = await _networkManager.get('parkInfo/delete');
    if (response.statusCode == 200) {
      print('başarılı');
    } else {
      print('hata ${response.statusCode}');
    }
  }

  void connectToSocket() {
    socket = IO.io(
        _baseUrl, IO.OptionBuilder().setTransports(['websocket']).build());

    socket!.onConnect((_) {
      print('Socket Connected');
    });

    socket!.on('parkInfo/getAll', (_) {
      print('park ınfo updated');
      fetchPostItems();
    });
  }

  @override
  void dispose() {
    socket?.dispose();
    super.dispose();
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
      body: StreamBuilder<List<ParkInfoGetAllModel>>(
          stream: ParkListStream(),
          builder: (BuildContext context,
              AsyncSnapshot<List<ParkInfoGetAllModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No parks found'));
            } else {
              final park = snapshot.data;
              return ListView.builder(
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
                                navigateToEdit(context, park);
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
                                deletePark();
                              },
                            ),
                          ],
                        ),
                      ),
                      onTap: () => openParkDetail(context, park),
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}

void openParkDetail(BuildContext context, ParkInfoGetAllModel park) {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: Stack(
          children: <Widget>[
            Text(park.parkName ?? '',
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w800,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1
                    ..color = Colors.black45!,
                )),
            Text(
              park.parkName ?? '',
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey[300],
                letterSpacing: 2,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    Icon(Icons.drive_file_rename_outline_sharp,
                        size: 50, color: Colors.yellow.shade100),
                    const SizedBox(width: 30.0),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _cardText(park),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black38,
                          minimumSize: const Size(200, 50)),
                      onPressed: () {
                        navigateToEdit(context, park);
                      },
                      child: Text('Edit',
                          style: GoogleFonts.rajdhani(
                              color: const Color(0xffffffff),
                              fontSize: 18,
                              fontWeight: FontWeight.bold))),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        minimumSize: const Size(200, 50)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Close',
                      style: GoogleFonts.rajdhani(
                          color: Colors.orange.shade100,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    },
  );
}

List<Widget> _cardText(ParkInfoGetAllModel park) {
  return [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: <Widget>[
            Text(
              'District= ${park.district}',
              style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w700,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1
                    ..color = Colors.black!),
            ),
            Text(
              'District= ${park.district}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[300],
                letterSpacing: 2,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        Stack(
          children: <Widget>[
            Text('Capacity= ${park.capacity}',
                style: TextStyle(
                  letterSpacing: 2,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1
                    ..color = Colors.black!,
                )),
            Text(
              'Capacity= ${park.capacity}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[300],
                letterSpacing: 2,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Stack(
          children: <Widget>[
            Text('Empty Capacity= ${park.emptyCapacity}',
                style: TextStyle(
                    letterSpacing: 2,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1
                      ..color = Colors.black!)),
            Text(
              'Empty Capacity= ${park.emptyCapacity}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[300],
                letterSpacing: 2,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        Stack(
          children: <Widget>[
            Text(
              'Free Time= ${park.freeTime}',
              style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w700,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1
                    ..color = Colors.black!),
            ),
            Text(
              'Free Time= ${park.freeTime}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[300],
                letterSpacing: 2,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        Stack(
          children: <Widget>[
            Text(
              'Work Hours= ${park.workHours}',
              style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w700,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1
                    ..color = Colors.black!),
            ),
            Text(
              'Work Hours= ${park.workHours}',
              style: TextStyle(
                letterSpacing: 2,
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.grey[300],
              ),
            )
          ],
        ),
      ],
    ),
  ];
}

void navigateToEdit(BuildContext context, ParkInfoGetAllModel park) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => UpdateParkView(park: park),
    ),
  );
}
