import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'app_colors.dart';
import 'app_string.dart';
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

class Utility {
  static void showToastMessage(message) {
    showToast(
      message,
      context: Get.context!,
      animation: StyledToastAnimation.slideFromBottom,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.top,
      animDuration: const Duration(milliseconds: 500),
      backgroundColor: Colors.black,
      textStyle: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      duration: const Duration(seconds: 3),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
    );
  }

  static setLightStatusBar() {
    return SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light));
  }

  static showLoading() {
    EasyLoading.instance
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = AppColors.primaryColor
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.grey.withOpacity(0.5)
    ..userInteractions = false
    ..indicatorType = EasyLoadingIndicatorType.ripple
    ..dismissOnTap = false;

    EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;


    EasyLoading.show();





  }

  static hideLoading() {
    EasyLoading.dismiss(animation: true);
  }

  static setDarkStatusBar() {
    return SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark));
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static bool isValidMobileNumber(String mobileNumber) {
    // Define a regular expression pattern for a typical 10-digit mobile number.
    RegExp regex = RegExp(r'^(?:\+?\d{1,3})?[0-9]{10}$');
    return regex.hasMatch(mobileNumber);
  }

  static bool validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static String timeAgo(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);
    DateTime now = DateTime.now();
    Duration difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hr${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} min${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'just now';
    }
  }

  static String convertTimeTo12HourFormat(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  static String convertIntoDateFormat(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  static String convertIntoReportDateFormat(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static String convertCheckInTimeFormat(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  static String convertTo12HourFormat(String time24) {
    DateFormat dateFormat = DateFormat("HH:mm:ss");
    DateTime dateTime = dateFormat.parse(time24);

    DateFormat timeFormat = DateFormat("hh:mm a");
    return timeFormat.format(dateTime);
  }

  static String convertDateFormat(String date) {
    if (date.isNotEmpty) {
      final inputTimestamp = DateTime.parse(date).toLocal();
      final outputFormat = DateFormat("MM/dd/yyyy hh:mm a");
      final formattedDateTime = outputFormat.format(inputTimestamp);
      return formattedDateTime;
    } else {
      return '';
    }
  }

  static String convertPastDateFormat(String date) {
    if (date.isNotEmpty) {
      final inputTimestamp = DateTime.parse(date).toLocal();
      final outputFormat = DateFormat("dd MMM yyyy");
      final formattedDateTime = outputFormat.format(inputTimestamp);
      return formattedDateTime;
    } else {
      return '';
    }
  }

  static String getDateOnly(String date) {
    if (date.isNotEmpty) {
      final inputTimestamp = DateTime.parse(date).toLocal();
      final outputFormat = DateFormat("dd");
      final formattedDateTime = outputFormat.format(inputTimestamp);
      return formattedDateTime;
    } else {
      return '';
    }
  }

  static String getMonthOnly(String date) {
    if (date.isNotEmpty) {
      final inputTimestamp = DateTime.parse(date).toLocal();
      final outputFormat = DateFormat("MMM");
      final formattedDateTime = outputFormat.format(inputTimestamp);
      return formattedDateTime;
    } else {
      return '';
    }
  }

  static String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }

  static PopupMenuItem buildPopupMenuItem(
      String title, IconData? iconData, int position) {
    return PopupMenuItem(
      value: position,
      child: Row(
        children: [
          if (iconData != null)
            Icon(
              iconData,
              size: 20,
              color: Colors.black,
            ),
          if (iconData != null)
            const SizedBox(
              width: 10,
            ),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  static bool isValidUrl(String? str,
      {List<String?> protocols = const ['http', 'https', 'ftp'],
        bool requireTld = true,
        bool requireProtocol = false,
        bool allowUnderscore = false,
        List<String> hostWhitelist = const [],
        List<String> hostBlacklist = const []}) {
    if (str == null ||
        str.isEmpty ||
        str.length > 2083 ||
        str.startsWith('mailto:')) {
      return false;
    }

    var protocol,
        user,
        auth,
        host,
        hostname,
        port,
        port_str,
        path,
        query,
        hash,
        split;

    // check protocol
    split = str.split('://');
    if (split.length > 1) {
      protocol = shift(split);
      if (protocols.indexOf(protocol) == -1) {
        return false;
      }
    } else if (requireProtocol == true) {
      return false;
    }
    str = split.join('://');

    // check hash
    split = str!.split('#');
    str = shift(split);
    hash = split.join('#');
    if (hash != null && hash != "" && new RegExp(r'\s').hasMatch(hash)) {
      return false;
    }

    // check query params
    split = str!.split('?');
    str = shift(split);
    query = split.join('?');
    if (query != null && query != "" && new RegExp(r'\s').hasMatch(query)) {
      return false;
    }

    // check path
    split = str!.split('/');
    str = shift(split);
    path = split.join('/');
    if (path != null && path != "" && new RegExp(r'\s').hasMatch(path)) {
      return false;
    }

    // check auth type urls
    split = str!.split('@');
    if (split.length > 1) {
      auth = shift(split);
      if (auth.indexOf(':') >= 0) {
        auth = auth.split(':');
        user = shift(auth);
        if (!new RegExp(r'^\S+$').hasMatch(user)) {
          return false;
        }
        if (!new RegExp(r'^\S*$').hasMatch(user)) {
          return false;
        }
      }
    }

    // check hostname
    hostname = split.join('@');
    split = hostname.split(':');
    host = shift(split);
    if (split.length > 0) {
      port_str = split.join(':');
      try {
        port = int.parse(port_str, radix: 10);
      } catch (e) {
        return false;
      }
      if (!new RegExp(r'^[0-9]+$').hasMatch(port_str) ||
          port <= 0 ||
          port > 65535) {
        return false;
      }
    }

    if (!isIP(host) &&
        !isFQDN(host,
            requireTld: requireTld, allowUnderscores: allowUnderscore) &&
        host != 'localhost') {
      return false;
    }

    if (hostWhitelist.isNotEmpty && !hostWhitelist.contains(host)) {
      return false;
    }

    if (hostBlacklist.isNotEmpty && hostBlacklist.contains(host)) {
      return false;
    }

    return true;
  }

  static shift(List l) {
    if (l.isNotEmpty) {
      var first = l.first;
      l.removeAt(0);
      return first;
    }
    return null;
  }

  static final RegExp _ipv4Maybe =
  RegExp(r'^(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)$');
  static final RegExp _ipv6 =
  RegExp(r'^::|^::1|^([a-fA-F0-9]{1,4}::?){1,7}([a-fA-F0-9]{1,4})$');

  static bool isIP(String? str, [/*<String | int>*/ version]) {
    version = version.toString();
    if (version == 'null') {
      return isIP(str, 4) || isIP(str, 6);
    } else if (version == '4') {
      if (!_ipv4Maybe.hasMatch(str!)) {
        return false;
      }
      var parts = str.split('.');
      parts.sort((a, b) => int.parse(a) - int.parse(b));
      return int.parse(parts[3]) <= 255;
    }
    return version == '6' && _ipv6.hasMatch(str!);
  }

  /// check if the string [str] is a fully qualified domain name (e.g. domain.com).
  ///
  /// * [requireTld] sets if TLD is required
  /// * [allowUnderscore] sets if underscores are allowed
  static bool isFQDN(String str,
      {bool requireTld = true, bool allowUnderscores = false}) {
    var parts = str.split('.');
    if (requireTld) {
      var tld = parts.removeLast();
      if (parts.length == 0 || !new RegExp(r'^[a-z]{2,}$').hasMatch(tld)) {
        return false;
      }
    }

    for (var part in parts) {
      if (allowUnderscores) {
        if (part.contains('__')) {
          return false;
        }
      }
      if (!new RegExp(r'^[a-z\\u00a1-\\uffff0-9-]+$').hasMatch(part)) {
        return false;
      }
      if (part[0] == '-' ||
          part[part.length - 1] == '-' ||
          part.indexOf('---') >= 0) {
        return false;
      }
    }
    return true;
  }


  static LinearGradient gradient() {
    return const LinearGradient(
        colors: [
          AppColors.secondaryColor,
          AppColors.tertiaryColor,
        ],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(2.1, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.repeated);
  }
  static LinearGradient gradientUnselect() {
    return const LinearGradient(
        colors: [
          AppColors.secondaryColor,
          AppColors.tertiaryColor,
        ],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(2.1, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.repeated);
  }

  static LinearGradient gradientOpacity(double opacity) {
    return LinearGradient(
        colors: [
          AppColors.secondaryColor.withOpacity(opacity),
          AppColors.tertiaryColor.withOpacity(opacity),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(2.1, 0.0),
        stops: const [0.0, 1.0],
        tileMode: TileMode.repeated);
  }
  static BoxDecoration unselectBoxLine(){
    return BoxDecoration(
      borderRadius:  BorderRadius.circular(5.h),
      color: AppColors.white,
        border: Border.all(width: 1.5,color:AppColors.primaryColor),
      boxShadow: [
        BoxShadow(color: AppColors.primaryColor),
      ],
    );
  }
  static BoxDecoration selectBoxLine(){
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5.h),
      color: AppColors.primaryColor,
      boxShadow: [
        BoxShadow(color: AppColors.white),
      ],
    );
  }
}
