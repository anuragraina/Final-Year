import 'package:cloud_firestore/cloud_firestore.dart';
import './auth.dart';

class DatabaseService {
  final String _user = AuthService().currentUser();

  final CollectionReference _sites = FirebaseFirestore.instance.collection('sites');

  //respond if addition was successful or not
  Future addTest({
    String testCategory,
    String testName,
    Map values,
    String sampleUid,
    String sampleSource,
    String sampleType,
    String selectedSite,
    DateTime dateOfReceipt,
    DateTime dateOfTesting,
  }) async {
    try {
      final CollectionReference _newTests =
          FirebaseFirestore.instance.collection('users').doc(_user).collection('new_tests');

      DocumentReference result = await _newTests.add({
        'created_on': FieldValue.serverTimestamp(),
        'test_category': testCategory,
        'test_name': testName,
        'values': values,
        'sample_uid': sampleUid,
        'sample_source': sampleSource,
        'site': selectedSite,
        'date_of_receipt': dateOfReceipt,
        'date_of_testing': dateOfTesting,
      });
      print(result);
    } catch (e) {
      print(e.toString());
    }
  }

  Future getSiteDetails(String uid) async {
    try {
      DocumentSnapshot site = await _sites.doc(uid).get();
      return site;
    } catch (e) {
      print(e.toString());
      return e;
    }
  }

  Stream getSites() {
    return _sites.snapshots();
  }

  Stream getApprovedRecords() {
    final CollectionReference _approvedTests =
        FirebaseFirestore.instance.collection('users').doc(_user).collection('approved_tests');
    return _approvedTests.snapshots();
  }

  Stream getPendingRecords() {
    final CollectionReference _pendingTests =
        FirebaseFirestore.instance.collection('users').doc(_user).collection('new_tests');
    return _pendingTests.snapshots();
  }
}
