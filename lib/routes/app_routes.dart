part of 'app_pages.dart';

abstract class Routes {
  static const launcher = '/';
  static const splash = '/splash';
  static const login = '/login';
  static const introduction = '/introduction';
  static const socialLogin = '/social_login';
  static const createAccount = '/create_account';
  static const notificationSettingScreen = '/notification_setting';
  static const securityScreen = '/security';
  static const editProfile = '/edit_profile';
  static const profileMenu = '/profile_menu';

  //User Routes
  static const userDashboard = '/user_dashboard';
  static const offerDetails = '/offer_details';
  static const recentBooked = '/recentBooked';
  static const myBookMark = '/my_bookmark';
  static const cancelBooking = '/cancel_booking';
  static const notification = '/notification';
  static const hotelDetails = '/hotel_details';
  static const galleryPhotosScreen = '/gallery_photos';
  static const ratingReview = '/rating_review';
  static const location = '/location';
  static const reservation = '/reservation';
  static const paymentMethod = '/payment_method';
  static const addNewCard = '/add_new_card';
  static const bookingConformation = '/booking_conformation';
  static const ticketView = '/ticket_view';
  static const bookingSelectDate = '/booking_select_date_and_guest';

  //Owner Routes
  static const ownerDashboard = '/owner_dashboard';
  static const addRoom = '/add_room';
  static const bookingDetails = '/booking_details';
  static const profile = '/profile';
  static const forgotPassword = '/forgot_password';
  static const otp = '/otp';
  static const resetPassword = '/reset_password';
}
