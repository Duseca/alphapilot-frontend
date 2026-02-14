// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:the_scaly/constants/app_colors.dart';
// import 'package:the_scaly/constants/app_fonts.dart';
// import 'my_text_widget.dart';

// // ignore: must_be_immutable

import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_fonts.dart';
import 'package:alpha_pilot/const/app_sizes.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MyTextField extends StatefulWidget {
  MyTextField({
    super.key,
    this.controller,
    this.ontap,
    this.hint,
    this.isDense,
    this.label,
    this.onChanged,
    this.isObSecure = false,
    this.marginBottom = 16.0,
    this.maxLines,
    this.isFilled = true,
    this.filledColor,
    this.focusedFilledColor,
    this.fhintColor,
    this.hintColor = kQuaternaryColor,
    this.bordercolor,
    this.isright,
    this.padends,
    this.radius = 12,
    this.haveLabel = true,
    this.labelSize,
    this.prefixIcon,
    this.suffixtext,
    this.suffixIcon,
    this.suffixTap,
    this.keyboardType,
    this.showFlag,
    this.labelColor,
    this.labelWeight,
    this.floatingLabelBehavior,
    this.toppads,
    this.validator,
    this.textColor,
    this.isreadonly,
    this.counter,
    this.isoptional = false,
    this.hintsize,
    this.hintweight,
    this.labelsuffix,
    this.fbordercolor,
    this.focusedLabelColor,
    this.useCountryCodePicker = false,
    this.useOutlinedBorder =
        true, // true for outlined border, false for underline
  });

  String? label, hint, suffixtext;
  TextEditingController? controller;
  ValueChanged<String>? onChanged;
  bool? isObSecure,
      isoptional,
      haveLabel,
      isFilled,
      isreadonly,
      isDense,
      isright,
      useCountryCodePicker,
      showFlag,
      useOutlinedBorder; // Added this flag for choosing border style
  double? marginBottom;
  int? maxLines;
  double? labelSize, radius, padends, hintsize, toppads;
  Widget? suffixIcon, counter, labelsuffix;
  Widget? prefixIcon;
  FloatingLabelBehavior? floatingLabelBehavior;
  Color? filledColor,
      focusedFilledColor,
      focusedLabelColor,
      hintColor,
      bordercolor,
      fbordercolor,
      fhintColor,
      textColor,
      labelColor;
  FontWeight? labelWeight, hintweight;
  TextInputType? keyboardType;
  VoidCallback? suffixTap, ontap;
  String? Function(String?)? validator;

  @override
  _MyTextField2State createState() => _MyTextField2State();
}

class _MyTextField2State extends State<MyTextField> {
  late FocusNode _focusNode;
  final ValueNotifier<bool> _focusNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _focusNotifier.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    _focusNotifier.value = _focusNode.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [MoveEffect(begin: Offset(10, 0), duration: 500.microseconds)],
      child: Padding(
        padding: EdgeInsets.only(bottom: widget.marginBottom!),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _focusNotifier.value = true;
            });
          },
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (widget.label != null)
                      ValueListenableBuilder(
                        valueListenable: _focusNotifier,
                        builder: (_, isFocused, child) {
                          return Row(
                            children: [
                              MyText(
                                // paddingLeft: 10,
                                text: widget.label?.tr ?? '',
                                size: widget.labelSize ?? 18,
                                paddingBottom: widget.padends ?? 8,
                                weight: widget.labelWeight ?? FontWeight.w400,
                                color: isFocused
                                    ? widget.focusedLabelColor ?? kTertiaryColor
                                    : widget.labelColor ?? kBlackColor,
                              ),
                              if (widget.isoptional == true)
                                MyText(
                                  text: ' (optional)',
                                  size: 12,
                                  color: kGreyColor,
                                  //   paddingBottom: 8,
                                ),

                              Spacer(),
                              widget.labelsuffix ?? SizedBox(),
                            ],
                          );
                        },
                      ),
                    ValueListenableBuilder(
                      valueListenable: _focusNotifier,
                      builder: (_, isFocused, child) {
                        return TextFormField(
                          cursorColor: kQuaternaryColor,
                          keyboardType: widget.keyboardType,
                          maxLines: widget.maxLines ?? 1,
                          onTapOutside: (v) {
                            _focusNode.unfocus();
                          },
                          onTap:
                              widget.ontap ??
                              () {
                                setState(() {
                                  _focusNotifier.value = true;
                                });
                              },

                          controller: widget.controller,
                          onChanged: widget.onChanged,

                          textInputAction: TextInputAction.next,
                          obscureText: widget.isObSecure!,
                          stylusHandwritingEnabled: true,
                          obscuringCharacter: '*',
                          style: TextStyle(
                            fontFamily: SFPRO,

                            fontSize: widget.hintsize ?? 15,
                            color: widget.textColor ?? kGreyColor,
                            fontWeight: widget.hintweight ?? FontWeight.w400,
                          ),

                          validator: widget.validator,
                          textAlign: widget.isright == true
                              ? TextAlign.center
                              : TextAlign.left,
                          focusNode: _focusNode,
                          readOnly: widget.isreadonly ?? false,

                          decoration: InputDecoration(
                            counter: widget.counter,
                            isDense: widget.isDense,
                            prefixIconConstraints: BoxConstraints.tightFor(),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                right: 0.0,
                                top: widget.toppads ?? 0,
                                bottom: widget.toppads ?? 0,
                                left: 10,
                              ),
                              child: widget.useCountryCodePicker == true
                                  ? Row(
                                      textDirection: TextDirection.ltr,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // CountryCodePicker(
                                        //   textOverflow: TextOverflow.ellipsis,
                                        //   alignLeft: false,
                                        //   showFlag: false,
                                        //   padding: EdgeInsets.all(0),
                                        //   showDropDownButton: false,
                                        //   textStyle: TextStyle(
                                        //     fontFamily: SFPRO,
                                        //     color: kSecondaryColor,
                                        //   ),
                                        // ),
                                      ],
                                    )
                                  : widget.prefixIcon,
                            ),

                            // Remove the label widget and use hintText instead
                            hintText: widget.hint?.tr ?? widget.label?.tr,
                            hintStyle: TextStyle(
                              color: isFocused
                                  ? (widget.fhintColor ?? kGreyMedium)
                                  : (widget.hintColor ?? kGreyMedium),
                              fontFamily: SFPRO,
                              fontWeight: widget.hintweight ?? wregular,
                              fontSize: widget.hintsize ?? 14,
                            ),

                            floatingLabelAlignment:
                                FloatingLabelAlignment.start,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            suffixIconConstraints: BoxConstraints.tightFor(),

                            contentPadding: EdgeInsets.symmetric(
                              horizontal: widget.padends ?? 15,
                              vertical: widget.toppads ?? 16,
                            ),

                            suffixStyle: TextStyle(
                              fontFamily: SFPRO,
                              fontWeight: widget.hintweight ?? wregular,
                              fontSize: widget.hintsize ?? 14,
                              color: isFocused
                                  ? widget.fhintColor
                                  : widget.hintColor,
                            ),
                            suffixIcon: widget.suffixIcon != null
                                ? Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: GestureDetector(
                                      onTap: widget.suffixTap,
                                      child: widget.suffixIcon,
                                    ),
                                  )
                                : null,
                            suffixText: widget.suffixtext,

                            filled: true,
                            fillColor: _focusNotifier.value
                                ? widget.focusedFilledColor ?? kQuaternaryColor
                                : widget.filledColor ?? kQuaternaryColor,

                            enabledBorder: widget.useOutlinedBorder == true
                                ? OutlineInputBorder(
                                    gapPadding: 10,
                                    borderSide: BorderSide(
                                      color:
                                          widget.bordercolor ??
                                          Color(0xff666666).withOpacity(0.35),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      widget.radius ?? 8,
                                    ),
                                  )
                                : UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          widget.bordercolor ??
                                          kSecondaryColor2,
                                      width: 1,
                                    ),
                                  ),

                            focusedBorder: widget.useOutlinedBorder == true
                                ? OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          widget.fbordercolor ??
                                          kSecondaryColor,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      widget.radius ?? 7,
                                    ),
                                  )
                                : UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: widget.bordercolor ?? kGreyColor,
                                      width: 1.5,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
