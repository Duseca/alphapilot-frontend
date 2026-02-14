import 'package:alpha_pilot/view/widget/simple_app_bar.dart';
import 'package:alpha_pilot/view/widget/two_text_column.dart';
import 'package:flutter/material.dart';

class CleaniningDetails extends StatelessWidget {
  const CleaniningDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              physics: BouncingScrollPhysics(),
              children: [
                TwoTextedColumn(
                  text1: 'Cleaning details',
                  text2:
                      'Click on each item to display photos of completed cleaning.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
