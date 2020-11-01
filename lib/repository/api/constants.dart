
class Constants {
  static String get baseURL => "http://162.241.120.139:4000/api";
}
class Version1 {
  String get login => "${Constants.baseURL}/v1/restaurant/team/login";
  String getVendors(String restaurantId) => "${Constants.baseURL}/v1/vendor/$restaurantId";
  String getRawItem(String restaurantId) => "${Constants.baseURL}/v1/rawItem/$restaurantId";
  String getWarehouse(String restaurantId) => "${Constants.baseURL}/v1/warehouse/$restaurantId";
  String getVendorItems(String vendorId) => "${Constants.baseURL}/v1/vendor/product/$vendorId";
  String get createReceive => "${Constants.baseURL}/v1/item-receive-dispatch/vendor";

}
class ApiConstants {
  Version1 get version1 => Version1();
}