import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_sizes.dart';
import 'package:alpha_pilot/const/app_styling.dart';
import 'package:alpha_pilot/generated/assets.dart';
import 'package:alpha_pilot/view/screens/client_module/main_flow/cleanining_details.dart';
import 'package:alpha_pilot/view/widget/common_image_view_widget.dart';
import 'package:alpha_pilot/view/widget/icon_text_row.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:alpha_pilot/view/widget/trans_container.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ClientCleanTile extends StatelessWidget {
  final String team;
  final String title;
  final String location;
  final String dateTime;

  final CleanStatus status;

  final int validatedPoints;
  final int totalPoints;
  final int incidents;
  final int remainingMinutes;
  final int compliance; // percentage

  const ClientCleanTile({
    super.key,
    required this.team,
    required this.title,
    required this.location,
    required this.dateTime,
    required this.status,
    this.validatedPoints = 0,
    this.totalPoints = 15,
    this.incidents = 0,
    this.remainingMinutes = 0,
    this.compliance = 0,
  });

  @override
  Widget build(BuildContext context) {
    final config = CleanStatusConfig.fromStatus(status);

    return Bounce(
      onTap: () {
        Get.to(() => CleaniningDetails());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: roundedsr(color2: kQuaternaryColor, radius: 22),
        child: Row(
          children: [
            CommonImageView(imagePath: config.icon, height: 32),

            const SizedBox(width: 15),

            /// LEFT SIDE
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TransparentContainer(
                    opacity: 1,
                    text: team,
                    padends: 30,
                    color1: ktransparent,
                    color2: kGreyColor,
                    textColor: kGreyColor,
                  ),
                  const SizedBox(height: 8),

                  MyText(text: title, size: 20, maxLines: 1),

                  IconTextRow(
                    iconpath: Assets.imagesPin,
                    text: location,
                    iconsize: 17,
                    textsize: 14,
                    maxlines1: 2,
                    textcolor: kBlackColor,
                  ),

                  IconTextRow(
                    iconpath: Assets.imagesClock,
                    text: dateTime,
                    iconsize: 17,
                    textsize: 14,
                    maxlines1: 2,
                    textcolor: kBlackColor,
                  ),
                ],
              ),
            ),

            /// RIGHT SIDE
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(text: 'Status', size: 9, weight: wlight),

                TransparentContainer(
                  text: config.label,
                  color1: config.color,
                  opacity: 1,
                  fontStyle: FontStyle.italic,
                ),

                if (status == CleanStatus.completed) ...[
                  const SizedBox(height: 4),
                  MyText(text: 'Compliance', size: 9, weight: wlight),
                  TransparentContainer(
                    text: '$compliance%',
                    color1: config.color,
                    opacity: 1,
                    padends: 25,
                    textWeight: wheavy,
                  ),
                ] else ...[
                  const SizedBox(height: 4),
                  MyText(text: 'Validated points', size: 9, weight: wlight),
                  TransparentContainer(
                    text: '$validatedPoints out of $totalPoints',
                    color1: kBlackColor,
                    opacity: 1,
                    padends: 20,
                  ),

                  const SizedBox(height: 4),
                  MyText(text: 'Remaining time', size: 9, weight: wlight),
                  TransparentContainer(
                    text: _formatTime(remainingMinutes),
                    color1: kBlackColor,
                    opacity: 1,
                    padends: 20,
                  ),
                ],

                if (status == CleanStatus.completed) ...[
                  const SizedBox(height: 4),
                  MyText(text: 'Incidents', size: 9, weight: wlight),
                  TransparentContainer(
                    text: incidents.toString(),
                    color1: kRedEmber,
                    opacity: 1,
                    padends: 20,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(int minutes) {
    final h = minutes ~/ 60;
    final m = minutes % 60;
    return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
  }
}

enum CleanStatus { completed, inProgress, todo }

class CleanStatusConfig {
  final String label;
  final Color color;
  final String icon;

  CleanStatusConfig({
    required this.label,
    required this.color,
    required this.icon,
  });

  static CleanStatusConfig fromStatus(CleanStatus status) {
    switch (status) {
      case CleanStatus.completed:
        return CleanStatusConfig(
          label: 'Completed',
          color: kMintGreen,
          icon: Assets.imagesTick2,
        );

      case CleanStatus.inProgress:
        return CleanStatusConfig(
          label: 'In progress',
          color: kBlueColor,
          icon: Assets.imagesRight, // use your blue icon
        );

      case CleanStatus.todo:
        return CleanStatusConfig(
          label: 'To do',
          color: kGreyColor,
          icon: Assets.imagesClockfill, // use your grey icon
        );
    }
  }
}
