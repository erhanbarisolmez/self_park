import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'components/OperatorAdd/index.dart';

class ControllerHome extends StatefulWidget {
  const ControllerHome({super.key});

  @override
  State<ControllerHome> createState() => _ControllerHomeState();
}

class _ControllerHomeState extends State<ControllerHome> {
  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: deviceOrientation == Orientation.portrait
            ? const _ControlWidget()
            : const _ControlWidgetRow(),
      ),
    );
  }
}

class _ControlWidget extends StatelessWidget {
  const _ControlWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.yellow.shade100,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OperatorAdd(),
                      ));
                },
                child: const SizedBox(
                  width: 600,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Operator Kayıt / Düzenle',
                      style: TextStyle(color: Colors.black54, fontSize: 20),
                    ),
                  ),
                )),
            const SizedBox(height: 10),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.orange.shade100,
                ),
                onPressed: () {},
                child: const SizedBox(
                  width: 600,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Park Ekle / Düzenle',
                      style: TextStyle(color: Colors.black54, fontSize: 20),
                    ),
                  ),
                )),
            const SizedBox(height: 10),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.yellow.shade100,
                ),
                onPressed: () {},
                child: const SizedBox(
                  width: 600,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Raporlar',
                      style: TextStyle(color: Colors.black54, fontSize: 20),
                    ),
                  ),
                )),
            const SizedBox(height: 10),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.orange.shade100,
                ),
                onPressed: () {},
                child: const SizedBox(
                  width: 600,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Park Durumu Görüntüle',
                      style: TextStyle(color: Colors.black54, fontSize: 20),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class _ControlWidgetRow extends StatelessWidget {
  const _ControlWidgetRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.yellow.shade100,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OperatorAdd(),
                    ));
              },
              child: const SizedBox(
                width: 800,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Operator Kayıt / Düzenle',
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                ),
              )),
          const SizedBox(height: 10),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.orange.shade100,
              ),
              onPressed: () {},
              child: const SizedBox(
                width: 800,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Park Ekle / Düzenle',
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                ),
              )),
          const SizedBox(height: 10),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.yellow.shade100,
              ),
              onPressed: () {},
              child: const SizedBox(
                width: 800,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Raporlar',
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                ),
              )),
          const SizedBox(height: 10),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.orange.shade100,
              ),
              onPressed: () {},
              child: const SizedBox(
                width: 800,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Park Durumu Görüntüle',
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
