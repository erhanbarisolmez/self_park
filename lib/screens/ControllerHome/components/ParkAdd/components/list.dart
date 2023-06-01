import 'package:flutter/material.dart';

//AboutListTile class

class ListParkView extends StatefulWidget {
  const ListParkView({super.key});

  @override
  State<ListParkView> createState() => _ListParkViewState();
}

class _ListParkViewState extends State<ListParkView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Park List'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.white24,
          );
        },
        itemBuilder: (context, index) {
          index += 1;
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Text('name:'),
                ),
                SizedBox(
                  child: Text('capacity:'),
                ),
                SizedBox(
                  child: Text('empty capacity:'),
                ),
                SizedBox(
                  child: Text('fire time:'),
                ),
                SizedBox(
                  child: Text('work hours:'),
                ),
                SizedBox(
                  child: Text('district:'),
                ),
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
