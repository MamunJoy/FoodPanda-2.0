part of 'design_utils.dart';
class AppTextTheme{
  AppTextTheme._();

  static TextOverflow defaultOverflow = TextOverflow.ellipsis;
  static String get getSFProFontFamily => 'SFProText';

  static final text14 = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    letterSpacing: -.24,
    overflow: defaultOverflow,
    fontWeight: FontWeight.w500,
    fontFamily: getSFProFontFamily
  );
  static final text16 = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    letterSpacing: -.24,
    overflow: defaultOverflow,
    fontWeight: FontWeight.w500,
    fontFamily: getSFProFontFamily,
  );

  static final text18 = TextStyle(
    color: AppColors.black,
    fontSize: 18,
    letterSpacing: -.24,
    overflow: defaultOverflow,
    fontWeight: FontWeight.w500,
    fontFamily: getSFProFontFamily,
  );

  static final text22 = TextStyle(
    color: AppColors.black,
    fontSize: 22,
    letterSpacing: -.24,
    overflow: defaultOverflow,
    fontWeight: FontWeight.w500,
    fontFamily: getSFProFontFamily,
  );

  static final text24 = TextStyle(
    color: AppColors.black,
    fontSize: 24,
    letterSpacing: -.24,
    overflow: defaultOverflow,
    fontWeight: FontWeight.w500,
    fontFamily: getSFProFontFamily,
  );
}