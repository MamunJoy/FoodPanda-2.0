import 'package:flutter/material.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:get/get.dart';

class HomeCard extends StatelessWidget {
  final String itemName;
  final String itemAvailable;
  final String itemImage;
  final Function onTap;
  HomeCard(
      {Key? key,
      required this.itemName,
      required this.itemAvailable,
      required this.itemImage,
      required this.onTap})
      : super(key: key);
  final double width = Get.width - (defaultAllPadding * 4);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashColor: AppColors.primaryColor,
          onTap: () => onTap(),
          child: Container(
            width: width,
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(defaultBorderRadius)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: defaultAllPadding),
                  width: width * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemName,
                        style: AppTextTheme.text14.copyWith(
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.visible),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Items Available : $itemAvailable Types",
                        style: AppTextTheme.text14.copyWith(
                            color: AppColors.grey,
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.visible),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                selectImageFromLocal(
                  setImageMode("${AppImage.categoryImagePath}/$itemImage.png"),
                  height: 100,
                  width: width * 0.3,
                ),
              ],
            ),
          ).defaultContainer(),
        ),
        const SizedBox(
          height: defaultAllPadding,
        ),
      ],
    );
  }
}
