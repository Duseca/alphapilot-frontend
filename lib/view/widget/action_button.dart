import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/generated/assets.dart';
import 'package:alpha_pilot/view/widget/common_image_view_widget.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final String icon;
  final Gradient gradient;
  final VoidCallback? onTap;
  final bool isSelected;
  final double? height;
  final bool? isnewservce;

  const ActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.gradient,
    this.onTap,
    this.isSelected = false,
    this.isnewservce,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: height ?? 72,
        height: height ?? 72,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(colors: [kQuaternaryColor, kQuaternaryColor])
              : gradient,
          color: isSelected ? kPrimaryColor : null,
          borderRadius: BorderRadius.circular(15),
          border: isSelected
              ? Border.all(color: kPrimaryColor, width: 2)
              : null,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(
                    isSelected
                        ? isnewservce == true
                              ? Assets.imagesNewser
                              : Assets.imagesTick
                        : icon,
                    height: 37,
                    color: isSelected == true
                        ? isnewservce == true
                              ? Color(0xff478BF9)
                              : kMintGreen
                        : null,
                  ),
                ),
              ),
              Container(
                width: Get.width,
                decoration: isSelected == true
                    ? BoxDecoration(
                        color: isnewservce == true
                            ? Color(0xff478BF9)
                            : kMintGreen,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(15),
                        ),
                      )
                    : null,
                child: MyText(
                  textAlign: TextAlign.center,
                  text: label,
                  size: 14.5,
                  paddingBottom: 1,

                  color: kQuaternaryColor,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
