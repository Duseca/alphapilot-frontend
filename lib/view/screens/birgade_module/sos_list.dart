import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_sizes.dart';
import 'package:alpha_pilot/const/app_styling.dart';
import 'package:alpha_pilot/generated/assets.dart';
import 'package:alpha_pilot/view/widget/Icon_title_subtitle.dart';
import 'package:alpha_pilot/view/widget/icon_text_row.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:alpha_pilot/view/widget/simple_app_bar.dart';
import 'package:alpha_pilot/view/widget/sos_card.dart';
import 'package:alpha_pilot/view/widget/trans_container.dart';
import 'package:alpha_pilot/view/widget/two_text_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class SosList extends StatelessWidget {
  const SosList({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> soscategories = [
      {'title': 'Critical', 'gradient': gradred},
      {'title': 'Urgent', 'gradient': gradorange},
      {'title': 'Important', 'gradient': gradolive},
      {'title': 'Resolved', 'gradient': gradgreen},
    ];
    final List<SubjectSosModel> sosList = [
      SubjectSosModel(
        id: "1",
        title: "MH 100",
        location: "Hotel A, Allée des Pins",
        dateTime: DateTime(2026, 3, 6, 10, 0),
        subject: "Subject SOS 1...............................",
        priority: SosPriority.critical,
      ),
      SubjectSosModel(
        id: "2",
        title: "MH 101",
        location: "Hotel A, Allée des Pins",
        dateTime: DateTime(2026, 3, 6, 10, 0),
        subject: "Subject SOS 2..................................",
        priority: SosPriority.urgent,
      ),
      SubjectSosModel(
        id: "2",
        title: "MH 102",
        location: "Hotel A, Allée des Pins",
        dateTime: DateTime(2026, 3, 6, 10, 0),
        subject: "Subject SOS 2..................................",
        priority: SosPriority.important,
      ),
    ];

    return Scaffold(
      appBar: simpleAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //    SizedBox(height: 30),
          IconTitleSubtitle(
            padEnds: 10,
            topPadimg: 5,
            mhoriz: 30,
            mvertical: 10,
            padVertical: 16,
            decoration: roundedsr(color: kQuaternaryColor),
            iconheight: 16,
            weight1: wregular,
            path: Assets.imagesIcon,
            title: 'SOS List',
            weight2: wlight,
            size1: 18,
            gap: 5,
            hastsubtitle: T,
            crossAxisAlignment: CrossAxisAlignment.start,
            subtitle: 'Sorted by priority',
            size2: 10,
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              physics: BouncingScrollPhysics(),
              children: [
                Row(
                  spacing: 7,
                  children: List.generate(
                    soscategories.length,
                    (index) => Expanded(
                      child: Container(
                        height: 93,
                        decoration: graddecor(
                          gradient: soscategories[index]['gradient'],
                          radius: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RotatedBox(
                              quarterTurns: 1,
                              child: MyText(
                                size: 16,
                                text: soscategories[index]['title'],
                                color: kQuaternaryColor,
                                weight: wbold,
                              ),
                            ),
                            MyText(
                              text: '2',
                              size: 42,
                              color: kQuaternaryColor,
                              weight: wblack,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: sosList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SubjectSosCard(model: sosList[index]);
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
