import 'package:appbranding/features/client/domain/entities/app_details.dart';
import 'package:appbranding/features/client/domain/usecases/app_details_usecase.dart';
import 'package:appbranding/features/client/presentation/view_model/app_details_view_model/app_details_generic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appDetailsProvider =
    StateNotifierProvider<AppDetailsState, AppDetailsGeneric>((ref) {
  return AppDetailsState(ref: ref);
});

class AppDetailsState extends StateNotifier<AppDetailsGeneric> {
  Ref? ref;

  AppDetailsState({this.ref}) : super(AppDetailsGeneric());

  AppDetailsUseCase _appDetailsUseCase = AppDetailsUseCase();
  void submitForm(AppDetails appDetails) async {
    try {
      await _appDetailsUseCase.call(appDetails);
      print('success');
    } catch (e) {
      print('error in calling: ${e.toString()}');
    }
  }
}
