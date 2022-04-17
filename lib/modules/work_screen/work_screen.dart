import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkScreen extends StatelessWidget {
  const WorkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      Container(
        child: Center(child: Text('work lost',)),
      ),
    );
  }
}
