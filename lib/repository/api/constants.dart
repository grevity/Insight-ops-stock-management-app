
class Constants {
  static String get baseURL => "http://10.0.2.2:4000";
}
class Version1 {
  String get login => "${Constants.baseURL}/restaurant/team/login";
}
class ApiConstants {
  Version1 get version1 => Version1();
}