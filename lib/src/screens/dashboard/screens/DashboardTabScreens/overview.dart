import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcard/tcard.dart';
import 'package:todo_mobile/src/screens/dashboard/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:todo_mobile/taskez_template/Data/data_model.dart';
import 'package:todo_mobile/taskez_template/Values/values.dart';
import 'package:todo_mobile/taskez_template/widgets/Dashboard/overview_task_container.dart';
import 'package:todo_mobile/taskez_template/widgets/Dashboard/task_progress_card.dart';

class DashboardOverview extends StatefulWidget {
  const DashboardOverview({Key? key}) : super(key: key);

  @override
  _DashboardOverviewState createState() => _DashboardOverviewState();
}

class _DashboardOverviewState extends State<DashboardOverview> {
  @override
  void initState() {
    super.initState();
    // _dispatchEvent(context); // This will dispatch the navigateToHomeScreen event.
  }
  @override
  Widget build(BuildContext context) {
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
        create: (context) => DashboardBloc(),
        child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
          return Column(
            children: [
              Container(
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
                      numberOfItems: "17",
                      imageUrl: "assets/orange_pencil.png",
                      backgroundColor: HexColor.fromHex("EFA17D")),
                  OverviewTaskContainer(
                      cardTitle: "Phòng ban bộ phận",
                      numberOfItems: "32",
                      imageUrl: "assets/green_pencil.png",
                      backgroundColor: HexColor.fromHex("7FBC69")),
                  OverviewTaskContainer(
                      cardTitle: "Dự án",
                      numberOfItems: "8",
                      imageUrl: "assets/cone.png",
                      backgroundColor: HexColor.fromHex("EDA7FA")),
                  OverviewTaskContainer(
                      cardTitle: "Dự án đang thực hiện",
                      numberOfItems: "18",
                      imageUrl: "assets/cone.png",
                      backgroundColor: HexColor.fromHex("EDA7FA")),
                ],
              ),
            ],
          );
        }));


  }

  void _dispatchEvent(BuildContext context) {
    BlocProvider.of<DashboardBloc>(context).add(
      LoadAggregateData(),
    );
  }
}
