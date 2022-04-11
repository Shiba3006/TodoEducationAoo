import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  String dropdownValue = 'One';

  void changeValue ({required value}) {
    dropdownValue = value!;
    emit(ToDoStateChangeDropDown());
  }

  }