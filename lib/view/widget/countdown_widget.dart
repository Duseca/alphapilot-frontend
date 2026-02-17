import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alpha_pilot/const/app_fonts.dart';
import 'package:alpha_pilot/controller/countdown_controller.dart';

class CountdownScreen extends StatelessWidget {
  CountdownScreen({Key? key, this.hasdecor, this.fontColor}) : super(key: key);
  final bool? hasdecor;
  final Color? fontColor;
  final CountdownController controller = Get.put(CountdownController());

  Widget buildTimeBox(String value) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: hasdecor == false
          ? Text(
              value,
              style: TextStyle(
                fontSize: 40,
                fontFamily: SFPRO,
                fontWeight: FontWeight.w900,
                color: fontColor ?? Colors.black,
              ),
            )
          : Container(
              key: ValueKey<String>(value),
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.circular(4),
              // ),
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: SFPRO,
                  fontWeight: FontWeight.w900,
                  color: fontColor ?? kQuaternaryColor,
                ),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // buildTimeBox(controller.hours.value.toString().padLeft(2, '0')),
            // MyText(
            //   text: hasdecor == false ? ':' : ' : ',

            //   size: 16,
            //   weight: FontWeight.bold,
            //   color: Colors.white,
            // ),
            buildTimeBox(controller.minutes.value.toString().padLeft(2, '0')),
            MyText(
              text: hasdecor == false ? ':' : ' : ',

              size: 16,
              weight: FontWeight.bold,
              color: Colors.white,
            ),
            buildTimeBox(controller.seconds.value.toString().padLeft(2, '0')),
          ],
        ),
      ),
    );
  }
}
