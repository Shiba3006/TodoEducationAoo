import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinishedsScreen extends StatelessWidget {
  const FinishedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      Container(
        child: Center(child: Text('finished lost',)),
      ),
    );
  }
}
