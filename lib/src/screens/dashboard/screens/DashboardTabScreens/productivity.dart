import 'package:flutter/material.dart';
import 'package:todo_mobile/taskez_template/Values/values.dart';
import 'package:todo_mobile/taskez_template/widgets/Dashboard/daily_goal_card.dart';
import 'package:todo_mobile/taskez_template/widgets/Dashboard/productivity_chart.dart';

class DashboardProductivity extends StatelessWidget {
  const DashboardProductivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DailyGoalCard(),
        AppSpaces.verticalSpace20,
        ProductivityChart()
      ],
    );
  }
}
