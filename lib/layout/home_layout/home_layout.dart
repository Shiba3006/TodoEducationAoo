import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/modules/default_screen/default_screen.dart';
import 'package:to_do/modules/finished_screen/finished_screen.dart';
import 'package:to_do/modules/personal_screen/personal_screen.dart';
import 'package:to_do/modules/setting_screen/setting_screen.dart';
import 'package:to_do/modules/wishlist_screen/wishlist_screen.dart';
import 'package:to_do/modules/work_screen/work_screen.dart';
import 'package:to_do/shared/components/components.dart';
import 'package:to_do/shared/cubit/cubit.dart';
import 'package:to_do/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget { // All Lists
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = ToDoCubit.get(context);

    return BlocConsumer<ToDoCubit, ToDoState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title:  const Text(
              'Home',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.settings,
                ),
              ),
            ],
          ),
          drawer: Drawer(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Wrap(
                      runSpacing: 14.0,
                      children: [
                        drawerItemBuilder(
                          icon: Icons.home,
                          title: 'Home',
                        ),
                        drawerItemBuilder(
                          icon: Icons.format_list_bulleted_outlined,
                          title: 'Default',
                          onTap: () => cubit.changeScreen(context, const DefaultScreen(),),
                        ),
                        drawerItemBuilder(
                          icon: Icons.format_list_bulleted_outlined,
                          title: 'Personal',
                          onTap: () => cubit.changeScreen(context, const PersonalScreen(),),
                        ),
                        drawerItemBuilder(
                          icon: Icons.format_list_bulleted_outlined,
                          title: 'Wishlist',
                            onTap: () => cubit.changeScreen(context, const WishlistScreen(),),
                          ),
                        drawerItemBuilder(
                          icon: Icons.format_list_bulleted_outlined,
                          title: 'Work',
                          onTap: () => cubit.changeScreen(context, const WorkScreen(),),
                        ),
                        drawerItemBuilder(
                          icon: Icons.format_list_bulleted_outlined,
                          title: 'Finished',
                          onTap: () => cubit.changeScreen(context, const FinishedsScreen(),),
                        ),
                        const Divider(
                          color: Colors.black,),
                        drawerItemBuilder(
                          icon: Icons.settings,
                          title: 'Setting',
                          onTap: () => cubit.changeScreen(context, const SettingScreen(),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: ()
                  {
                  },
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              ),
              Container(
                color: Colors.lightBlueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children:  [
                      const Icon(
                        Icons.mic_outlined,
                        //color: Colors.white,
                      ),
                      Expanded(
                          child: TextFormField(
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
