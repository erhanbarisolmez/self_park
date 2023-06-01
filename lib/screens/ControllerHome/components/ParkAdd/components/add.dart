import 'package:flutter/material.dart';
import 'package:self_park/core/db/query/controller/addPark/parkAddQuery.dart';

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
  const AddParkColumn({Key? key}) : super(key: key);

  @override
  State<AddParkColumn> createState() => _AddParkColumnState();
}

class _AddParkColumnState extends State<AddParkColumn> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _parkName = TextEditingController();
    TextEditingController _district = TextEditingController();
    TextEditingController _workHours = TextEditingController();
    TextEditingController _freeTime = TextEditingController();
    TextEditingController _capacity = TextEditingController();
    TextEditingController _emptyCapacity = TextEditingController();

    setState(() {
      _parkName.text = "";
      _district.text = "";
      _workHours.text = "";
      _freeTime.text = "";
      _capacity.text = "";
      _emptyCapacity.text = "";
    });
    @override
    void dispose() {
      _parkName.dispose();
      _district.dispose();
      _workHours.dispose();
      _freeTime.dispose();
      _capacity.dispose();
      _emptyCapacity.dispose();
      super.dispose();
    }

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
                SizedBox(
                  width: 600,
                  child: TextField(
                    controller: _parkName,
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
                        controller: _district,
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
                        controller: _freeTime,
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
                        controller: _workHours,
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
                        controller: _capacity,
                        keyboardType: TextInputType.number,
                        obscureText: true,
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
                        controller: _emptyCapacity,
                        keyboardType: TextInputType.number,
                        obscureText: true,
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
                  child: ElevatedButton(
                      style: const ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(600, 50)),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black12),
                      ),
                      onPressed: () async {
                        String parkName = _parkName.text;
                        String district = _district.text;
                        String freeTime = _freeTime.text;
                        String workHours = _workHours.text;
                        String capacity = _capacity.text;
                        String emptyCapacity = _emptyCapacity.text;

                        if (parkName.isEmpty ||
                            district.isEmpty ||
                            freeTime.isEmpty ||
                            workHours.isEmpty ||
                            capacity.isEmpty ||
                            emptyCapacity.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content:
                                    const Text('Please fill in all fields.'),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'))
                                ],
                              );
                            },
                          );
                          return; // Daha fazla işlem yapmamak için fonksiyondan çıkıyor.
                        }

                        bool isExistingPark = await checkIfParkExists(parkName);
                        if (isExistingPark) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content: const Text(
                                    'Please enter another park name, it already exists.'),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'))
                                ],
                              );
                            },
                          );
                        } else {
                          int? capacityValue = int.tryParse(capacity);
                          int? emptyCapacityValue = int.tryParse(emptyCapacity);
                          int? freeTimeValue = int.tryParse(freeTime);

                          if (capacityValue != null &&
                              emptyCapacityValue != null &&
                              freeTimeValue != null) {
                            bool isAddPark = await addParkQuery(
                                parkName,
                                capacityValue,
                                emptyCapacityValue,
                                freeTimeValue,
                                district,
                                workHours);
                            if (!isAddPark) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Success'),
                                    content: const Text('Operator Created'),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            _parkName.text = "";
                                            _district.text = "";
                                            _workHours.text = "";
                                            _freeTime.text = "";
                                            _capacity.text = "";
                                            _emptyCapacity.text = "";
                                          },
                                          child: const Text('OK'))
                                    ],
                                  );
                                },
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Error'),
                                    content: const Text('Try again.'),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Ok'))
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        }
                      },
                      child: const Text(
                        'Add',
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
