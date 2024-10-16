import 'package:dealse/data/api/dio_client.dart';
import 'package:dealse/data/model/home_screen_response_entity.dart';
import 'package:dealse/generated/assets.dart';
import 'package:dealse/routes/app_pages.dart';
import 'package:dealse/ui/base/custom_text.dart';
import 'package:dealse/ui/base/custom_text_form_field.dart';
import 'package:dealse/ui/view/user_dashboard/user_home_controller.dart';
import 'package:dealse/utils/app_colors.dart';
import 'package:dealse/utils/app_string.dart';
import 'package:dealse/utils/extension_classes.dart';
import 'package:dealse/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:location/location.dart';
import 'package:sizer/sizer.dart';


class UserHomeScreen extends StatefulWidget {


  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final Location location = Location();
  bool _serviceEnabled=false;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;
  final TextEditingController searchController = TextEditingController();
  UserHomeController controller = Get.find();
 /* var storeTypeId=0;
  double? userLatitude=0.0;
  double? userLongitude=0.0;*/



  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(2.h),
        child:
        Obx((){
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              3.h.sbh,
              locationList(),
              3.h.sbh,
              category(),
              3.h.sbh,
              limited(),
              3.h.sbh,
              nearPlace(),
              3.h.sbh,
              recommendPlace(),
            ],
          );
        })

       ,
      ),
    );
  }

  Widget header() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomText(
          text: AppStrings.home,
          fontWeight: FontWeight.w500,
          fontSize: 22.sp,
          color: AppColors.textColor,
        ),
        const Spacer(),
        GestureDetector(
            onTap: () => Get.toNamed(Routes.notification),
            child: SvgPicture.asset(Assets.imagesIcNotification)),
      ],
    );
  }

  Widget userName() {
    return CustomText(
      text: "Hello, Daniel 👋",
      fontWeight: FontWeight.w700,
      fontSize: 18.sp,
      color: AppColors.textColor,
    );
  }

  Widget search() {
    return CustomTextFormField(
        textEditingController: searchController,
        labelText: AppStrings.search,
        textColor: AppColors.textColor,
        isPreFixIcon: true,
        isSufixIcon: true,
        inputAction: TextInputAction.done,
        suffixIcon: Assets.imagesIcFilter,
        prefixIcon: Assets.imagesIcSearch,
        fontFamily: Assets.fontsUrbanistMedium,
        fontSize: 13.sp);
  }

  Widget locationList() {
    return SizedBox(
      height: 5.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: controller.areasListing.value.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          HomeScreenResponseDataAreas areas=controller.areasListing.value[index];
          return InkWell(
            onTap: () {
              controller.userLatitude.value=controller.areasListing.value[index].latitude!;
              controller.userLongitude.value=controller.areasListing.value[index].longitude!;
              getUserHomeScreenDetailsForUserApp(controller.storeTypeId.value,controller.userLatitude!.value,controller.userLongitude!.value);
              },
            child: Container(
              padding: EdgeInsets.all(1.h),
              decoration: areas?.areaId == controller.area.value.areaId ? Utility.selectBoxLine() : Utility.unselectBoxLine(),
              child: Center(
                child: CustomText(
                  text: areas?.areaName ?? '',
                  color: areas?.areaId == controller.area.value.areaId  ? AppColors.white : AppColors.hintGrayColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return 3.w.sbw;
        },
      ),
    );
  }

  Widget category() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomText(
          text: AppStrings.categories,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(
          height: 80,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: controller.storeListing.value.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CategoryWidget(store:controller.storeListing.value[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return 3.w.sbw;
            },
          ),
        ),
      ],
    );
  }

  Widget limited() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: AppStrings.limitedTimeOffer,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: controller.limitedListing.length,
            itemBuilder: (BuildContext context, int index) {
              HomeScreenResponseDataLimitedTimeOffers limitedOffer=controller.limitedListing.value[index];

              return Container(
                padding: const EdgeInsets.only(right: 20),
                width: 220,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.zero,bottomLeft: Radius.zero,topRight:Radius.circular(10),bottomRight:Radius.circular(10)),
                              image: DecorationImage(image: AssetImage(Assets.imagesIcTempDrash),fit:BoxFit.fill)
                          ),

                        ),
                        Container(
                            height: 100,
                            padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                            decoration: const BoxDecoration(
                                color: AppColors.lightGreenColor,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomText(
                                  text: limitedOffer.areaName!,
                                  color: AppColors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                                CustomText(
                                  text: limitedOffer.shortDescription!,
                                  color: AppColors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                ),
                                CustomText(
                                  text: limitedOffer.title!,
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
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget nearPlace() {
    return Column(
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
            itemCount: controller.nearPlacesListing.length,
            itemBuilder: (BuildContext context, int index) {
              HomeScreenResponseDataUserNearByPlaces nearPlaces=controller.nearPlacesListing.value[index];
              return InkWell(
                onTap: () {
                  Get.toNamed(Routes.offerDetails);
                },
                child: Container(
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
                                  text: nearPlaces.offerName!,
                                  color: AppColors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                ),
                                CustomText(
                                  text: nearPlaces.offerShortDescription!,
                                  color: AppColors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                ),
                                CustomText(
                                  text: nearPlaces.offerLongDescription!,
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
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget recommendPlace() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: AppStrings.recommendedForYou,
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
              return InkWell(
                onTap: (){
                  Get.toNamed(Routes.offerDetails);
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 20),
                  width: 140,
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
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 4,top: 4),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColors.black.withAlpha(80),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: CustomText(
                            text: "Opp. Riverfront",
                            color: AppColors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: AppColors.black.withAlpha(50)
                            ),
                            padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                            child: Row(

                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: AppStrings.offerHeader,
                                        color: AppColors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w800,
                                      ),
                                      CustomText(
                                        text: "Monginis Cake Shop",
                                        color: AppColors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      CustomText(
                                        text: "*Offers Valid For Order Above Rs.450",
                                        color: AppColors.white,
                                        fontSize: 4,
                                        fontWeight: FontWeight.w400,
                                      ),

                                    ],
                                  ),
                                ),
                                SvgPicture.asset(Assets.imagesIcRightArrow),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Future<void> getUserHomeScreenDetailsForUserApp(int storeTypeId,double userLatitude,double userLongitude) async {
    controller.getUserHomeScreenDetailsForUserApp(storeTypeId,userLatitude,userLongitude);
  }
  Future<void> _checkPermissions() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        Utility.showToastMessage('please Enable GPS');
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        Utility.showToastMessage('Allow permission');
        return;
      }
    }
    _locationData = await location.getLocation();
    controller.userLatitude.value=_locationData!.latitude!;
    controller.userLongitude.value=_locationData!.longitude!;
    getUserHomeScreenDetailsForUserApp(controller.storeTypeId.value,controller.userLatitude!.value,controller.userLongitude!.value);
   /* location.enableBackgroundMode(enable: true);
    location.onLocationChanged.listen((LocationData currentLocation) {
      userLatitude=currentLocation.latitude!;
      userLongitude=currentLocation.longitude!;
      getUserHomeScreenDetailsForUserApp();
    });*/
  }
}

class CategoryWidget extends StatelessWidget {
  final HomeScreenResponseDataStoreTypes? store;
  const CategoryWidget({
    super.key, this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(store!.storeTypeImage!! ?? '',height: 50,width: 50,),
          CustomText(
            text: store?.storeTypeName ?? '',
            color: AppColors.primaryColor,
            fontSize: 9.sp,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}


/*
  Widget locationList() {
    return SizedBox(
      height: 5.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(1.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.h),
              gradient: index == 0 ? Utility.gradient() : null,
              border: index != 0
                  ? GradientBoxBorder(
                width: 2,
                gradient: Utility.gradient(),
              )
                  : null,
            ),
            child: Center(
              child: CustomText(
                text: 'Recommended',
                color: index == 0 ? AppColors.white : AppColors.hintGrayColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return 3.w.sbw;
        },
      ),
    );
  }
*/




