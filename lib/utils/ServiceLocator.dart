import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

void setupServiceLocator() async {
  GetIt.I.registerSingletonAsync<SharedPreferences>(() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  });
}