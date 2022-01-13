import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';
import 'package:todo_mobile/src/screens/dashboard/bloc/project_bloc/project_bloc.dart';
import 'package:todo_mobile/taskez_template/Data/data_model.dart';
import 'package:todo_mobile/taskez_template/Values/values.dart';
import 'package:todo_mobile/taskez_template/widgets/Buttons/primary_tab_buttons.dart';
import 'package:todo_mobile/taskez_template/widgets/Chat/add_chat_icon.dart';
import 'package:todo_mobile/taskez_template/widgets/Navigation/app_header.dart';
import 'package:todo_mobile/taskez_template/widgets/Projects/project_card_horizontal.dart';
import 'package:todo_mobile/taskez_template/widgets/Projects/project_card_vertical.dart';

class ProjectScreen extends StatelessWidget {
  ProjectScreen({Key? key}) : super(key: key);

  ValueNotifier<int> _settingsButtonTrigger = ValueNotifier(0);
  ValueNotifier<bool> _switchGridLayout = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: SafeArea(
          child: TaskezAppHeader(
            title: "Projects",
            widget: AppAddIcon(scale: 1.0),
          ),
        ),
      ),
      AppSpaces.verticalSpace20,
      Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          //tab indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PrimaryTabButton(
                  buttonText: "Favorites",
                  itemIndex: 0,
                  notifier: _settingsButtonTrigger),
              PrimaryTabButton(
                  buttonText: "Recent",
                  itemIndex: 1,
                  notifier: _settingsButtonTrigger),
              PrimaryTabButton(
                  buttonText: "All",
                  itemIndex: 2,
                  notifier: _settingsButtonTrigger)
            ],
          ),
          Container(
              alignment: Alignment.centerRight,
              child: InkWell(
                  onTap: () {
                    _switchGridLayout.value = !_switchGridLayout.value;
                    // _showProjectSettings(context);
                  },
                  child: ValueListenableBuilder(
                      valueListenable: _switchGridLayout,
                      builder: (BuildContext context, _, __) {
                        return _switchGridLayout.value
                            ? const Icon(FeatherIcons.clipboard,
                                color: Colors.white, size: 30)
                            : const Icon(FeatherIcons.grid,
                                color: Colors.white, size: 30);
                      })))
        ]),
      ),
      AppSpaces.verticalSpace20,
      Expanded(
        child: _buildProject(context),
      )
    ]);
  }

  BlocProvider<ProjectBloc> _buildProject(BuildContext context) {
    return BlocProvider(
        create: (context) => ProjectBloc(),
        child:
            BlocBuilder<ProjectBloc, ProjectState>(builder: (context, state) {
          if (state is Initial) {
            BlocProvider.of<ProjectBloc>(context).add(
              GetProjects(),
            );
          } else if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedProjects) {
            return Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ValueListenableBuilder(
                  valueListenable: _switchGridLayout,
                  builder: (BuildContext context, _, __) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //change
                        crossAxisCount: _switchGridLayout.value ? 2 : 1,
                        mainAxisSpacing: 10,

                        //change height 125
                        mainAxisExtent: _switchGridLayout.value ? 220 : 125,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (_, index) => _switchGridLayout.value
                          ? ProjectCardVertical(
                              projectName: state.projects[index].name,
                              dataTime: DateFormat("dd/MM/yyyy")
                                      .format(state.projects[index].fromDate)
                                      .toString() +
                                  " - " +
                                  DateFormat("dd/MM/yyyy")
                                      .format(state.projects[index].toDate)
                                      .toString(),
                              color: state.projects[index].color,
                              assignName: state.projects[index].mainAssignName,
                              category: state.projects[index].mainAssignName,
                              ratingsUpperNumber:
                                  state.projects[index].workDoing,
                              ratingsLowerNumber:
                                  state.projects[index].workDoing +
                                      state.projects[index].workDone)
                          : ProjectCardHorizontal(
                              projectName: state.projects[index].name,
                              dataTime: DateFormat("dd/MM/yyyy")
                                      .format(state.projects[index].fromDate)
                                      .toString() +
                                  " - " +
                                  DateFormat("dd/MM/yyyy")
                                      .format(state.projects[index].toDate)
                                      .toString(),
                              color: state.projects[index].color,
                              assignName: state.projects[index].mainAssignName,
                          projectId: state.projects[index].id,
                              category: state.projects[index].mainAssignName,
                              ratingsUpperNumber:
                                  state.projects[index].workDoing,
                              ratingsLowerNumber:
                                  state.projects[index].workDoing +
                                      state.projects[index].workDone),
                      itemCount: state.projects.length,
                    );
                  },
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}
