import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_mobile/src/screens/projects/project_detail.dart';
import 'package:todo_mobile/taskez_template/Values/values.dart';
import 'package:todo_mobile/taskez_template/widgets/Projects/project_badge.dart';

class ProjectCardHorizontal extends StatelessWidget {
  final String projectName;
  final String? category;
  final int ratingsUpperNumber;
  final int ratingsLowerNumber;
  final String color;
  final String assignName;
  final String dataTime;
  final int? projectId;

  const ProjectCardHorizontal(
      {Key? key,
      required this.projectName,
      this.category,
      required this.ratingsUpperNumber,
      required this.ratingsLowerNumber,
      required this.color,
      required this.assignName,
      required this.dataTime,
      this.projectId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.to(() => ProjectDetails(
                category: category ?? "",
                projectName: projectName,
                color: color,
                projectId: projectId,
              ));
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: HexColor.fromHex("#3699ff"),
              borderRadius: BorderRadius.circular(20)),
          child: Row(children: [
            Expanded(
              flex: 1,
              child:
                  ColouredProjectBadge(color: color, category: category ?? ""),
            ),
            AppSpaces.horizontalSpace20,
            Expanded(
              flex: 5,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(projectName,
                        // overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 5),
                    Expanded(
                        child: Text(assignName,
                            style: GoogleFonts.lato(
                                fontSize: 13, color: const Color(0xFFFFEBEE)))),
                    Expanded(
                        child: Text(dataTime,
                            style: GoogleFonts.lato(
                                fontSize: 12, color: const Color(0xFFFFEBEE)))),
                  ]),
            ),
            Expanded(
                flex: 1,
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                        color: HexColor.fromHex(color),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("$ratingsUpperNumber/$ratingsLowerNumber",
                        style: GoogleFonts.lato(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: (category == "Development"
                                ? Colors.black
                                : Colors.white)))))
          ]),
        ));
    // );
  }
}
