import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:stock_management/repository/api/constants.dart';
import 'package:stock_management/repository/data/models/vendors.dart';
import 'package:stock_management/repository/vmodel/store.dart';

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
    print(GetIt.I<SharedPreferences>().getString("restaurantId"));
    print(apiConstants.version1.getVendors(GetIt.I<SharedPreferences>().getString("restaurantId")));
    Response response = await dio.get(apiConstants.version1.getVendors(GetIt.I<SharedPreferences>().getString("restaurantId")));
    print(response.data);
    return response.data.map<Vendors>((vendor) => Vendors.fromJson(vendor)).toList();
  }
}