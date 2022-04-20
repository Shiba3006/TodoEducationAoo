import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/shared/components/components.dart';
import 'package:to_do/shared/cubit/states.dart';

class ToDoCubit extends Cubit<ToDoState> {
  ToDoCubit() : super(ToDoStateInitial());

  static ToDoCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  String subtitleCheckBox = 'Disabled' ;

  void changeThemeMode (bool value) {
    isDark = value;
    changeSubtitleCheckBox();
    emit(ToDoStateChangeThemeMode());
  }
  void changeSubtitleCheckBox () {
    if ( isDark == false ) { subtitleCheckBox = 'Disabled'; }
    else { subtitleCheckBox = 'Enabled'; }
  }

  void changeScreen (context,Widget widget,){
    Navigator.pop(context);
    navigateTo (widget: widget, context: context);
    emit(ToDoStateChangeScreen());
  }



  }