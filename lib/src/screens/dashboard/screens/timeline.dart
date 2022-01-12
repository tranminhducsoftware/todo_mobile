import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:todo_mobile/taskez_template/BottomSheets/bottom_sheets.dart';
import 'package:todo_mobile/taskez_template/Constants/constants.dart';
import 'package:todo_mobile/taskez_template/Values/values.dart';
import 'package:todo_mobile/taskez_template/widgets/DarkBackground/darkRadialBackground.dart';
import 'package:todo_mobile/taskez_template/widgets/Dashboard/bottomNavigationItem.dart';
import 'package:todo_mobile/taskez_template/widgets/Dashboard/dashboard_add_icon.dart';
import 'package:todo_mobile/taskez_template/widgets/Dashboard/dashboard_add_sheet.dart';

import 'dashboard.dart';

class Timeline extends StatefulWidget {
  Timeline({Key? key}) : super(key: key);

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  ValueNotifier<int> bottomNavigatorTrigger = ValueNotifier(0);

  StatelessWidget currentScreen = Dashboard();

  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor.fromHex("#074d80"),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Stack(children: [
          DarkRadialBackground(
            color: HexColor.fromHex("#074d80"),
            position: "topLeft",
          ),
          ValueListenableBuilder(
              valueListenable: bottomNavigatorTrigger,
              builder: (BuildContext context, _, __) {
                return PageStorage(
                    child: dashBoardScreens[bottomNavigatorTrigger.value],
                    bucket: bucket);
              })
        ]),
        bottomNavigationBar: Container(
            width: double.infinity,
            height: 90,
            padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: HexColor.fromHex("#074d80").withOpacity(0.8)),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavigationItem(
                      itemIndex: 0,
                      notifier: bottomNavigatorTrigger,
                      icon: Icons.widgets),
                  const Spacer(),
                  BottomNavigationItem(
                      itemIndex: 1,
                      notifier: bottomNavigatorTrigger,
                      icon: FeatherIcons.clipboard),
                  const Spacer(),
                  DashboardAddButton(
                    iconTapped: (() {
                      showAppBottomSheet(SizedBox(
                          height: Utils.screenHeight * 0.8,
                          child: const DashboardAddBottomSheet()));
                    }),
                  ),
                  const Spacer(),
                  BottomNavigationItem(
                      itemIndex: 2,
                      notifier: bottomNavigatorTrigger,
                      icon: FeatherIcons.bell),
                  const Spacer(),
                  BottomNavigationItem(
                      itemIndex: 3,
                      notifier: bottomNavigatorTrigger,
                      icon: FeatherIcons.search)
                ])));
  }
}
