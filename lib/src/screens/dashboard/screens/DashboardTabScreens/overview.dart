import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcard/tcard.dart';
import 'package:todo_mobile/src/screens/dashboard/bloc/overview_bloc/overview_bloc.dart';
import 'package:todo_mobile/taskez_template/Data/data_model.dart';
import 'package:todo_mobile/taskez_template/Values/values.dart';
import 'package:todo_mobile/taskez_template/widgets/Dashboard/overview_task_container.dart';
import 'package:todo_mobile/taskez_template/widgets/Dashboard/task_progress_card.dart';

class OverviewOverview extends StatefulWidget {
  const OverviewOverview({Key? key}) : super(key: key);

  @override
  _OverviewOverviewState createState() => _OverviewOverviewState();
}

class _OverviewOverviewState extends State<OverviewOverview> {
  @override
  void initState() {
    super.initState();
    // _dispatchEvent(
    //     context); // This will dispatch the navigateToHomeScreen event.
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
          child: SingleChildScrollView(
            child: _buildBody(context),
          ),
        );
  }

  BlocProvider<OverviewBloc> _buildBody(BuildContext context) {
    final dynamic data = AppData.progressIndicatorList;
    List<Widget> cards = List.generate(
        5,
        (index) => TaskProgressCard(
              cardTitle: data[index]['cardTitle'],
              rating: data[index]['rating'],
              progressFigure: data[index]['progress'],
              percentageGap: int.parse(data[index]['progressBar']),
            ));

    return BlocProvider(
        create: (context) => OverviewBloc(),
        child:
            BlocBuilder<OverviewBloc, OverviewState>(builder: (context, state) {
          if (state is InitialOverview) {
            BlocProvider.of<OverviewBloc>(context).add(
              LoadAggregateData(),
            );
          }
          if (state is AggregateDatas) {
            return Column(
              children: [
                SizedBox(
                  height: 150,
                  child: TCard(
                    cards: cards,
                  ),
                ),
                AppSpaces.verticalSpace10,
                Column(
                  children: [
                    OverviewTaskContainer(
                        cardTitle: "Nhân viên",
                        numberOfItems:
                            state.aggregateData.totalEmployees.toString(),
                        imageUrl: "assets/orange_pencil.png",
                        backgroundColor: HexColor.fromHex("EFA17D")),
                    OverviewTaskContainer(
                        cardTitle: "Phòng ban bộ phận",
                        numberOfItems:
                            state.aggregateData.totalWorkDepartment.toString(),
                        imageUrl: "assets/green_pencil.png",
                        backgroundColor: HexColor.fromHex("7FBC69")),
                    OverviewTaskContainer(
                        cardTitle: "Dự án",
                        numberOfItems:
                            state.aggregateData.totalProject.toString(),
                        imageUrl: "assets/cone.png",
                        backgroundColor: HexColor.fromHex("EDA7FA")),
                    OverviewTaskContainer(
                        cardTitle: "Dự án đang thực hiện",
                        numberOfItems:
                            state.aggregateData.totalProjectDoing.toString(),
                        imageUrl: "assets/cone.png",
                        backgroundColor: HexColor.fromHex("EDA7FA")),
                  ],
                ),
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }

}
