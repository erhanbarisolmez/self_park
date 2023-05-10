import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:postgresql2/constants.dart';
import 'package:self_park/core/db/query/controller/addOperator/album.dart';

import '../../../../../core/db/query/controller/addOperator/getAlbum.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<List<Album>>? album;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    album = getAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Data'),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Album>>(
          future: album,
          builder: (context, data) {
            if (data.hasData) {
              return ListView.builder(
                itemCount: data.data?.length,
                itemBuilder: (context, index) {
                  return Text(data.data![index].title.toString());
                },
              );
            } else if (data.hasError) {
              return Text(data.error.toString());
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
