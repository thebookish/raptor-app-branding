import 'package:appbranding/features/client/domain/entities/app_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseApi {
  final _firestore = FirebaseFirestore.instance;

  Future<void> saveAppDetails(AppDetails appDetails) async {
    await _firestore.collection('app_details').doc().set({
      'appName': appDetails.appName,
      'shortDescription': appDetails.shortDescription,
      'fullDescription': appDetails.fullDescription,
      'primaryColor': appDetails.primaryColor,
      'secondaryColor': appDetails.secondaryColor,
    });
  }
}
