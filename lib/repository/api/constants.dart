
class Constants {
  static String get baseURL => "http://10.0.2.2:4000/api";
}
class Version1 {
  String get login => "${Constants.baseURL}/v1/restaurant/team/login";
  String getVendors(String restaurantId) => "${Constants.baseURL}/v1/vendor/$restaurantId";
  String getRawItem(String restaurantId) => "${Constants.baseURL}/v1/rawItem/$restaurantId";

}
class ApiConstants {
  Version1 get version1 => Version1();
}