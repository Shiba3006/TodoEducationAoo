import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/modules/finished_screen/finished_screen.dart';
import 'package:to_do/modules/personal_screen/personal_screen.dart';
import 'package:to_do/modules/setting_screen/setting_screen.dart';
import 'package:to_do/modules/wishlist_screen/wishlist_screen.dart';
import 'package:to_do/modules/work_screen/work_screen.dart';
import 'package:to_do/shared/components/components.dart';
import 'package:to_do/shared/cubit/cubit.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var cubit = ToDoCubit.get(context);
    return Scaffold(
      appBar: AppBar(),
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
      body:
      Container(
        child: Center(child: Text('defualt lost',)),
      ),
    );
  }
}
