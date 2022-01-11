import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_mobile/src/datas/repositories/interfaces/account_repository.dart';
import 'package:todo_mobile/src/screens/auth/login/login.dart';
import 'package:todo_mobile/taskez_template/Values/values.dart';
import 'package:todo_mobile/taskez_template/widgets/Buttons/primary_progress_button.dart';
import 'package:todo_mobile/taskez_template/widgets/Buttons/progress_card_close_button.dart';
import 'package:todo_mobile/taskez_template/widgets/DarkBackground/darkRadialBackground.dart';
import 'package:todo_mobile/taskez_template/widgets/Profile/badged_container.dart';
import 'package:todo_mobile/taskez_template/widgets/Profile/text_outlined_button.dart';
import 'package:todo_mobile/taskez_template/widgets/container_label.dart';
import 'package:todo_mobile/taskez_template/widgets/dummy/profile_dummy.dart';

import 'my_profile.dart';
import 'my_team.dart';
import 'profile_notification_settings.dart';

class ProfileOverview extends StatelessWidget {
   ProfileOverview({Key? key}) : super(key: key);

  IAccountRepository accountRepository = GetIt.I.get<IAccountRepository>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      DarkRadialBackground(
        color: HexColor.fromHex("#181a1f"),
        position: "topLeft",
      ),
      Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SafeArea(
              child: SingleChildScrollView(
                  child: Column(children: [
            Align(
              alignment: Alignment.center,
              child: ProfileDummy(
                  color: HexColor.fromHex("94F0F1"),
                  dummyType: ProfileDummyType.Image,
                  scale: 3.0,
                  image: "assets/man-head.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Blake Gordon",
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
            ),
            Text("blake@email.com",
                style: GoogleFonts.lato(
                    color: HexColor.fromHex("B0FFE1"), fontSize: 17)),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: OutlinedButtonWithText(
                width: 150,
                content: "View Profile",
                onPressed: () {
                  Get.to(() => ProfilePage());
                },
              ),
            ),
            AppSpaces.verticalSpace20,
            const ContainerLabel(label: "Workspace"),
            AppSpaces.verticalSpace10,
            Container(
              width: double.infinity,
              height: 90,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: AppColors.primaryBackgroundColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileDummy(
                              color: HexColor.fromHex("94F0F1"),
                              dummyType: ProfileDummyType.Image,
                              scale: 1.20,
                              image: "assets/man-head.png"),
                          AppSpaces.horizontalSpace20,
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("UI8 Design",
                                    style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 5),
                                Text("hello@ui8.net",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold,
                                        color: HexColor.fromHex("5E6272")))
                              ])
                        ]),
                    PrimaryProgressButton(
                      width: 90,
                      height: 40,
                      label: "Invite",
                      textStyle: GoogleFonts.lato(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ]),
            ),
            AppSpaces.verticalSpace20,
            const ContainerLabel(label: "Notification"),
            AppSpaces.verticalSpace10,
            BadgedContainer(
              label: "Do not disturb",
              callback: () {
                Get.to(() => ProfileNotificationSettings());
              },
              value: "Off",
              badgeColor: "FDA5FF",
            ),
            AppSpaces.verticalSpace20,
            const ContainerLabel(label: "Manage"),
            AppSpaces.verticalSpace10,
            Row(children: [
              Expanded(
                flex: 1,
                child: BadgedContainer(
                  label: "Log out",
                  value: "8",
                  badgeColor: "FDA5FF",
                  callback: () async {
                    await accountRepository.logout();
                    Get.to(() => const Login());
                  },
                ),
              ),
              // AppSpaces.horizontalSpace10,
              // Expanded(
              //   flex: 1,
              //   child: BadgedContainer(
              //     label: "Labels",
              //     value: "12",
              //     badgeColor: "FFDE72",
              //   ),
              // )
            ]),
            // AppSpaces.verticalSpace20,
            // Container(
            //     width: double.infinity,
            //     height: 50,
            //     decoration: BoxDecoration(
            //         color: HexColor.fromHex("FF968E"),
            //         borderRadius: BorderRadius.circular(10)),
            //     child: Center(
            //       child: BadgedContainer(
            //         label: "Team",
            //         value: "8",
            //         badgeColor: "FDA5FF",
            //         callback: () async {
            //          await accountRepository.logout();
            //           Get.to(() => Login());
            //         },
            //       ),
            //
            //       // Text("Log Out",
            //       //     style: GoogleFonts.lato(
            //       //         color: Colors.white,
            //       //         fontSize: 16,
            //       //         fontWeight: FontWeight.bold)),
            //     ))
          ])))),
      Positioned(
          top: 50,
          left: 20,
          child: Transform.scale(
              scale: 1.2,
              child: ProgressCardCloseButton(onPressed: () {
                Get.back();
              })))
    ]));
  }
}
