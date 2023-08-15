import 'package:flutter/material.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:get/get.dart';

class ItemCard extends StatelessWidget {
  final String roteKey;
  final String itemKey;
  final String itemName;
  final String itemDescription;
  final String itemQuantity;
  final String itemBasePrice;
  final Function onTap;
  ItemCard(
      {Key? key,
        required this.roteKey,
        required this.itemKey,
        required this.itemName,
        required this.itemDescription,
        required this.itemQuantity,
        required this.itemBasePrice,
        required this.onTap,
        })
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
                        "Item Available : $itemQuantity",
                        style: AppTextTheme.text14.copyWith(
                            color: AppColors.grey,
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.visible),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Item price     : $itemBasePrice",
                        style: AppTextTheme.text14.copyWith(
                            color: AppColors.grey,
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.visible),
                      ),
                    ],
                  ),
                ),
                selectImageFromLocal(
                  setImageMode("${AppImage.itemImagePath}/$roteKey/$itemKey.png"),
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