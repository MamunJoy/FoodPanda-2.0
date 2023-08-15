import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_clone/Model/user_model.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  final BuildContext context;
  final UserModel? user;
  const CustomDrawer({super.key,required this.context, this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      constraints: const BoxConstraints.expand(width: 325),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top + 25),
          Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${user?.firstName} ${user?.secondName}",
                    style: AppTextTheme.text18,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    user?.email ?? 'N/A',
                    style: AppTextTheme.text18,
                  ),
                ],
              ),
            ],
          ),
          Divider(color: Color(0xffF2F0F6), thickness: 1, height: 45),
          // _drawerTile(
          //   text: 'Dashboard',
          //   isActive: Get.currentRoute == Routes.EMPLOYEE_DASHBOARD,
          //   icon: 'assets/icons/home.svg',
          //   onPressed: () {
          //     Get.offAllNamed(Routes.EMPLOYEE_DASHBOARD);
          //   },
          // ),
          // _drawerTile(
          //   text: 'Manage Leave',
          //   isActive: Get.currentRoute == Routes.EMPLOYEE_MANAGE_LEAVES,
          //   icon: 'assets/icons/heart.svg',
          //   onPressed: () {
          //     Get.offAllNamed(Routes.EMPLOYEE_MANAGE_LEAVES);
          //   },
          // ),
          // _drawerTile(
          //   text: 'Expense Claims',
          //   isActive: Get.currentRoute == Routes.EMPLOYEE_MANAGE_EXPENSES,
          //   icon: 'assets/icons/expense.svg',
          //   onPressed: () {
          //     Get.offAllNamed(Routes.EMPLOYEE_MANAGE_EXPENSES);
          //   },
          // ),
          // _drawerTile(
          //   text: 'Salary Slips',
          //   isActive: Get.currentRoute == Routes.EMPLOYEE_SALARY_SLIPS,
          //   icon: 'assets/icons/slip.svg',
          //   onPressed: () {
          //     Get.offAllNamed(Routes.EMPLOYEE_SALARY_SLIPS);
          //   },
          // ),
          // _drawerTile(
          //   text: 'Log out',
          //   isLogout: true,
          //   isActive: false,
          //   icon: 'assets/icons/logout.svg',
          //   onPressed: () async {
          //     await StringHelper().clearKeyHeaders();
          //     Get.offAllNamed(Routes.LOGIN);
          //   },
          // ),
          // Spacer(),
          // Text(
          //   versionNo != null ? "v$versionNo" : "",
          //   style: TextStyle(
          //     color: Color(0xff939598),
          //     fontStyle: FontStyle.italic,
          //     fontFamily: "SFProText",
          //   ),
          // ),
          SizedBox(height: 15),
          Text(
            "Employee Self Service",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontFamily: "SFProText",
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Text(
                "Developed by",
                style: TextStyle(
                  color: Color(0xff939598),
                  fontStyle: FontStyle.italic,
                  fontFamily: "SFProText",
                ),
              ),
              Text(
                " NESSCALE Solutions.",
                style: TextStyle(
                  color: Color(0xff2490EF),
                  fontWeight: FontWeight.w600,
                  fontFamily: "SFProText",
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).viewPadding.bottom + 15),
        ],
      ).paddingSymmetric(horizontal: 15),
    );
  }
  static Widget _drawerTile({
    bool isLogout = false,
    required bool isActive,
    required String text,
    required String icon,
    void Function()? onPressed,
  }) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Color(
                isLogout
                    ? 0xffC32033
                    : isActive
                    ? 0xff2490EF
                    : 0xff000000,
              ),
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              fontFamily: "SFProText",
            ),
          ),
          const Spacer(),
        ],
      ).paddingSymmetric(vertical: 14),
    );
  }
}
