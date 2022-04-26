import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do/shared/components/components.dart';
import 'package:to_do/shared/cubit/states.dart';
import 'package:to_do/shared/network/cashe_helper.dart';

class ToDoCubit extends Cubit<ToDoState> {
  ToDoCubit() : super(ToDoStateInitial());

  static ToDoCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  String subtitleCheckBox = 'Disabled';
  late Database database;

  void changeThemeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      changeSubtitleCheckBox();
      emit(ToDoStateChangeThemeMode());
    } else {
      isDark = !isDark;
      CacheHelper.setBoolean(key: 'isDark', value: isDark).then((value) {
        changeSubtitleCheckBox();
        emit(ToDoStateChangeThemeMode());
      });
    }
  }

  void changeSubtitleCheckBox() {
    if (isDark == false) {
      subtitleCheckBox = 'Disabled';
    } else {
      subtitleCheckBox = 'Enabled';
    }
  }

  void changeScreen(
    context,
    Widget widget,
  ) {
    Navigator.pop(context);
    navigateTo(widget: widget, context: context);
    emit(ToDoStateChangeScreen());
  }

  void createDatabase() {
    openDatabase(
        'todoo.db',
        version: 3,
        onCreate: (database, version) {
      // id integer
      // title String
      // date String
      // time String
      // status String
      database.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)'
              )
          .then((value) {debugPrint('Table created');})
          .catchError((e) {
        debugPrint('error when creating table ${e.toString()}');
      });
    }, onOpen: (database) {
      getDataFromDataBase(database);
      debugPrint('database opened');
    }).then((value) {
      database = value;
      emit(ToDoCreateDatabaseState());
    }).catchError((e) {
      debugPrint('Error when Create database => ${e.toString()}');
    });
  }

  insertDatabase({
    required String title,
    required String date,
    required String time,
    required String status,
  }) {
    database.transaction((txn) async {
      txn
          .rawInsert('insert into tasks (title, date, time, status)'
              'values("$title", "$date", "$time", "$status")')
          .then((value) {
        debugPrint('$value successfully inserted');
        emit(ToDoInsertDatabaseState());
        getDataFromDataBase(database);
      }).catchError((e) {
        debugPrint('Error when Insert database => ${e.toString()}');
      });
    });
  }

  void getDataFromDataBase(Database database) {
    var homeTasks = [];
    var defaultTasks = [];
    var personalTasks = [];
    var wishlistTasks = [];
    var workTasks = [];
    var finishedTasks = [];

    database.rawQuery('select * from tasks').then((value) {
      for (var element in value) {
        if (element['status'] == 'default') {
          defaultTasks.add(element);
          homeTasks.add(element);
        }
        else if (element['status'] == 'personal') {
          personalTasks.add(element);
          homeTasks.add(element);
        }
        else if (element['status'] == 'wishlist') {
          wishlistTasks.add(element);
          homeTasks.add(element);
        }
        else if (element['status'] == 'work') {
          workTasks.add(element);
          homeTasks.add(element);
        }
        else {
          finishedTasks.add(element);
        }
      }
      debugPrint('Successfully got data from database');
      emit(ToDoGetDatabaseState());
    }).catchError((e) {
      debugPrint('Error when get database => ${e.toString()}');
    });
  }

  void updateDataBase({
    required String status,
    required int id,
  })
  {
    database.rawUpdate(
      'update tasks set status =? where id =?',
          [status, id],
    ).then((value) {
      debugPrint('Successfully Updated database' );
      emit(ToDoUpdateDatabaseState());
    }).catchError((e){
      debugPrint('Error when update database => ${e.toString()}');
    })
    ;
  }

  void deleteDataBase ({
  required int id,
}) async
  {
    database.rawDelete(
      'delete from tasks where id = ?',
          [id],
    ).then((value)
    {
      debugPrint('Successfully deleted data from database');
      emit(ToDoDeleteDatabaseState());
    }).catchError((e){
      debugPrint('Error when get database => ${e.toString()}');
    });
  }
}
