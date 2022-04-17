import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      Container(
        child: Center(child: Text('Personal lost',)),
      ),
    );
  }
}
