import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/layout/home_layout/home_layout.dart';
import 'package:to_do/modules/default_screen/default_screen.dart';
import 'package:to_do/modules/finished_screen/finished_screen.dart';
import 'package:to_do/modules/wishlist_screen/wishlist_screen.dart';
import 'package:to_do/shared/components/components.dart';
import 'package:to_do/shared/cubit/states.dart';

class ToDoCubit extends Cubit<ToDoState> {
  ToDoCubit() : super(ToDoStateInitial());

  static ToDoCubit get(context) => BlocProvider.of(context);

  List <DropdownMenuItem<String>> items = <String>['One', 'Two', 'three', 'Four']
      .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  var dropdownValue = 'One';

  void changeValue ({required value}) {
    dropdownValue = value!;
    emit(ToDoStateChangeDropDown());
  }

  void changeScreen (context,Widget widget,){
    Navigator.pop(context);
    navigateTo (widget: widget, context: context);
    emit(ToDoStateChangeScreen());
  }

  }