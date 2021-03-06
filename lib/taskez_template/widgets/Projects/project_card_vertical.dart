import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_mobile/src/screens/projects/project_detail.dart';
import 'package:todo_mobile/taskez_template/Values/values.dart';
import 'package:todo_mobile/taskez_template/widgets/Projects/project_badge.dart';

class ProjectCardVertical extends StatelessWidget {
  final String projectName;
  final String? category;
  final int ratingsUpperNumber;
  final int ratingsLowerNumber;
  final String color;
  final String? assignName;
  final String? dataTime;

  const ProjectCardVertical(
      {Key? key,
      required this.projectName,
      this.category,
      required this.ratingsUpperNumber,
      required this.ratingsLowerNumber,
      required this.color,
      this.assignName,
      this.dataTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProjectDetails(
              category: category ?? "",
              projectName: projectName,
              color: color,
            ));
      },
      child: Container(
          // width: 150,

          //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: HexColor.fromHex("#3699ff"),
              borderRadius: BorderRadius.circular(20)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ColouredProjectBadge(color: color, category: category ?? ""),
            AppSpaces.verticalSpace20,
            Text(projectName,
                // overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 5),
            Expanded(
                child: Text(assignName ?? "",
                    style: GoogleFonts.lato(
                        fontSize: 13, color: const Color(0xFFFFEBEE)))),
            Expanded(
                child: Text(dataTime ?? "",
                    style: GoogleFonts.lato(
                        fontSize: 12, color: const Color(0xFFFFEBEE)))),
            // Expanded(
            //     child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            //   Expanded(
            //     child: Container(
            //         height: 5,
            //         decoration:
            //             BoxDecoration(borderRadius: BorderRadius.circular(10), color: HexColor.fromHex("343840")),
            //         child: Row(children: [
            //           Expanded(
            //               flex: ratingsUpperNumber,
            //               child: Container(
            //                   decoration: BoxDecoration(
            //                       gradient: LinearGradient(
            //                           colors: [darken(HexColor.fromHex(color)), HexColor.fromHex(color)])))),
            //           Expanded(flex: ratingsLowerNumber, child: SizedBox())
            //         ])),
            //   ),
            //   AppSpaces.horizontalSpace10,
            //   Text("$ratingsUpperNumber/$ratingsLowerNumber", style: GoogleFonts.lato(color: Colors.white))
            // ]))
          ])),
    );
  }
}
