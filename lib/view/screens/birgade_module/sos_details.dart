import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_sizes.dart';
import 'package:alpha_pilot/const/app_styling.dart';
import 'package:alpha_pilot/generated/assets.dart';
import 'package:alpha_pilot/view/widget/Icon_title_subtitle.dart';
import 'package:alpha_pilot/view/widget/action_button.dart';
import 'package:alpha_pilot/view/widget/common_image_view_widget.dart';
import 'package:alpha_pilot/view/widget/gradient_btn.dart';
import 'package:alpha_pilot/view/widget/icon_text_row.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:alpha_pilot/view/widget/simple_app_bar.dart';
import 'package:alpha_pilot/view/widget/sos_card.dart';
import 'package:alpha_pilot/view/widget/trans_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

// Default actions list
final List<Map<String, dynamic>> defaultActions = [
  {'label': 'Griddle', 'icon': Assets.imagesGriddel},
  {'label': 'Bathroom', 'icon': Assets.imagesBathroom},
  {'label': 'Fridge', 'icon': Assets.imagesFridget},
  {'label': 'Beds', 'icon': Assets.imagesBed},
  {'label': 'Floor', 'icon': Assets.imagesFloor},
];

class SosDetailScreen extends StatelessWidget {
  final SubjectSosModel model;

  const SosDetailScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final RxBool isResolved = false.obs;

    return Scaffold(
      //  appBar: simpleAppBar(bgColor: kPrimaryColor),
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => Container(
                decoration: BoxDecoration(
                  gradient: redtrans(
                    color2: isResolved.value == true
                        ? kMintGreen
                        : getPriorityColor(model.priority),
                  ).withOpacity(0.4),
                  border: Border(
                    bottom: BorderSide(
                      width: 10,
                      color: isResolved.value == true
                          ? kMintGreen
                          : getPriorityColor(model.priority),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 0,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: kBlackColor.withOpacity(0.2),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Image.asset(Assets.imagesBack, height: 45),
                      ),
                    ),
                    //    SizedBox(height: 40),
                    // Priority Badge at top
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: isResolved.value == true
                              ? BoxDecoration()
                              : circle(
                                  getPriorityColor(model.priority),
                                  getPriorityColor(model.priority),
                                ),
                          child: CommonImageView(
                            imagePath: isResolved.value == true
                                ? Assets.imagesTick2
                                : Assets.imagesWARNING,
                            height: isResolved.value == true ? 32 : 20,
                          ),
                        ),
                        TransparentContainer(
                          padends: 30,
                          radius: 100,
                          text: isResolved.value == true
                              ? 'Resolved'
                              : getPriorityText(model.priority),
                          textColor: kQuaternaryColor,
                          textSize: 22,
                          fontStyle: FontStyle.italic,
                          opacity: 1,
                          color1: isResolved.value == true
                              ? kMintGreen
                              : getPriorityColor(model.priority),
                        ),
                      ],
                    ),

                    // SOS Item title
                    Center(
                      child: MyText(
                        text: model.subject,
                        size: 16,
                        textAlign: TextAlign.center,
                        paddingTop: 20,
                        paddingBottom: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Mission Details Card
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyText(
                          text: 'Mission Details:',
                          size: 18,
                          paddingRight: 40,
                          textAlign: TextAlign.center,
                          paddingTop: 30,
                        ),
                        Center(
                          child: TransparentContainer(
                            opacity: 1,
                            text: 'Team 1',
                            padends: 30,
                            color1: kQuaternaryColor,
                            color2: kGreyColor,
                            textColor: kGreyColor,
                          ),
                        ),

                        SizedBox(height: 15),

                        // Mission ID with status
                        MissionsWrap(
                          isResolved: isResolved,
                          title: model.title,

                          actions: defaultActions, // Pass custom actions here
                          // selectedIndices: selectedActions,
                        ),

                        MyText(
                          text: 'Points Validated',
                          paddingTop: 10,
                          size: 16,
                          weight: wlight,
                          textAlign: TextAlign.center,
                        ),
                        Center(
                          child: TransparentContainer(
                            text: '05 out of 15',
                            padends: 20,
                            opacity: 1,
                            textSize: 16,
                            padvertical: 0,
                            color1: kBlackColor,
                          ),
                        ),

                        MyText(
                          text: 'Remaining Time',
                          size: 16,
                          weight: wlight,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        Center(
                          child: IconTextRow(
                            expanded: F,
                            padends: 10,
                            padvertical: 6,
                            iconpath: Assets.imagesClock2,
                            text: '14:30',
                            iconsize: 21,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            textsize: 21,
                            textcolor: kQuaternaryColor,
                            decoration: graddecor(
                              gradient: gradred,
                              radius: 100,
                            ),
                            weight: wblack,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 150),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isResolved.value)
              IconTextRow(
                text: 'SOS Resolved',
                iconpath: Assets.imagesTick2,
                expanded: F,
                flipX: true,
                textsize: 22,
                iconsize: 32,
                spacing: 10,
                decoration: roundedsr(radius: 100),
                padends: 40,
                padvertical: 10,
                textcolor: kMintGreen,
              ),
            if (!isResolved.value)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: GradientButton(
                  onTap: () {
                    isResolved.value = true;
                  },
                  padding: EdgeInsets.all(10),
                  borderColor: ktransparent,
                  gradient: gradred,
                  fontSize: 22,
                  text: 'SOS Process',
                ),
              ),
            SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class MissionsWrap extends StatelessWidget {
  final String? title, status, icon;
  final RxBool? isResolved;
  final List<Map<String, dynamic>>? actions;
  final Gradient? gradient;
  final RxList<int>? selectedIndices;
  final Function(int)? onActionTap;
  final double? padends,
      iconheight,
      size,
      itemextent,
      mhoriz,
      headpadends,
      wrapspacing,
      fontsize,
      iconsize,
      radius;
  final Widget? head;
  final bool? isnewservice;

  const MissionsWrap({
    super.key,
    this.title,
    this.isResolved,
    this.actions,
    this.gradient,
    this.selectedIndices,
    this.onActionTap,
    this.padends,
    this.head,
    this.isnewservice,
    this.status,
    this.icon,
    this.iconheight,
    this.size,
    this.itemextent,
    this.mhoriz,
    this.headpadends,
    this.wrapspacing,
    this.fontsize,
    this.iconsize,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final actionsList = actions ?? defaultActions;

    return Container(
      padding: EdgeInsets.all(mhoriz ?? 20),
      decoration: roundedsr(color2: kGreyColor.withOpacity(0.5), radius: 20),
      margin: EdgeInsets.symmetric(horizontal: padends ?? 30),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: headpadends ?? 0.0),
            child:
                head ??
                IconTitleSubtitle(
                  path: icon ?? Assets.imagesRight,
                  iconheight: iconheight ?? 25,
                  title: title ?? 'MH 100',
                  size1: size ?? 18,
                  padEnds: headpadends ?? 0,
                  trailing: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: 'Status',
                        lineHeight: 1,
                        size: 9,
                        weight: wlight,
                      ),
                      Obx(
                        () => TransparentContainer(
                          text: isResolved?.value ?? true
                              ? status ?? 'Resolved'
                              : status ?? 'In Progress',
                          color1: isResolved?.value ?? true
                              ? kMintGreen
                              : kBlueColor,
                          opacity: 1,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
          ),
          SizedBox(height: head == SizedBox() ? 0 : 20),
          selectedIndices != null
              ? Obx(
                  () => Wrap(
                    spacing: wrapspacing ?? 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: List.generate(
                      actionsList.length,
                      (index) => ActionButton(
                        height: itemextent,
                        radius: radius,
                        iconheight: iconsize,
                        fontsize: fontsize,
                        isnewservce: isnewservice,
                        gradient: gradient ?? appgrad,
                        label: actionsList[index]['label'],
                        icon: actionsList[index]['icon'],
                        isSelected: selectedIndices!.contains(index),
                        onTap: () => onActionTap?.call(index),
                      ),
                    ),
                  ),
                )
              : Wrap(
                  spacing: wrapspacing ?? 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: List.generate(
                    actionsList.length,
                    (index) => ActionButton(
                      iconheight: iconheight,
                      radius: radius,
                      fontsize: fontsize,
                      height: itemextent,
                      isnewservce: isnewservice,
                      gradient: gradient ?? appgrad,
                      label: actionsList[index]['label'],
                      icon: actionsList[index]['icon'],
                      onTap: () => onActionTap?.call(index),
                    ),
                  ),
                ),
          SizedBox(height: headpadends),
        ],
      ),
    );
  }
}
