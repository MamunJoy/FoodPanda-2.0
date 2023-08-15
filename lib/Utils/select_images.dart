part of 'design_utils.dart';

bool get isDarkMode => false;
/// To select which Image/Icon being used in current mode
String setImageMode(
    String lightImageIcon, [
      String? darkImageIcon,
    ]) =>
    darkImageIcon != null && isDarkMode ? darkImageIcon : lightImageIcon;

Image selectImageFromLocal(
    String image, {
      double? width,
      double? height,
      BoxFit fit = BoxFit.cover,
    }) {
  return Image.asset(
    image,
    fit: fit,
    width: width,
    height: height,
  );
}

Widget selectIconFromLocal(
    String icon, {
      double? width,
      Color? color,
      void Function()? onPressed,
    }) {
  return CoreButton(
    onPressed: onPressed,
    child: Image.asset(
      icon,
      width: width,
      color: color,
      height: width,
    ),
  );
}

Image noImage({
  double? width,
  double? height,
  BoxFit fit = BoxFit.cover,
}) =>
    selectImageFromLocal(
      setImageMode(AppImage.logo),
      height: height,
      width: width,
      fit: fit,
    );

Widget networkImage({
  String? image,
  double? height,
  double? width,
  double borderRadius = 0,
  BoxFit fit = BoxFit.cover,
  Color? loaderColor,
}) {
  return isNullEmptyOrFalse(image)
      ? noImage(
    fit: fit,
    width: width,
    height: height,
  )
      : ClipRRect(
    borderRadius: BorderRadius.circular(borderRadius),
    child: Image.network(
      GetUtils.isURL(image ?? "") ? image! : "",
      fit: fit,
      width: width,
      height: height,
        loadingBuilder:(BuildContext context, Widget child, ImageChunkEvent? loadingProgress) =>  Center(child: CupertinoActivityIndicator(color: loaderColor?? AppColors.primaryColor),),
        errorBuilder: (context, url, error) => const Icon(
          CupertinoIcons.exclamationmark_circle,
          color: CupertinoColors.destructiveRed,
        )
    ),
  );
}