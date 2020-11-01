import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:stock_management/repository/api/constants.dart';
import 'package:stock_management/repository/data/models/items.dart';
import 'package:stock_management/repository/data/models/vendorItem.dart';
import 'package:stock_management/repository/data/models/vendors.dart';
import 'package:stock_management/repository/data/models/warehouse.dart';

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

  Future<List<Warehouse>> getWarehouse() async {
    Response response = await dio.get(apiConstants.version1.getWarehouse(GetIt.I<SharedPreferences>().getString("restaurantId")));
    return response.data.map<Warehouse>((item) => Warehouse.fromJson(item)).toList();
  }

  Future<List<VendorItem>> getVendorItems(String vendorId) async {
    Response response = await dio.get(apiConstants.version1.getVendorItems(vendorId));
    return response.data["item"].map<VendorItem>((item) => VendorItem.fromJson(item)).toList();
  }
  Future<bool> createReceive(List<Map<String, dynamic>> items, int originId, int destinationId, double amount, double due) async {
    Response response = await dio.post(apiConstants.version1.createReceive, data: {
      "originId": originId,
      "amount": amount,
      "due": due,
      "destinationId": destinationId,
      "originType": "vendor",
      "destinationType": "warehouse",
      "items": items
    });
    if(response.data["id"] != null){
      return true;
    }
    return false;
  }
}