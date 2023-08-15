part of 'design_utils.dart';

bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map<String, dynamic> || o is List<dynamic>) {
    return o == null || o.length == 0;
  }
  return o == null || o == false || o == "";
}

extension WidgetExtension on Widget {
  List<BoxShadow> get containerShadow => const [
    BoxShadow(
      blurRadius: 10,
      offset: Offset(0, 4),
      color: Color(0x0f00498a),
    ),
  ];

  Divider defaultDivider({double? thickness, Color? color, double? height}) {
    return Divider(
        thickness: thickness ?? 1,
        color: color ?? AppColors.greyOpacity08,
        height: height ?? 20);
  }

  Container defaultContainer({
    double hP = 10,
    double vP = 10,
    double vM = 0,
    double hM = 0,
    Color? backgroundColor,
    double borderRadius = defaultBorderRadius,
  }) =>
      Container(
        decoration: BoxDecoration(
          boxShadow: containerShadow,
          color: backgroundColor ?? AppColors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: EdgeInsets.symmetric(horizontal: hP, vertical: vP),
        margin: EdgeInsets.symmetric(horizontal: hM, vertical: vM),
        child: this,
      );

  Widget defaultLoader({Color? color}) =>
      Center(child: CupertinoActivityIndicator(color: color ?? AppColors.white));
}

extension StringExtension on String {
  dynamic errorSnackBar() {
    Get
      ..closeAllSnackbars()
      ..snackbar(
        'Error !',
        this,
        backgroundColor: AppColors.redAccent,
        colorText: AppColors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      );
  }

  dynamic successSnackBar({void Function(GetSnackBar)? onTap}) {
    Get
      ..closeAllSnackbars()
      ..snackbar(
        'Success !',
        this,
        onTap: onTap,
        backgroundColor: AppColors.green,
        colorText: AppColors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      );
  }

  dynamic infoSnackBar() {
    Get
      ..closeAllSnackbars()
      ..snackbar(
        'Info !',
        this,
        colorText: AppColors.black,
        backgroundColor: AppColors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      );
  }
}
