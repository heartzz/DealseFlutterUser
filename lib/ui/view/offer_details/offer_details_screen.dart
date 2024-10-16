import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:dealse/utils/extension_classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:sizer/sizer.dart';

import '../../../generated/assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_string.dart';
import '../../../utils/utility.dart';
import '../../base/custom_text.dart';

class OfferDetailsScreen extends StatefulWidget {
  const OfferDetailsScreen({super.key});

  @override
  State<OfferDetailsScreen> createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {

  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;
  List<String> imgList = [
    Assets.imagesIcTempBanner, // First image
    Assets.imagesIcTempBanner, // Second image
    Assets.imagesIcTempBanner, // Second image
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _appBar(),
                    1.sbh,
                    _cardViewBanner(),
                    5.sbh,
                    _carRatingInformation(),
                    5.sbh,
                    _description(),
                    5.sbh,
                    nearPlace(),
                    5.sbh,


                  ],
                ),
              ),
            ),

          ],
        ),

      ),
    );
  }

  Widget _appBar(){
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15)),
        color: AppColors.primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset(
              Assets.imagesIcBack,
              height: 24,
              width: 24,
            ),
          ),
          CustomText(
            text: AppStrings.offerDetails,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
          const SizedBox(width: 24), // Placeholder for spacing
        ],
      ),
    );
  }

  Widget _cardViewBanner() {
    List<Widget> imageSliders = imgList
        .map((item) => Container(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Center(
            child: Image.asset(item, fit: BoxFit.cover, width: 1000,),
          ),
        ],
      ),
    ))
        .toList();
    return Container(
      child: Stack(
        children: [
          Expanded(
            child: CarouselSlider(
              items: imageSliders,
              carouselController: _controller,
              options: CarouselOptions(
                height: 180.0,
                autoPlay: true,
                enlargeCenterPage: false,
                // Disable enlarging of the center image
                viewportFraction: 1.0,
                // Remove side padding
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
          ),
          Positioned(
            bottom: 25.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.all(8),
              child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Teapost - Opp. Riverfront",
                    color: AppColors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                  1.sbh,
                   CustomText(
                    text: "Riverfront, Ahemdabad",
                    color: AppColors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 12.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: _current == entry.key
                      ? _selectedIndicator()
                      : _unSelectedIndicator(),
                );
              }).toList(),
            ),
          ),


        ],
      ),
    );
  }
  Widget _carRatingInformation() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const RatingBar.readOnly(
                    size: 25,
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star,
                    initialRating: 4.5,
                    emptyColor: AppColors.emptyRate,
                    halfFilledColor: AppColors.filledRate,
                    filledColor: AppColors.filledRate,
                    isHalfAllowed: true,
                    halfFilledIcon: Icons.star_half,
                    maxRating: 5,
                  ),
                  2.sbw,
                  CustomText(
                    text: '(500)',
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(1.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                      child: CustomText(
                        text: 'Redeem Your Coupon',
                        fontSize: 12,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  )
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
  Widget _description() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomText(
            text: AppStrings.detailsAboutOffer,
            fontWeight: FontWeight.w700,
          ),
          5.sbh,
          CustomText(
            text: AppStrings.lorem,
            fontWeight: FontWeight.w400,
            maxLine: 4,
            fontSize: 12,
            color: AppColors.hintColor,
          ),
          5.sbh,
          CustomText(
            text: AppStrings.termsAndConditions,
            fontWeight: FontWeight.w700,
          ),
          5.sbh,
          CustomText(
            text: AppStrings.lorem,
            fontWeight: FontWeight.w400,
            maxLine: 4,
            fontSize: 12,
            color: AppColors.hintColor,
          ),
          5.sbh,
        ],
      ),
    );
  }
  Widget nearPlace() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: AppStrings.nearbyPlaces,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(right: 20),
                  width: 120,
                  child: Stack(
                    children: [
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(image: AssetImage(Assets.imagesIcFoodTemp),fit:BoxFit.cover)
                        ),

                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                color: AppColors.black.withAlpha(80)
                            ),
                            padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomText(
                                  text: AppStrings.offerHeader,
                                  color: AppColors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                ),
                                CustomText(
                                  text: AppStrings.offerSubDescription,
                                  color: AppColors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                ),
                                CustomText(
                                  text: AppStrings.offerDescription,
                                  color: AppColors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                                Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: CustomText(
                                    text: AppStrings.orderAt,
                                    color: AppColors.hintGrayColor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _selectedIndicator() {
    return SizedBox(
      width: 20,
      child: Center(
        child: SvgPicture.asset(
          Assets.imagesIcTabIndicator,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _unSelectedIndicator() {
    return SizedBox(
      width: 14.0,
      child: Center(
        child: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (Rect bounds) => RadialGradient(
            center: Alignment.topCenter,
            stops: const [.5, 1],
            colors: [AppColors.white, AppColors.white],
          ).createShader(bounds),
          child: const Icon(
            Icons.circle,
            size: 8.0,
          ),
        ),
      ),
    );
  }
}
