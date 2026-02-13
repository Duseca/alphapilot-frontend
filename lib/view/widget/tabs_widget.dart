import 'package:alpha_pilot/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alpha_pilot/const/app_fonts.dart';
import 'package:alpha_pilot/const/app_sizes.dart';
import 'package:alpha_pilot/const/app_styling.dart';
import 'package:alpha_pilot/view/widgets/my_text_widget.dart';

class TabsWidget extends StatefulWidget {
  const TabsWidget({
    super.key,
    required this.currentindex,
    this.ontap,
    required this.items,
    this.isexpanded,
    this.height,
    this.padEnds,
  });

  final int currentindex;
  final void Function(int)? ontap; // Allow ontap to receive the index
  final List<String> items;
  final bool? isexpanded;
  final double? height, padEnds;

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

int current = 0;

class _TabsWidgetState extends State<TabsWidget> {
  void _onTap(int index) {
    if (widget.ontap != null) {
      widget.ontap!(index); // Pass index to ontap callback
    } else {
      setState(() {
        current = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the text scale factor
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    // Adjust the heights based on the text scale factor
    double containerHeight = (widget.height ?? 36);
    double animatedContainerHeight = 40;
    if (textScaleFactor > 1) {
      animatedContainerHeight = animatedContainerHeight * textScaleFactor;
      containerHeight = containerHeight * textScaleFactor;
    }
    return widget.isexpanded == false
        ? Container(
            height: widget.height ?? 60,
            margin: EdgeInsets.only(bottom: 0),
            //  decoration: rounded2r(kGrey1Color, ktransparent, 100),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: [
                  Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(widget.items.length, (index) {
                      return GestureDetector(
                        onTap: () =>
                            _onTap(index), // Call _onTap with the index
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 3,
                            vertical: 8,
                          ),
                          child: AnimatedContainer(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            duration: const Duration(milliseconds: 300),
                            height: animatedContainerHeight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: widget.currentindex == index
                                  ? kSecondaryColor
                                  : kSecondaryColor2,
                              border: Border.all(
                                width: 0.6,
                                color: widget.currentindex == index
                                    ? kSecondaryColor
                                    : kSecondaryColor2,
                              ),
                            ),
                            child: Center(
                              child: MyText(
                                text: widget.items[index],
                                // paddingLeft: 16,
                                //  paddingTop: 10,
                                // paddingRight: 16,
                                paddingBottom: widget.currentindex == index
                                    ? 0
                                    : 5,
                                size: 14,
                                weight: wregular,
                                paddingTop: widget.currentindex == index
                                    ? 0
                                    : 5,
                                color: widget.currentindex == index
                                    ? kQuaternaryColor
                                    : kQuaternaryColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          )
        : Stack(
            clipBehavior: Clip.none,
            children: [
              // Positioned(
              //   left: 0,
              //   bottom: 4,
              //   right: 0,
              //   child: Container(
              //     decoration: rounded2(Color(0xffD9F4F9), Color(0xffD9F4F9)),
              //     height: 6,
              //   ),
              // ),
              Container(
                height: widget.height ?? containerHeight,
                margin: EdgeInsets.only(bottom: 0),
                decoration: rounded2r(
                  kMintGreen.withOpacity(0.0),
                  ktransparent,
                  100,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        spacing: 10,
                        children: List.generate(widget.items.length, (index) {
                          return Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  _onTap(index), // Call _onTap with the index
                              child: AnimatedContainer(
                                //  padding: EdgeInsets.symmetric(vertical: 7),
                                duration: const Duration(milliseconds: 300),
                                height: animatedContainerHeight,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: widget.currentindex == index
                                      ? kSecondaryColor
                                      : kSecondaryColor2,
                                  border: Border.all(
                                    width: 0.6,
                                    color: widget.currentindex == index
                                        ? kSecondaryColor
                                        : kSecondaryColor2,
                                  ),
                                ),
                                child: Center(
                                  child: MyText(
                                    text: widget.items[index],
                                    // paddingLeft: 16,
                                    //  paddingTop: 10,
                                    // paddingRight: 16,
                                    paddingBottom: widget.currentindex == index
                                        ? 0
                                        : 5,
                                    size: 14,
                                    weight: wregular,
                                    paddingTop: widget.currentindex == index
                                        ? 0
                                        : 5,
                                    color: widget.currentindex == index
                                        ? kQuaternaryColor
                                        : kQuaternaryColor,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}

class MyTabbar extends StatelessWidget {
  const MyTabbar({
    super.key,
    required this.items,
    this.controller,
    this.bgcolor,
    this.tabcolor,
    this.outlinecolor,
    this.labelcolor,
    this.unselectedLabelcolor,
    this.indicatorcolor,
    this.indicatorPads,
    this.padEnds,
    this.ontap,
  });
  final void Function(int)? ontap;
  final List<String> items;
  final TabController? controller;
  final double? indicatorPads, padEnds;
  final Color? bgcolor,
      tabcolor,
      outlinecolor,
      labelcolor,
      unselectedLabelcolor,
      indicatorcolor;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      automaticIndicatorColorAdjustment: false,
      labelColor: labelcolor ?? kSecondaryColor,
      //  isScrollable: true,
      unselectedLabelColor: unselectedLabelcolor ?? kSecondaryColor2,
      controller: controller,
      onTap: ontap,
      overlayColor: WidgetStatePropertyAll(ktransparent),
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: SFPRO,
        color: labelcolor ?? kGreyLight,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: SFPRO,
        color: kSecondaryColor2,
      ),
      //isScrollable: true,
      //  tabAlignment: TabAlignment.start,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(0),
      indicatorPadding: EdgeInsets.symmetric(horizontal: indicatorPads ?? 0),
      labelPadding: EdgeInsets.only(top: padEnds ?? 10, bottom: 10),
      // controller: _tabController,
      indicatorSize: TabBarIndicatorSize.tab,

      // indicator: rounded2r(
      //   tabcolor ?? kSecondaryColor.withOpacity(0.2),
      //   outlinecolor ?? kSecondaryColor,
      //   100,
      // ),
      dividerColor: kGreyColor1,
      indicatorWeight: 2,
      indicatorColor: indicatorcolor ?? kSecondaryColor,
      //      labelPadding: EdgeInsets.symmetric(horizontal: 3),
      tabs: List.generate(
        items.length,
        (index) => Tab(
          height: 22,
          iconMargin: EdgeInsets.all(0),

          text: items[index].tr,
        ),
      ),
    );
  }
}
