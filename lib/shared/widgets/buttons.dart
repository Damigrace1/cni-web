import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, this.buttonColor,
    this.loading =false,
    this.isPrimary = true, this.text, this.child,
    this.centerAlign = false, this.onTap, this.width,}): assert(
  (child != null && text == null) || (child == null && text != null)
  );
  final Color? buttonColor;
  final bool isPrimary;
  final bool loading;
  final bool centerAlign;
  final String? text;
  final Widget? child;
  final Function()? onTap;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: centerAlign ? Alignment.center : null,
        width: width,
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
          decoration: BoxDecoration(
              color: isPrimary ?
              (buttonColor ?? AppColors.appRed) : Colors.transparent,
              border: Border.all(color:  buttonColor ?? AppColors.appRed)
          ),
          child:
          loading ? SizedBox(height: 20,width: 20,child: CircularProgressIndicator.adaptive(strokeWidth: 2),) :
          text != null ? Text(text!,
            style: TextStyle(color: buttonColor ?? AppColors.appWhite),
          ): child
      ),
    );
  }
}


class AppTextButton extends StatelessWidget {
  const AppTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
              width: 2.0,
              color: AppColors
                  .appRed), // Underline style
        ),
      ),
      child: const Text(
        'Event Details',
        style: TextStyle(
            color: AppColors.appBlue,
            fontSize: 14,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}