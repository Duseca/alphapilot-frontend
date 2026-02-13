import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_sizes.dart';
import 'package:alpha_pilot/const/app_styling.dart';
import 'package:alpha_pilot/generated/assets.dart';
import 'package:alpha_pilot/view/screens/birgade_module/sos_details.dart';
import 'package:alpha_pilot/view/widget/Icon_title_subtitle.dart';
import 'package:alpha_pilot/view/widget/common_image_view_widget.dart';
import 'package:alpha_pilot/view/widget/icon_text_row.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:alpha_pilot/view/widget/trans_container.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SubjectSosCard extends StatelessWidget {
  final SubjectSosModel model;

  const SubjectSosCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return IconTitleSubtitle(
      ontap: () {
        Get.to(() => SosDetailScreen(model: model));
      },
      color1: kBlackColor,
      padEnds: 5,
      topPadimg: 0,
      mhoriz: 10,
      isradiotile: true,
      hasicon: false,
      customradio: Container(
        padding: EdgeInsets.all(6),
        decoration: circle(
          getPriorityColor(model.priority),
          getPriorityColor(model.priority),
        ),
        child: CommonImageView(imagePath: Assets.imagesWARNING, height: 20),
      ),
      mvertical: 5,
      padVertical: 0,
      decoration: roundedsr(color: kQuaternaryColor, radius: 20),
      iconheight: 32,
      weight1: wregular,
      path: Assets.imagesWARNING,
      title: model.title,
      weight2: wlight,
      lineheight: 0.9,
      size1: 32,
      gap: 5,
      maxlines1: 1,
      crossAxisAlignment: CrossAxisAlignment.center,
      subtitleWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconTextRow(
            iconpath: Assets.imagesPin,
            text: model.location,
            iconsize: 17,
            textsize: 14,
            maxlines1: 2,
            lineheight: 1,
            crossAxisAlignment: CrossAxisAlignment.center,
            textcolor: kBlackColor,
          ),
          IconTextRow(
            iconpath: Assets.imagesClock,
            text:
                "${_formatDate(model.dateTime)}\n${_formatTime(model.dateTime)}",
            iconsize: 17,
            maxlines1: 2,
            lineheight: 1,
            textsize: 14,
            crossAxisAlignment: CrossAxisAlignment.center,
            textcolor: kBlackColor,
          ),
        ],
      ),
      trailing: SizedBox(
        width: 96,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TransparentContainer(
              text: getPriorityText(model.priority),
              opacity: 1,
              color1: getPriorityColor(model.priority),
            ),
            const SizedBox(height: 20),
            MyText(lineHeight: 0.9, text: model.subject),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.day} ${_monthName(date.month)}, ${date.year}";
  }

  String _formatTime(DateTime date) {
    return "${date.hour}:${date.minute.toString().padLeft(2, '0')}";
  }

  String _monthName(int month) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return months[month - 1];
  }
}

enum SosPriority { critical, urgent, important }

class SubjectSosModel {
  final String id;
  final String title; // MH 100
  final String location;
  final DateTime dateTime;
  final String subject;
  final SosPriority priority;

  SubjectSosModel({
    required this.id,
    required this.title,
    required this.location,
    required this.dateTime,
    required this.subject,
    required this.priority,
  });
}

Color getPriorityColor(SosPriority priority) {
  switch (priority) {
    case SosPriority.critical:
      return kRedColor;
    case SosPriority.urgent:
      return Color(0xffF5740B);
    case SosPriority.important:
      return Color(0xffAEAA3C);
  }
}

String getPriorityText(SosPriority priority) {
  switch (priority) {
    case SosPriority.critical:
      return "Critical";
    case SosPriority.urgent:
      return "Urgent";
    case SosPriority.important:
      return "Important";
  }
}
