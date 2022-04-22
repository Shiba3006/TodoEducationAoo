import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:to_do/shared/cubit/bloc_observer.dart';
import 'package:to_do/shared/cubit/cubit.dart';
import 'package:to_do/shared/cubit/states.dart';
import 'package:to_do/shared/network/cashe_helper.dart';

import 'layout/home_layout/home_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isReleasedMode = const bool.fromEnvironment('dart.vm.product');
  if (isReleasedMode) {
    debugPrint = (String? message, {int? wrapWidth}) => {};
  }

  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');

  BlocOverrides.runZoned(
    () => runApp(MyApp(
      isDark: isDark,
    )),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.isDark}) : super(key: key);

  final bool? isDark;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ToDoCubit()..changeThemeMode(fromShared: isDark),
        child: BlocConsumer<ToDoCubit, ToDoState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                canvasColor: HexColor(
                    'fffff4'),
                unselectedWidgetColor: Colors.black,
                scaffoldBackgroundColor: HexColor(
                    'fffff2'),
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
                canvasColor: HexColor(
                    '004c4c'),
                unselectedWidgetColor: Colors.white,
                scaffoldBackgroundColor: HexColor(
                    '006666'),
                iconTheme: const IconThemeData(
                  color: Colors.white70,
                ),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                    color: Colors.white70,
                  ),
                ),
                appBarTheme: AppBarTheme(
                  color: HexColor(
                      '004c4c'),
                  titleTextStyle: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white70,
                  ),
                  iconTheme: const IconThemeData(
                    color: Colors.white70,
                  ),
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: HexColor(
                      'b2d8d8',),
                  foregroundColor: HexColor(
                      '004c4c',),
                ),
              ),
              themeMode:  ToDoCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
              home: const HomeLayout(),
            );
          },
        ));
  }
}
