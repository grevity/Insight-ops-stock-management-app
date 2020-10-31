import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_management/repository/api/handlers.dart';

void setupServiceLocator() async {
  GetIt.I.registerSingletonAsync<SharedPreferences>(() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  });
  GetIt.I.registerSingleton<ApiHandlers>(ApiHandlers());
}