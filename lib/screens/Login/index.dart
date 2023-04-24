import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:self_park/language/language_items.dart';

import 'components/controller.dart';
import 'components/operator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final double toolbarHeight2 = 70;

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;

    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: toolbarHeight2,
          title: Padding(
            padding: _PaddingUtility().logoPadding,
            child: Expanded(
              child: _Image().imageLogo,
            ),
          ),
          bottom: _myTabView(context),
        ),
        body: deviceOrientation == Orientation.portrait
            ? _tabbarView()
            : _tabbarViewRow(),
      ),
    );
  }

  TabBar _myTabView(BuildContext context) {
    return TabBar(
      onTap: (int index) {
        print(index);
      },
      indicatorColor: _ColorsUtility().shade3002,
      labelStyle: Theme.of(context).textTheme.headlineSmall,
      tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList(),
    );
  }

  TabBarView _tabbarView() {
    return const TabBarView(physics: NeverScrollableScrollPhysics(), children: [
      Operator(),
      Controller(),
    ]);
  }

  TabBarView _tabbarViewRow() {
    return const TabBarView(physics: NeverScrollableScrollPhysics(), children: [
      Operator(),
      Controller(),
    ]);
  }
}

// ignore: constant_identifier_names
enum _MyTabViews { Operator, Controller }

extension _MyTabVieExtension on _MyTabViews {}

class _ColorsUtility {
  final shade3002 = Colors.amber.shade300;
  final grey300 = Colors.grey[300];
}

class _PaddingUtility {
  final logoPadding = const EdgeInsets.only(top: 20);
  final normalPadding = const EdgeInsets.all(8.0);
}

class _Image {
  final imageLogo = Image.network(
      'https://www.selftech-tr.com/wp-content/uploads/2022/05/stl5555-2.png');
}
