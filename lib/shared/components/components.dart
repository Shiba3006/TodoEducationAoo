import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget drawerItemBuilder ({
  required IconData icon,
  required String title,
  void Function()? onTap,
}) => ListTile(
  leading: Icon(icon,),
  title: Text(
    title,
    style: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  onTap: onTap,
);

void navigateTo ({
  required context, required Widget widget,
}) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) =>  widget,
  ),
);