import 'package:flutter/material.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:foodpanda_clone/View/Components/core_button.dart';
import 'package:get/get.dart';

class CoreFlatButton extends StatelessWidget {
  final String text;
  final String? icon;
  final double? width;
  final double height;
  final Color? bgColor;
  final double? fontSize;
  final Color? textColor;
  final BoxBorder? border;
  final Color? loaderColor;
  final bool isLoading;
  final String? sufficIcon;
  final bool isGradientBg;
  final bool isDisabled;
  final EdgeInsets padding;
  final double borderRadius;
  final void Function()? onPressed;
  const CoreFlatButton({
    Key? key,
    this.icon,
    this.border,
    this.bgColor,
    this.textColor,
    this.onPressed,
    this.fontSize,
    this.sufficIcon,
    this.loaderColor,
    required this.text,
    this.isLoading = false,
    this.isDisabled = false,
    this.borderRadius = 16.0,
    this.isGradientBg = false,
    this.width = double.infinity,
    this.height = flatButtonHeight,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CoreButton(
      color: bgColor,
      onPressed: isLoading ? null : onPressed,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Opacity(
        opacity: isDisabled || onPressed == null ? 0.5 : 1,
        child: Container(
          width: width,
          height: height,
          padding: padding,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: border,
            gradient: isGradientBg
                ? const LinearGradient(
              colors: [AppColors.gradientColor1, AppColors.gradientColor2],
            )
                : null,
            color: bgColor ?? AppColors.primaryColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading)
                defaultLoader(color: loaderColor ?? AppColors.white)
              else ...[
                if (icon != null)
                  selectImageFromLocal(setImageMode(icon!)).paddingOnly(right: 8),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppTextTheme.text18.copyWith(
                    fontSize: fontSize,
                    letterSpacing: -0.24,
                    fontWeight: FontWeight.w600,
                    color: textColor ?? AppColors.appTextPrimaryColor,
                  ),
                ),
                if (sufficIcon != null)
                  selectImageFromLocal(setImageMode(sufficIcon!)).paddingOnly(left: 8),
              ],
            ],
          ),
        ),
      ),
    );
  }
}