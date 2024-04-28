import 'package:appbranding/core/dependency/dependency_injection.dart';
import 'package:appbranding/features/client/data/repository/repository_impl.dart';
import 'package:appbranding/features/client/domain/entities/app_details.dart';
import 'package:appbranding/features/client/domain/repository/repository.dart';

class AppDetailsUseCase {
  AppDetailsUseCase()
      : _appDetailsRepository = sl.get<FirebaseAppDetailsRepository>();
  final AppDetailsRepository _appDetailsRepository;
  Future<void> call(AppDetails appDetails) async {
    await _appDetailsRepository.saveAppDetails(appDetails);
  }
}
