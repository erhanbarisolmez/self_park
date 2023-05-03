import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:self_park/core/db/query/controller/addOperator/listQuery.dart';

class ListViewHome extends StatefulWidget {
  const ListViewHome({super.key});

  @override
  State<ListViewHome> createState() => _ListViewState();
}

class _ListViewState extends State<ListViewHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.white24,
          );
        },
        itemBuilder: (context, index) {
          index += 1;

          return SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(children: [Text('$index. ')]),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Update'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Delete'),
                    )
                  ],
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