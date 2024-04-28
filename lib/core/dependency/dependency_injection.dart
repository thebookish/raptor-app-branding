import 'package:appbranding/features/client/data/repository/repository_impl.dart';
import 'package:appbranding/features/client/data/sources/remote/firebase_api.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  sl.registerLazySingleton<FirebaseAppDetailsRepository>(
      () => FirebaseAppDetailsRepository());
  sl.registerLazySingleton<FirebaseApi>(() => FirebaseApi());
}
