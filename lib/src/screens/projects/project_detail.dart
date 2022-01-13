import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_mobile/src/datas/models/work/work_info.dart';
import 'package:todo_mobile/src/datas/models/work/work_input_query.dart';
import 'package:todo_mobile/taskez_template/BottomSheets/bottom_sheets.dart';
import 'package:todo_mobile/taskez_template/Values/values.dart';
import 'package:todo_mobile/taskez_template/widgets/Buttons/primary_tab_buttons.dart';
import 'package:todo_mobile/taskez_template/widgets/DarkBackground/darkRadialBackground.dart';
import 'package:todo_mobile/taskez_template/widgets/Projects/layout_list_tile.dart';
import 'package:todo_mobile/taskez_template/widgets/Projects/project_detail_appbar.dart';
import 'package:todo_mobile/taskez_template/widgets/Projects/project_task_card.dart';
import 'package:todo_mobile/taskez_template/widgets/Shapes/app_settings_icon.dart';

import 'bloc/work_bloc/work_bloc.dart';

// ignore: must_be_immutable
class ProjectDetails extends StatelessWidget {
  final String color;
  final String projectName;
  final int? projectId;
  final String category;

  ProjectDetails({Key? key,
    required this.color,
    required this.projectName,
    this.projectId,
    required this.category})
      : super(key: key);

  ValueNotifier<int> _settingsButtonTrigger = ValueNotifier(0);
  ValueNotifier<int> _layoutButtonTrigger = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DarkRadialBackground(
            color: HexColor.fromHex("#074d80"),
            position: "topLeft",
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProjectDetailAppBar(
                      category: category,
                      color: color,
                      iconTapped: (() {
                        showSettingsBottomSheet();
                      }),
                      projectName: projectName,
                    ),
                    AppSpaces.verticalSpace20,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //tab indicators
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              PrimaryTabButton(
                                  buttonText: "Tất cả",
                                  itemIndex: 0,
                                  notifier: _settingsButtonTrigger),
                              PrimaryTabButton(
                                  buttonText: "Hoàn thành",
                                  itemIndex: 1,
                                  notifier: _settingsButtonTrigger),
                              // PrimaryTabButton(
                              //     buttonText: "Chưa hoàn thành",
                              //     itemIndex: 2,
                              //     notifier: _settingsButtonTrigger)
                            ],
                          ),

                          Container(
                              alignment: Alignment.centerRight,
                              child: AppSettingsIcon(
                                callback: (() {
                                  _showLayoutDialog(context);
                                }),
                              ))
                        ]),
                    AppSpaces.verticalSpace10,
                    Expanded(child: _buildWork(context))
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  _showLayoutDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          insetPadding: const EdgeInsets.only(bottom: 500),
          backgroundColor: HexColor.fromHex("262A34"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          children: [
            LayoutListTile(
              notifier: _layoutButtonTrigger,
              index: 0,
              icon: Icons.checklist,
              title: 'List',
            ),
            Divider(height: 1, color: Colors.white),
            LayoutListTile(
              notifier: _layoutButtonTrigger,
              index: 1,
              icon: Icons.dashboard,
              title: 'Board',
            ),
          ],
          /* ... */
        );
      },
    );
  }


  BlocProvider<WorkBloc> _buildWork(BuildContext context) {
    return BlocProvider(
        create: (context) => WorkBloc(),
        child: BlocBuilder<WorkBloc, WorkState>(builder: (context, state) {
          if (state is Initial) {
            BlocProvider.of<WorkBloc>(context).add(
              GetWorks(WorkInputQuery(projectId, 2022)),
            );
          } else if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedWorks) {
            return MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                  itemCount: state.projectSteps.length,
                  itemBuilder: (BuildContext context, int index) {
                    var lstWork = state.works.where((element) =>
                    element.projectStepId == state.projectSteps[index].id)
                        .toList();
                    return Column(
                      children: [
                        AppSpaces.verticalSpace10,
                        ExpansionTile(
                            initiallyExpanded: true,
                            collapsedIconColor: Colors.white,
                            iconColor: Colors.white,
                            textColor: Colors.white,
                            title: Text(
                                state.projectSteps[index].name.toString(),
                                style: GoogleFonts.lato(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                )),
                            children: <Widget>[
                              for(var work in lstWork)
                                ProjectTaskCardWidget(context,work)

                            ]

                        ),
                      ],
                    );
                  }),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }

  Widget ProjectTaskCardWidget(BuildContext context, WorkInfo workInfo) {
    return ProjectTaskCard(
        activated: workInfo.status == 3 ? true : false,
        header: workInfo.name.toString(),
        image: "assets/memoji/default-profile-picture.png",
        backgroundColor: "FCA4FF",
        assignName: workInfo.workAssignorName,
        date: workInfo.toDate != null ? (DateFormat("dd/MM/yyyy")
            .format(workInfo.toDate?? DateTime.now())
            .toString() ) : "");
  }


}
