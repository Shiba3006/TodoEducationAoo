import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:to_do/shared/cubit/bloc_observer.dart';
import 'package:to_do/shared/cubit/cubit.dart';
import 'package:to_do/shared/cubit/states.dart';

import 'layout/home_layout/home_layout.dart';

void main() {
  bool isReleasedMode = const bool.fromEnvironment('dart.vm.product');
  if (isReleasedMode) {
    debugPrint = (String? message, {int? wrapWidth}) => {};
  }

  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ToDoCubit(),
        child: BlocConsumer<ToDoCubit, ToDoState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                canvasColor: HexColor('fffff4'),
                scaffoldBackgroundColor: HexColor('fffff2'),
                iconTheme: const IconThemeData(
                  color: Colors.black,
                ),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
                appBarTheme: AppBarTheme(
                  color: HexColor('f9f9f9'),
                  titleTextStyle: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  iconTheme: const IconThemeData(
                    color: Colors.black,
                  ),
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: HexColor('f9f1f1'),
                  foregroundColor: Colors.black,
                ),
              ),
              darkTheme: ThemeData(
                canvasColor: HexColor('558099'),
                scaffoldBackgroundColor: HexColor('448899'),
                appBarTheme: AppBarTheme(
                  color: HexColor('558099'),
                ),
              ),
              home: const HomeLayout(),
            );
          },
        ));
  }
}
