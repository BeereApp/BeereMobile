class APIName {
  //Authentication endpoints
  static String urlRegister = 'auth/register';
  static String urlVerifyPhone = 'auth/verify-phone';
  static String urlLogin = 'auth/login';
  static String urlForgotPassword = 'auth/forgot-password';

  static String urlResetPassword = 'auth/reset-password';

  static String urlVendorRegister = 'auth/vendor/register';
  static String urlVendorVerifyPhone = 'auth/vendor/verify-token';
  static String urlUpdateVendorInfo = 'auth/vendor/update';
  static String urlVendorLogin = 'auth/vendor/login';
  static String urlVendorForgotPassword = 'auth/vendor/forgot-password';
  static String urlGetCategories = 'category/get-cat';

  static String urlGetVendorProfile = 'vendor/get-profile';
  static String urlAddLocation = 'vendor/save-location';
  static String urlUpdateLocation = 'vendor/location-update';
  static String urlGetLocations = 'vendor/get-locations';
  static String urlUpdateVendorProfile = 'vendor/profile-update';

  static String urlGetPromotions = 'vendor/promotion';
  static String urlGetVendorPromotions =
      'vendor/promotion/myPromotions'.toLowerCase();
  static String urlAddVendorPromotion = 'vendor/promotion/add';
  static String urlGetPromotionClicks = 'vendor/promotion/getClicks';
}
