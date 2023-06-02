import 'package:flutter/material.dart';
import 'package:self_park/screens/ControllerHome/components/ParkAdd/components/update.dart';

import '../../../../../core/db/connect.dart';
import '../../../../../core/db/query/controller/addPark/models/park.dart';

class ListParkView extends StatefulWidget {
  const ListParkView({Key? key}) : super(key: key);

  @override
  _ListParkViewState createState() => _ListParkViewState();
}

class _ListParkViewState extends State<ListParkView> {
  late Future<List<Park>> parkListFuture;

  @override
  void initState() {
    super.initState();
    parkListFuture = parkList();
  }

  Future<List<Park>> parkList() async {
    final connect = await connectToDB();
    final results = await connect?.query('''
      select * from tbl_ispark order by park_id desc LIMIT 10 
    ''');

    final parkListResult = results?.map((row) {
      final parkId = BigInt.from(row[0] as int);
      final parkName = row[1] as String;
      final capacity = row[2].toString();
      final emptyCapacity = row[3].toString();
      final freeTime = row[4].toString();
      final district = row[5] as String;
      final workHours = row[6] as String;

      return Park(
        parkId: parkId,
        parkName: parkName,
        capacity: capacity,
        emptyCapacity: emptyCapacity,
        freeTime: freeTime,
        district: district,
        workHours: workHours,
      );
    }).toList();

    await connect!.close();

    return parkListResult!;
  }

  Future<void> deletePark(BigInt parkId) async {
    final connect = await connectToDB();
    await connect!.execute('''
      delete from tbl_ispark where park_id = @parkId
    ''', substitutionValues: {'parkId': parkId.toString()});
    await connect.close();
    setState(() {
      parkListFuture = parkList();
    });
  }

  void openParkDetail(Park park) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(park.parkName),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    children: [
                      const Icon(Icons.drive_file_rename_outline_sharp,
                          size: 50),
                      const SizedBox(width: 30.0),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Capacity: ${park.capacity}'),
                              Text('Empty Capacity: ${park.emptyCapacity}'),
                              Text('Free Time: ${park.freeTime}'),
                              Text('District: ${park.district}'),
                              Text('Work Hours: ${park.workHours}'),
                            ],
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
                        onPressed: () {
                          const Icon(Icons.edit);
                          navigateToList();
                        },
                        child: const Text('Edit')),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
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

  void navigateToList() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const UpdateParkView();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Last 10 Park'),
      ),
      body: FutureBuilder<List<Park>>(
        future: parkListFuture,
        builder: (BuildContext context, AsyncSnapshot<List<Park>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No parks found'));
          } else {
            final parks = snapshot.data!;
            return ListView.builder(
              itemCount: parks.length,
              itemBuilder: (context, index) {
                final park = parks[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(park.parkName),
                    leading: Icon(Icons.account_box,
                        size: 50, color: Colors.yellow.shade100),
                    subtitle: Text('Capacity: ${park.capacity}'),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.orange.shade100,
                        size: 28,
                      ),
                      onPressed: () => deletePark(park.parkId),
                    ),
                    onTap: () => openParkDetail(park),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}



// import '../../../../../core/db/connect.dart';
// import '../../../../../core/db/query/controller/addPark/models/park.dart';

// //AboutListTile class

// class ListParkView extends StatefulWidget {
//   const ListParkView({super.key});

//   @override
//   State<ListParkView> createState() => _ListParkViewState();
// }

// class _ListParkViewState extends State<ListParkView> {
//   late Future<List<Park>> parkListFuture;

//   @override
//   void initState() {
//     super.initState();
//     parkListFuture = parkList();
//   }

//   Future<List<Park>> parkList() async {
//     final connect = await connectToDB();
//     final results = await connect?.query('''
//       select * from tbl_ispark order by park_id desc LIMIT 10 
//     ''');

//     final parkListResult = results?.map((row) {
//       final parkId = BigInt.from(row[0] as int);
//       final parkName = row[1] as String;
//       final capacity = row[2].toString();
//       final emptyCapacity = row[3].toString();
//       final freeTime = row[4].toString();
//       final district = row[5] as String;
//       final workHours = row[6] as String;

//       return Park(
//         parkId: parkId,
//         parkName: parkName,
//         capacity: capacity,
//         emptyCapacity: emptyCapacity,
//         freeTime: freeTime,
//         district: district,
//         workHours: workHours,
//       );
//     }).toList();

//     await connect!.close();

//     return parkListResult!;
//   }

//   Future<void> deletePark(BigInt parkId) async {
//     final connect = await connectToDB();
//     await connect!.execute('''
//       delete from tbl_ispark where park_id = @parkId
//     ''', substitutionValues: {'parkId': parkId.toString()});
//     await connect.close();
//     setState(() {
//       parkListFuture = parkList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Last 10 Park List'),
//       ),
//       body: FutureBuilder<List<Park>>(
//         future: parkListFuture,
//         builder: (BuildContext context, AsyncSnapshot<List<Park>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return const Center(child: Text('Error'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No parks found'));
//           } else {
//             final parks = snapshot.data!;
//             return ListView.builder(
//               itemCount: parks.length,
//               itemBuilder: (context, index) {
//                 final park = parks[index];
//                 return ListTile(
//                   title: Text(park.parkName),
//                   subtitle: Text('Capacity: ${park.capacity}'),
//                   trailing: IconButton(
//                     icon: const Icon(Icons.delete),
//                     onPressed: () => deletePark(park.parkId),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
