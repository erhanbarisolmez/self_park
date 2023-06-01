import 'package:flutter/material.dart';

import '../../../../../language/language_items.dart';

class UpdateParkView extends StatefulWidget {
  const UpdateParkView({super.key});

  @override
  State<UpdateParkView> createState() => _UpdateParkViewState();
}

class _UpdateParkViewState extends State<UpdateParkView> {
  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Center(
        child: deviceOrientation == Orientation.portrait
            ? const UpdateColumn()
            : const UpdateRow(),
      ),
    );
  }
}

class UpdateColumn extends StatefulWidget {
  const UpdateColumn({super.key});

  @override
  State<UpdateColumn> createState() => _UpdateColumnState();
}

class _UpdateColumnState extends State<UpdateColumn> {
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
                          labelText: LanguageItems.freeTimeTitle,
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
                  child: SizedBox(
                    width: 600,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              style: _buttonStyle(),
                              onPressed: () {},
                              child: const Text('Search')),
                          ElevatedButton(
                              style: _buttonStyle().copyWith(
                                  fixedSize: const MaterialStatePropertyAll(
                                      Size(400, 50))),
                              onPressed: () {},
                              child: const Text('Update')),
                        ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UpdateRow extends StatefulWidget {
  const UpdateRow({super.key});

  @override
  State<UpdateRow> createState() => _UpdateRowState();
}

class _UpdateRowState extends State<UpdateRow> {
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
                          labelText: LanguageItems.freeTimeTitle,
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
                  child: SizedBox(
                    width: 600,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              style: _buttonStyle(),
                              onPressed: () {},
                              child: const Text('Search')),
                          ElevatedButton(
                              style: _buttonStyle().copyWith(
                                  fixedSize: const MaterialStatePropertyAll(
                                      Size(400, 50))),
                              onPressed: () {},
                              child: const Text('Update')),
                        ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

ButtonStyle _buttonStyle() {
  return const ButtonStyle(
      fixedSize: MaterialStatePropertyAll(Size(190, 50)),
      backgroundColor: MaterialStatePropertyAll(Colors.black12));
}
