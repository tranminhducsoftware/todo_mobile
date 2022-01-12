import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:todo_mobile/src/screens/chat/chat_screen.dart';
import 'package:todo_mobile/src/screens/dashboard/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:todo_mobile/src/screens/profile/profile_overview.dart';
import 'package:todo_mobile/taskez_template/BottomSheets/bottom_sheets.dart';
import 'package:todo_mobile/taskez_template/Values/values.dart';
import 'package:todo_mobile/taskez_template/widgets/BottomSheets/dashboard_settings_sheet.dart';
import 'package:todo_mobile/taskez_template/widgets/Buttons/primary_tab_buttons.dart';
import 'package:todo_mobile/taskez_template/widgets/Navigation/dasboard_header.dart';
import 'package:todo_mobile/taskez_template/widgets/Shapes/app_settings_icon.dart';

import 'DashboardTabScreens/overview.dart';
import 'DashboardTabScreens/productivity.dart';

// ignore: must_be_immutable
class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  ValueNotifier<bool> _totalTaskTrigger = ValueNotifier(true);
  ValueNotifier<bool> _totalDueTrigger = ValueNotifier(false);
  ValueNotifier<bool> _totalCompletedTrigger = ValueNotifier(true);
  ValueNotifier<bool> _workingOnTrigger = ValueNotifier(false);
  ValueNotifier<int> _buttonTrigger = ValueNotifier(0);


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: _buildBody(context),
          ),
        ));
  }

  BlocProvider<DashboardBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(),
      child: BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
        if (state is Initial) {
          BlocProvider.of<DashboardBloc>(context).add(
            LoadInformationUser(),
          );
        } else if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is InformationUser) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DashboardNav(
                  icon: FontAwesomeIcons.comment,
                  image: "assets/man-head.png",
                  notificationCount: "2",
                  page: ChatScreen(),
                  title: "Dashboard",
                  onImageTapped: () {
                    Get.to(() => ProfileOverview());
                  },
                ),
                AppSpaces.verticalSpace20,
                Text(
                    "Hello,\n" +
                        state.loginInformations!.user!.name.toString() +
                        " 👋",
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold)),
                AppSpaces.verticalSpace20,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //tab indicators
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          PrimaryTabButton(
                              buttonText: "Overview",
                              itemIndex: 0,
                              notifier: _buttonTrigger),
                          PrimaryTabButton(
                              buttonText: "Productivity",
                              itemIndex: 1,
                              notifier: _buttonTrigger)
                        ],
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          child: AppSettingsIcon(
                            callback: () {
                              showAppBottomSheet(
                                DashboardSettingsBottomSheet(
                                  totalTaskNotifier: _totalTaskTrigger,
                                  totalDueNotifier: _totalDueTrigger,
                                  workingOnNotifier: _workingOnTrigger,
                                  totalCompletedNotifier:
                                      _totalCompletedTrigger,
                                ),
                              );
                            },
                          ))
                    ]),
                AppSpaces.verticalSpace20,
                ValueListenableBuilder(
                    valueListenable: _buttonTrigger,
                    builder: (BuildContext context, _, __) {
                      return _buttonTrigger.value == 0
                          ? const DashboardOverview()
                          : const DashboardProductivity();
                    })
              ]);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
