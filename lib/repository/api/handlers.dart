import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:stock_management/repository/api/constants.dart';
import 'package:stock_management/repository/data/models/items.dart';
import 'package:stock_management/repository/data/models/vendors.dart';

class ApiHandlers {
  ApiConstants apiConstants = ApiConstants();
  Dio dio = new Dio();

  Future<Response> login(String email, String password) async {
    Response response = await dio.post(apiConstants.version1.login,
      data: {
        "email": email,
        "password": password
      }
    );
    return response;
  }

  Future<List<Vendors>> getVendors() async {
    Response response = await dio.get(apiConstants.version1.getVendors(GetIt.I<SharedPreferences>().getString("restaurantId")));
    return response.data.map<Vendors>((vendor) => Vendors.fromJson(vendor)).toList();
  }

  Future<List<Items>> getRawItems() async {
    Response response = await dio.get(apiConstants.version1.getRawItem(GetIt.I<SharedPreferences>().getString("restaurantId")));
    return response.data.map<Items>((item) => Items.fromJson(item)).toList();
  }
}