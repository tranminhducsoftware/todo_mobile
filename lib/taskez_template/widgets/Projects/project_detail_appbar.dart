import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_mobile/taskez_template/Values/values.dart';
import 'package:todo_mobile/taskez_template/widgets/Projects/project_badge.dart';

class ProjectDetailAppBar extends StatelessWidget {
  final String color;
  final String projectName;
  final VoidCallback? iconTapped;
  final String category;

  const ProjectDetailAppBar(
      {Key? key,
      required this.color,
      required this.projectName,
      required this.category,
      this.iconTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child:
                        ColouredProjectBadge(color: color, category: category)),
                AppSpaces.horizontalSpace10,
                Expanded(
                    flex: 4,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(projectName,
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(height: 5),
                          Text(category,
                              style: GoogleFonts.lato(
                                  fontSize: 13,
                                  color: HexColor.fromHex("#3699ff"))),
                        ]))
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Row(children: [
                // Expanded(
                //     flex: 1,
                //     child:
                //         Icon(FeatherIcons.star, color: Colors.white, size: 30)),
                // AppSpaces.horizontalSpace10,
                Expanded(
                    flex: 1,
                    child: InkWell(
                        onTap: iconTapped,
                        child: Icon(Icons.more_horiz,
                            color: Colors.white, size: 30)))
              ]))
        ]);
  }
}
