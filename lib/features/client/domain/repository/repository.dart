import 'package:appbranding/features/client/domain/entities/app_details.dart';

abstract class AppDetailsRepository {
  Future<void> saveAppDetails(AppDetails appDetails);
}
