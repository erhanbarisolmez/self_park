import 'package:flutter/material.dart';
import 'package:self_park/core/models/ParkInfoGetModel.dart';

import '../../../../../language/language_items.dart';

class UpdateParkView extends StatefulWidget {
  final ParkInfoGetAllModel park;
  const UpdateParkView({Key? key, required this.park}) : super(key: key);

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
            ? UpdateColumn(
                park: widget.park,
              )
            : const UpdateRow(),
      ),
    );
  }
}

class UpdateColumn extends StatefulWidget {
  final ParkInfoGetAllModel park;

  const UpdateColumn({Key? key, required this.park}) : super(key: key);

  @override
  State<UpdateColumn> createState() => _UpdateColumnState();
}

class _UpdateColumnState extends State<UpdateColumn> {
  final TextEditingController _parkNameController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _freeTimeController = TextEditingController();
  final TextEditingController _workHoursController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();
  final TextEditingController _emptyCapacityController =
      TextEditingController();
  @override
  void initState() {
    super.initState();
    _parkNameController.text = widget.park.parkName!;
    _districtController.text = widget.park.district!;
    _freeTimeController.text = widget.park.freeTime!.toString();
    _workHoursController.text = widget.park.workHours!.toString();
    _capacityController.text = widget.park.capacity!.toString();
    _emptyCapacityController.text = widget.park.emptyCapacity!.toString();
  }

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
                    'Edit Park',
                    style: TextStyle(color: Colors.amber, fontSize: 28),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                SizedBox(
                  width: 600,
                  child: TextField(
                    controller: _parkNameController,
                    cursorColor: Colors.amber,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
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
                  children: [
                    SizedBox(
                      width: 270,
                      child: TextField(
                        controller: _districtController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
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
                    const Padding(padding: EdgeInsets.only(left: 5)),
                    SizedBox(
                      width: 160,
                      child: TextField(
                        controller: _freeTimeController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
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
                    const Padding(padding: EdgeInsets.only(left: 5)),
                    SizedBox(
                      width: 160,
                      child: TextField(
                        controller: _workHoursController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
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
                  children: [
                    SizedBox(
                      width: 297,
                      child: TextField(
                        controller: _capacityController,
                        keyboardType: TextInputType.name,
                        obscureText: false,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
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
                    const Padding(padding: EdgeInsets.only(left: 6)),
                    SizedBox(
                      width: 297,
                      child: TextField(
                        controller: _emptyCapacityController,
                        keyboardType: TextInputType.name,
                        obscureText: false,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
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
                              style: _buttonStyle().copyWith(
                                  fixedSize: const MaterialStatePropertyAll(
                                      Size(180, 50))),
                              onPressed: () async {},
                              child: const Text('Search')),
                          ElevatedButton(
                              style: _buttonStyle().copyWith(
                                  fixedSize: const MaterialStatePropertyAll(
                                      Size(300, 50))),
                              onPressed: () async {},
                              child: const Text('Update')),
                          ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {},
                            child: const Text('Delete'),
                          ),
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
  const UpdateRow({Key? key}) : super(key: key);

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
                    'Edit Park',
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 297,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        obscureText: false,
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
                        obscureText: false,
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
      fixedSize: MaterialStatePropertyAll(Size(100, 50)),
      backgroundColor: MaterialStatePropertyAll(Colors.black12));
}
