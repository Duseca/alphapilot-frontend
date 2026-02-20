import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_styling.dart';
import 'package:alpha_pilot/view/screens/agent_module/agent_missions_details.dart';
import 'package:alpha_pilot/view/widget/Icon_title_subtitle.dart';
import 'package:alpha_pilot/view/widget/client_clean_tile.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:alpha_pilot/view/widget/simple_app_bar.dart';
import 'package:alpha_pilot/view/widget/trans_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class AgentMissions extends StatelessWidget {
  const AgentMissions({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ClientCleanTile> items = [
      ClientCleanTile(
        team: "Team 1",
        title: "MH-100",
        location: "Hotel A, Pine Alley",
        dateTime: "March 6, 2026\n10:00 AM",
        status: CleanStatus.finished,
        compliance: 98,
        incidents: 1,
        isagent: true,
        onTap: () => Get.to(() => AgentMissionsDetails()),
      ),
      ClientCleanTile(
        team: "Team 1",
        title: "MH-100",
        location: "Hotel A, Pine Alley",
        dateTime: "March 6, 2026\n10:00 AM",
        status: CleanStatus.inProgress,
        validatedPoints: 6,
        totalPoints: 15,
        isagent: true,
        remainingMinutes: 60,
        onTap: () => Get.to(() => AgentMissionsDetails()),
      ),
      ClientCleanTile(
        team: "Team 1",
        title: "MH-100",
        location: "Hotel A, Pine Alley",
        dateTime: "March 6, 2026\n10:00 AM",
        status: CleanStatus.todo,
        validatedPoints: 0,
        totalPoints: 15,
        isagent: true,
        remainingMinutes: 180,
        onTap: () => Get.to(() => AgentMissionsDetails()),
      ),
    ];
    return Scaffold(
      appBar: simpleAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              physics: BouncingScrollPhysics(),
              children: [
                IconTitleSubtitle(
                  title: 'Mission List',
                  size1: 18,
                  subtitle: '2 out of 4 missions completed',
                  hasicon: false,
                  hastsubtitle: true,
                  padEnds: 10,
                  size2: 14,
                  padVertical: 10,
                  colspace: 10,
                  decoration: roundedsr(
                    color: kQuaternaryColor,
                    color2: kQuaternaryColor,
                  ),
                  subtitleWidget: LinearPercentIndicator(
                    padding: EdgeInsets.all(0),
                    progressColor: kMintGreen,
                    backgroundColor: kPrimaryColor,
                    percent: 0.6,
                    lineHeight: 7,
                    barRadius: Radius.circular(10),
                  ),
                  trailing: Column(
                    children: [
                      TransparentContainer(
                        text: 'Team 1',
                        opacity: 1,
                        textSize: 16,
                        textColor: kBlackColor,
                        color2: kGreyColor,
                        color1: ktransparent,
                        padends: 30,
                        radius: 100,
                        padvertical: 0,
                      ),

                      MyText(
                        text: 'Ahead by',
                        size: 10,
                        color: kMintGreen,
                        paddingTop: 20,
                      ),
                      Center(
                        child: TransparentContainer(
                          text: '+01:30',
                          opacity: 1,

                          textSize: 10,
                          color1: kMintGreen,
                          padends: 20,
                          radius: 100,
                          padvertical: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(bottom: 0),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return items[index];
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
