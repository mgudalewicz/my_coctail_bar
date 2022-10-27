import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_coctail_bar/data_provider/coctails_data_provider.dart';
import 'package:my_coctail_bar/manager/coctails_data_manager.dart';

final sl = GetIt.instance;

void configureDepenedencies() {
  //Firebase
  sl.registerSingleton(FirebaseFirestore.instance);

  //Provider
  sl.registerFactory(() => CoctailsDataProvider());

  //Manager
  sl.registerFactory(() => CoctailsDataManager());
}
