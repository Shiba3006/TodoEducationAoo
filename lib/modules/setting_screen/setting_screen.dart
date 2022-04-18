import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/shared/components/components.dart';
import 'package:to_do/shared/cubit/cubit.dart';
import 'package:to_do/shared/cubit/states.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = ToDoCubit.get(context);
    String appBarTitle = 'setting';
    return BlocConsumer<ToDoCubit, ToDoState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: myAppBar(appBarTitle: appBarTitle),
          drawer: drawerBuilder(context: context, cubit: cubit,),
        );
      },
    );
  }
}
