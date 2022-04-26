
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
  required BuildContext context,
  required IconData icon,
  required String title,
  void Function()? onTap,
}) => ListTile(
  leading: Icon(icon,),
  title: Text(
    title,
    style: Theme.of(context).textTheme.bodyText1,
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
                context: context,
                icon: Icons.home,
                title: 'Home',
                onTap: () => cubit.changeScreen(context, const HomeLayout(),),
              ),
              drawerItemBuilder(
                context: context,
                icon: Icons.format_list_bulleted_outlined,
                title: 'Default',
                onTap: () => cubit.changeScreen(context, const DefaultScreen(),),
              ),
              drawerItemBuilder(
                context: context,
                icon: Icons.format_list_bulleted_outlined,
                title: 'Personal',
                onTap: () => cubit.changeScreen(context, const PersonalScreen(),),
              ),
              drawerItemBuilder(
                context: context,
                icon: Icons.format_list_bulleted_outlined,
                title: 'Wishlist',
                onTap: () => cubit.changeScreen(context, const WishlistScreen(),),
              ),
              drawerItemBuilder(
                context: context,
                icon: Icons.format_list_bulleted_outlined,
                title: 'Work',
                onTap: () => cubit.changeScreen(context, const WorkScreen(),),
              ),
              drawerItemBuilder(
                context: context,
                icon: Icons.format_list_bulleted_outlined,
                title: 'Finished',
                onTap: () => cubit.changeScreen(context, const FinishedScreen(),),
              ),
              myDivider(),
              drawerItemBuilder(
                context: context,
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

Widget myFloatingActionButton(context) => FloatingActionButton(
  onPressed: ()
  {
    ToDoCubit.get(context).createDatabase();
  },
  child: const Icon(
    Icons.add,
    size: 30.0,
  ),
);

PreferredSizeWidget myAppBar ({required String appBarTitle}) => AppBar(
  title: Text(
    appBarTitle,
  ),
  actions: const [
    Padding(
      padding: EdgeInsetsDirectional.only(
        end: 10.0,
      ),
      child: Icon(
        Icons.search,
      ),
    ),
  ],
);

Widget taskItemBuilder () => Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    padding: const EdgeInsets.all(
      15.0,),
    decoration: BoxDecoration(
      borderRadius: BorderRadiusDirectional.circular(20.0),
      color: Colors.black26,
    ),
    child: Row(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  'Date',
                ),
                Text(
                  ', Repeat',
                ),
              ],
            ),
            Text(
              'List',
            ),
          ],
        ),
      ],
    ),
  ),
);

void navigateTo ({
  required context, required Widget widget,
}) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) =>  widget,
  ),
);