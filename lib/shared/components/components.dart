
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/layout/home_layout/home_layout.dart';
import 'package:to_do/shared/cubit/cubit.dart';
import 'package:to_do/modules/default_screen/default_screen.dart';
import 'package:to_do/modules/finished_screen/finished_screen.dart';
import 'package:to_do/modules/personal_screen/personal_screen.dart';
import 'package:to_do/modules/setting_screen/setting_screen.dart';
import 'package:to_do/modules/wishlist_screen/wishlist_screen.dart';
import 'package:to_do/modules/work_screen/work_screen.dart';

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

Widget drawerBuilder ({
  required context,
  required ToDoCubit cubit,
})=> Drawer(
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
                onTap: () => cubit.changeScreen(context, const HomeLayout(),),
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
                onTap: () => cubit.changeScreen(context, const FinishedScreen(),),
              ),
              myDivider(),
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
);

Widget myDivider () => const Divider(
  color: Colors.black,);

Widget myFloatingActionButton () => Padding(
  padding: const EdgeInsets.all(20.0),
  child: SizedBox(
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: ()
          {
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ],
    ),
  ),
);

PreferredSizeWidget myAppBar ({required String appBarTitle}) => AppBar(
  title: Text(
    appBarTitle,
  ),
  actions: const [
    Icon(
      Icons.search,
    ),
    SizedBox(
      width: 10.0,
    ),
    Padding(
      padding: EdgeInsetsDirectional.only(
        end: 8.0,
      ),
      child: Icon(
        Icons.settings,
      ),
    ),
  ],
);

void navigateTo ({
  required context, required Widget widget,
}) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) =>  widget,
  ),
);