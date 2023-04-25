import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OperatorAdd extends StatefulWidget {
  const OperatorAdd({super.key});

  @override
  State<OperatorAdd> createState() => _OperatorAddState();
}

class _OperatorAddState extends State<OperatorAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Text('data'),
        ],
      ),
    );
  }
}
