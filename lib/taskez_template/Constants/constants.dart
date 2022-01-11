import 'package:flutter/material.dart';
import 'package:todo_mobile/src/screens/dashboard/dashboard.dart';
import 'package:todo_mobile/src/screens/dashboard/notifications.dart';
import 'package:todo_mobile/src/screens/dashboard/projects.dart';
import 'package:todo_mobile/src/screens/dashboard/search_screen.dart';
import 'package:todo_mobile/taskez_template/Data/data_model.dart';

import 'package:todo_mobile/taskez_template/Values/values.dart';
import 'package:todo_mobile/taskez_template/widgets/Chat/online_user.dart';

String tabSpace = "\t\t\t";

final List<Widget> dashBoardScreens = [
  Dashboard(),
  ProjectScreen(),
  NotificationScreen(),
  SearchScreen()
];

List<Color> progressCardGradientList = [
  //grenn
  HexColor.fromHex("87EFB5"),
  //blue
  HexColor.fromHex("8ABFFC"),
  //pink
  HexColor.fromHex("EEB2E8"),
];

final onlineUsers = List.generate(
    AppData.onlineUsers.length,
    (index) => OnlineUser(
          image: AppData.onlineUsers[index]['profileImage'],
          imageBackground: AppData.onlineUsers[index]['color'],
          userName: AppData.onlineUsers[index]['name'],
        ));
