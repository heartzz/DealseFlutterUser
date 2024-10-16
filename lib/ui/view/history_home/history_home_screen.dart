import 'package:dealse/generated/assets.dart';
import 'package:dealse/routes/app_pages.dart';
import 'package:dealse/ui/base/custom_text.dart';
import 'package:dealse/ui/base/custom_text_form_field.dart';
import 'package:dealse/utils/app_colors.dart';
import 'package:dealse/utils/app_constants.dart';
import 'package:dealse/utils/app_string.dart';
import 'package:dealse/utils/extension_classes.dart';
import 'package:dealse/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:sizer/sizer.dart';

class HistoryHomeScreen extends StatefulWidget {
  const HistoryHomeScreen({super.key});

  @override
  State<HistoryHomeScreen> createState() => _HistoryHomeScreenState();
}

class _HistoryHomeScreenState extends State<HistoryHomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          _history(),
          3.h.sbh,
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      padding: EdgeInsets.all(15),
      color: AppColors.primaryColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomText(
            text: AppStrings.history,
            fontWeight: FontWeight.w500,
            fontSize: 22.sp,
            color: AppColors.white,
          ),
          const Spacer(),
          GestureDetector(
              onTap: () => Get.toNamed(Routes.notification),
              child: SvgPicture.asset(Assets.imagesIcNotification,colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),)),
        ],
      ),
    );
  }

  Widget _history() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Get.toNamed(Routes.offerDetails);
            },
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.black),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Container(
                      margin: EdgeInsets.all(10),
                        child: Image.asset(Assets.imagesIcFoodTemp)),
                 2.sbw,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Teapost - Opp. Riverfront",
                            color: AppColors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                          50.sbw,
                          Container(
                            alignment: Alignment.centerRight,
                            child: CustomText(
                              text: "15 Days Ago",
                              color: AppColors.hintColor,
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      CustomText(
                        text: "Riverfront, Ahemdabad",
                        color: AppColors.black,
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                      ),
                      CustomText(
                        text:"Flat 150 OFF*",
                        color: AppColors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  )
                ],),
                ),
                Positioned(
                    right: 10,
                    bottom: 15,
                    child: SvgPicture.asset(Assets.imagesIcDeleteTab))

              ],
            ),
          );
        },
      ),
    );
  }

}
