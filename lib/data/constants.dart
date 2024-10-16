class Constants {
  ///Local storage constants
  static String accessToken = 'token';
  static String customerGUID = 'customer_guid';
  static String customerID = 'customer_id';
  static String isLoggedIn = 'is_logged_in';
  static String deviceID = 'deviceID';
  static String deviceType = 'deviceType';

  ///API Constants
  ///Base URLs
  ///https://dealse.app/api/v1/Authentication/GetToken
  static const String baseUrl = "https://dealse.app/api/v1";

  ///End Points

  static const String clientSecret = "4B16179D2F14DB157AD9587DBB138";
  static const String getToken = "/Authentication/GetToken";
  static const String authUser = "/api-frontend/Authenticate/GetToken";
  static const String login = "/User/LoginForUserApp";
  static const String addUserForUserApp = "/User/AddUserForUserApp";
  static const String getUserHomeScreenDetailsForUserApp = "/HomeScreen/GetUserHomeScreenDetailsForUserApp";

  static const String signup = "/api-frontend/Customer/Register";
  static const String forgotPassword =
      "/api-frontend/Customer/PasswordRecoverySend";
  static const String changePassword = "/api-frontend/Customer/ChangePassword";

  static const String getHomePageProducts =
      "/api-frontend/Product/HomePageProducts";
  static const String getCategories =
      "/api-frontend/Catalog/HomePageCategories";
  static const String getProductsByCategory =
      "/api-frontend/Catalog/GetCategoryProducts/";
  static const String getProductDetails =
      "/api-frontend/Product/GetProductDetails/";

  static const String addProductToCart =
      "/api-frontend/ShoppingCart/AddProductToCartFromDetails/";
  static const String getShoppingCart = "/api-frontend/ShoppingCart/MiniCart";

  static const String getCustomerProfile = "/api-frontend/Customer/Info";
  static const String logout = "/api-frontend/Customer/Logout";

  static const String getAddresses = "/api-frontend/Customer/Addresses";
  static const String getAvailableCountriesOrPostAddAddress =
      "/api-frontend/Customer/AddressAdd";
  static const String getStatesByCountryId =
      "/api-frontend/Country/GetStatesByCountryId/";
  static const String deleteAddress = "/api-frontend/Customer/AddressDelete/";

  static const String getOrders = "/api-frontend/Order/CustomerOrders";
}
