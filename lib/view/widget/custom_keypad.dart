import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_fonts.dart';
import 'package:alpha_pilot/view/widget/common_image_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:alpha_pilot/generated/assets.dart';

class CustomKeypad extends StatelessWidget {
  final Function(String) onKeyTap;
  final VoidCallback onBackspace;
  final VoidCallback onFingerprint;

  const CustomKeypad({
    super.key,
    required this.onKeyTap,
    required this.onBackspace,
    required this.onFingerprint,
  });

  @override
  Widget build(BuildContext context) {
    final keys = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['backspace', '0', 'check'],
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: keys.map((row) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: row
                .map((key) => Expanded(child: _buildKey(key)))
                .toList(),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildKey(String key) {
    String? icon;
    VoidCallback? onTap;
    Color backgroundColor = const Color(0xFFF5F5F7); // Light gray background
    Color? iconColor;

    if (key == 'backspace') {
      icon = Assets.imagesClose;
      onTap = onBackspace;
      backgroundColor = const Color(0xffD93F3F); // Red background
      iconColor = Colors.white;
    } else if (key == 'check') {
      // Checkmark button (you can use an icon or asset)
      onTap = onFingerprint; // or create a separate callback
      backgroundColor = kMintGreen; // Lighter gray
    } else {
      onTap = () => onKeyTap(key);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: SizedBox(
        height: 70,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,

            backgroundColor: backgroundColor,
            foregroundColor: Colors.black.withOpacity(0.1),

            shape: RoundedRectangleBorder(
              side: BorderSide(color: kQuaternaryColor, width: 3),
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 2,
          ),
          child: icon != null
              ? CommonImageView(imagePath: icon, height: 32, color: iconColor)
              : key == 'check'
              ? CommonImageView(imagePath: Assets.imagesTick, height: 35)
              : Text(
                  key,
                  style: const TextStyle(
                    fontSize: 22,
                    fontFamily: SFPRO,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
        ),
      ),
    );
  }
}
