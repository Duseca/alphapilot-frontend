import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_sizes.dart';
import 'package:alpha_pilot/const/app_styling.dart';
import 'package:alpha_pilot/generated/assets.dart';
import 'package:alpha_pilot/view/widget/client_clean_tile.dart';
import 'package:alpha_pilot/view/widget/common_image_view_widget.dart';
import 'package:alpha_pilot/view/widget/gradient_btn.dart';
import 'package:alpha_pilot/view/widget/icon_text_row.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:alpha_pilot/view/widget/trans_container.dart';
import 'package:alpha_pilot/view/widget/two_text_column.dart';
import 'package:flutter/material.dart';

class ClientHome extends StatelessWidget {
  const ClientHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> soscategories = [
      {'title': 'Compliance Rate', 'gradient': gradgreen, 'no': '98%'},
      {'title': 'Daily Interventions', 'gradient': bluegrad, 'no': '2/3'},
      {'title': 'Ongoing Incidents', 'gradient': gradred, 'no': '2'},
    ];
    final List<ClientCleanTile> items = [
      ClientCleanTile(
        team: "Team 1",
        title: "MH-100",
        location: "Hotel A, Pine Alley",
        dateTime: "March 6, 2026\n10:00 AM",
        status: CleanStatus.completed,
        compliance: 98,
        incidents: 1,
      ),
      ClientCleanTile(
        team: "Team 1",
        title: "MH-100",
        location: "Hotel A, Pine Alley",
        dateTime: "March 6, 2026\n10:00 AM",
        status: CleanStatus.inProgress,
        validatedPoints: 6,
        totalPoints: 15,
        remainingMinutes: 60,
      ),
      ClientCleanTile(
        team: "Team 1",
        title: "MH-100",
        location: "Hotel A, Pine Alley",
        dateTime: "March 6, 2026\n10:00 AM",
        status: CleanStatus.todo,
        validatedPoints: 0,
        totalPoints: 15,
        remainingMinutes: 180,
      ),
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 40),
          //    MyText(text: 'text'),
          TwoTextedColumn(
            text1: 'Hello,',
            text2: 'welcome to your home!',
            size1: 26,
            size2: 26,
            weight1: wregular,
            weight2: wregular,
            padEnds: 30,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              physics: BouncingScrollPhysics(),
              children: [
                MyText(
                  paddingRight: 20,
                  paddingLeft: 10,
                  paddingBottom: 16,
                  size: 18,
                  text:
                      'Here is the status of your establishment as of December 29, 2026.',
                ),
                Row(
                  spacing: 7,
                  children: List.generate(
                    soscategories.length,
                    (index) => Expanded(
                      child: Container(
                        decoration: graddecor(
                          gradient: soscategories[index]['gradient'],
                          radius: 24,
                        ),
                        child: Center(
                          child: TwoTextedColumn(
                            weight1: wbold,
                            padVertical: 10,
                            space: 10,
                            padEnds: 10,
                            weight2: wheavy,
                            textAlign: TextAlign.center,
                            alignment: ColumnAlignment.center,
                            color1: kQuaternaryColor,
                            color2: kQuaternaryColor,
                            text1: soscategories[index]['title'],
                            text2: soscategories[index]['no'],
                            size1: 11,
                            size2: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(bottom: 0),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return items[index];
                  },
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GradientButton(
              text: 'REQUEST NEW SERVICE',
              gradient: gradgreen,
              borderColor: kGreyColor,
              fontSize: 17,
              borderWidth: 1,
            ),
          ],
        ),
      ),
    );
  }
}
