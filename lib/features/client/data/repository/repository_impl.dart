import 'package:appbranding/core/dependency/dependency_injection.dart';
import 'package:appbranding/features/client/data/sources/remote/firebase_api.dart';
import 'package:appbranding/features/client/domain/entities/app_details.dart';
import 'package:appbranding/features/client/domain/repository/repository.dart';

class FirebaseAppDetailsRepository implements AppDetailsRepository {
  final FirebaseApi _firebaseApi = sl.get<FirebaseApi>();
  @override
  Future<void> saveAppDetails(AppDetails appDetails) async {
    await _firebaseApi.saveAppDetails(appDetails);
  }
}
