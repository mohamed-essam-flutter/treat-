abstract class Connection {
  Connection._();
  static const base = 'backend.jai.sa';
  // static const base = 'api-prod.jai.sa';
  static const baseURL = 'https://$base/';
  static const storage = '${baseURL}uploads/labs/';
  static const apiURL = '${baseURL}api/v1/';
  static const apiPassword = '#as@\$#\$@as#';
}
class AppConstants {
  static String? LANGUAGE;
  static const String TOKEN = 'token';
}
class ApiConstant {
  static const String baseUrl = 'https://api.example.com';
  static const String loginEndpoint = '/auth/login';
  static const String registerEndpoint = '/auth/register';
  static const String userProfileEndpoint = '/user/profile';
  static const String updateProfileEndpoint = '/user/update';
  static const String deleteAccountEndpoint = '/user/delete';
  static const String fetchPostsEndpoint = '/posts';
  static const String createPostEndpoint = '/posts/create';
  static const String updatePostEndpoint = '/posts/update';
  static const String deletePostEndpoint = '/posts/delete';
}
class ApiNames {
  ///======================== Moyasar ========================///
  static const String moyasarApiURL = 'https://api.moyasar.com/v1/';
  static const String payment = 'payments';

  ///======================== General ========================///
  static const String genders = 'general/genders';
  static const String faqs = 'general/faqs';
  static const String sliders = 'general/sliders';
  static const String shiftTypes = 'general/shift-types';
  static const String settings = 'client/settings';

  ///======================== Auth ========================///
  static const String login = 'client/login';
  static const String resetPassword = 'client/reset-password';
  static const String contactUs = 'client/contact-us';
  static const String logout = 'client/logout';
  static const String verifyOTP = 'client/verifyAccount';
  static const String resendOTP = 'client/resendVerifiyOtp';
  static const String getProfile = 'client/getProfile';
  static const String updateProfile = 'client/updateProfile';
  static const String updateLanguage = 'client/update-lang';
  static const String updateFCM = 'client/update-fcm';
  static const String deleteAccount = 'client/delete-account';
  static const String updateLocation = 'client/updateLocation';

  ///======================= Branches =======================///
  static const String getBranches = 'client/branches';
  static const String getFilterBranches = 'client/branches/filters';
  static const String searchBranches = 'client/branches/search';
  static const String getSpecialOfferBranches = 'client/branches/special';
  static const String addFavBranch = 'client/branches/favourite';
  static const String getFavBranches = 'client/branches/favourites';
  static const String rateBranch = 'client/branches/rate';

  ///======================= Favourite Locations =======================///
  static const String getFavLocations = 'client/locations/favourites';
  static const String addFavLocations = 'client/locations/favourite';

  ///======================= Cars =======================///
  static const String getCars = 'client/cars';
  static const String addCar = 'client/cars/add';
  static const String editCar = 'client/cars/edit';
  static const String deleteCarImage = 'client/cars/image/delete';
  static const String deleteCar = 'client/cars/delete';
  static const String getCarColor = 'general/colors';

  ///======================= Meals =======================///
  static const String getBranchMealCategories = 'client/branches/categories';
  static const String getMeals = 'client/branches/meals';
  static const String getMealDetails = 'client/branches/meals';
  static const String addFavMeal = 'client/branches/meals/favourite';
  static const String getFavMeals = 'client/branches/meals/favourites';

  ///======================= Cart =======================///
  static const String addToCart = 'client/cart/add';
  static const String updateCartItem = 'client/cart/update-item';
  static const String deleteCartItem = 'client/cart/details/delete';
  static const String deleteCart = 'client/cart/delete';
  static const String checkCoupon = 'client/cart/check-coupon';
  static const String applyCoupon = 'client/cart/apply-coupon';
  static const String deleteCoupon = 'client/cart/delete-coupon';
  static const String updateDeliveryType = 'client/cart/delivery-type';
  static const String getCart = 'client/cart';
  static const String getCartCounts = 'client/cart/simpleCartTotal';

  ///======================= Orders =======================///
  static const String applyOrder = 'client/orders/add';
  static const String getOrders = 'client/orders';
  static const String getOrderCancelReasons = 'client/orders/cancel-reason';
  static const String cancelOrder = 'client/orders/cancel';
  static const String clientArrived = 'client/orders/arrived';
  static const String reorder = 'client/orders/reorder';

  ///======================= Reservations =======================///
  static const String addReservation = 'client/reservations/add';
  static const String getReservations = 'client/reservations';
  static const String cancelReservation = 'client/reservations/cancel';
  static const String getReservationCancelReasons =
      'client/reservations/cancel-reason';

  ///======================= Notifications =======================///
  static const String getNotifications = 'client/notifications';
  static const String readNotification = 'client/notifications/readOneNotify';
  static const String deleteNotification = 'client/notifications/delete';

  ///======================= Payment =======================///
  static const String addPayment = 'client/payments/add';
}