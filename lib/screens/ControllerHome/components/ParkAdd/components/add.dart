import 'package:flutter/material.dart';

import '../../../../../language/language_items.dart';

class AddParkView extends StatefulWidget {
  const AddParkView({super.key});

  @override
  State<AddParkView> createState() => _AddViewHomeState();
}

class _AddViewHomeState extends State<AddParkView> {
  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Center(
        child: deviceOrientation == Orientation.portrait
            ? const AddParkColumn()
            : const AddParkRow(),
      ),
    );
  }
}

class AddParkColumn extends StatefulWidget {
  const AddParkColumn({super.key});

  @override
  State<AddParkColumn> createState() => _AddParkColumnState();
}

class _AddParkColumnState extends State<AddParkColumn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                const SizedBox(
                  child: Text(
                    'Add Park',
                    style: TextStyle(color: Colors.amber, fontSize: 28),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                const SizedBox(
                  width: 600,
                  child: TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: LanguageItems.parkNameTitle,
                      prefixIconColor: Colors.white,
                      prefixIcon: Icon(Icons.local_parking_rounded),
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 270,
                      child: TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelText: LanguageItems.districtTitle,
                          prefixIconColor: Colors.white,
                          prefixIcon: Icon(Icons.add_location_alt_sharp),
                          focusedBorder: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    SizedBox(
                      width: 160,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelText: LanguageItems.fireeTimeTitle,
                          prefixIconColor: Colors.white,
                          prefixIcon: Icon(Icons.more_time_sharp),
                          focusedBorder: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    SizedBox(
                      width: 160,
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelText: LanguageItems.workHoursTitle,
                          prefixIconColor: Colors.white,
                          prefixIcon: Icon(Icons.work_history_outlined),
                          focusedBorder: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 297,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelText: LanguageItems.capacity,
                          prefixIconColor: Colors.white,
                          prefixIcon: Icon(Icons.check_box_outlined),
                          focusedBorder: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 6)),
                    SizedBox(
                      width: 297,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelText: LanguageItems.emptyCapacity,
                          prefixIconColor: Colors.white,
                          prefixIcon: Icon(Icons.check_box_outline_blank_sharp),
                          focusedBorder: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: const ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(600, 50)),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black12),
                      ),
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Success'),
                              content: const Text('Park created.'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text(
                        'OK',
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddParkRow extends StatefulWidget {
  const AddParkRow({super.key});

  @override
  State<AddParkRow> createState() => _AddParkRowState();
}

class _AddParkRowState extends State<AddParkRow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                const SizedBox(
                  child: Text(
                    'Add Park',
                    style: TextStyle(color: Colors.amber, fontSize: 28),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                const SizedBox(
                  width: 600,
                  child: TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: LanguageItems.parkNameTitle,
                      prefixIconColor: Colors.white,
                      prefixIcon: Icon(Icons.local_parking_rounded),
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 270,
                      child: TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelText: LanguageItems.districtTitle,
                          prefixIconColor: Colors.white,
                          prefixIcon: Icon(Icons.add_location_alt_sharp),
                          focusedBorder: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    SizedBox(
                      width: 160,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelText: LanguageItems.fireeTimeTitle,
                          prefixIconColor: Colors.white,
                          prefixIcon: Icon(Icons.more_time_sharp),
                          focusedBorder: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    SizedBox(
                      width: 160,
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelText: LanguageItems.workHoursTitle,
                          prefixIconColor: Colors.white,
                          prefixIcon: Icon(Icons.work_history_outlined),
                          focusedBorder: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 297,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelText: LanguageItems.capacity,
                          prefixIconColor: Colors.white,
                          prefixIcon: Icon(Icons.check_box_outlined),
                          focusedBorder: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 6)),
                    SizedBox(
                      width: 297,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelText: LanguageItems.emptyCapacity,
                          prefixIconColor: Colors.white,
                          prefixIcon: Icon(Icons.check_box_outline_blank_sharp),
                          focusedBorder: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: const ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(600, 50)),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black12),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Success'),
                              content: const Text('Park Created.'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text(
                        'OK',
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
