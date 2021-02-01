import 'package:cloud_firestore/cloud_firestore.dart';
import './auth.dart';

class DatabaseService {
  final String _user = AuthService().currentUser();

  //respond if addition was successful or not
  Future addTest({
    String testCategory,
    String testName,
    Map values,
  }) async {
    try {
      final CollectionReference _newTests =
          FirebaseFirestore.instance.collection('users').doc(_user).collection('new_tests');

      DocumentReference result = await _newTests.add({
        'created_on': FieldValue.serverTimestamp(),
        'test_category': testCategory,
        'test_name': testName,
        'values': values,
      });
      print(result);
    } catch (e) {
      print(e.toString());
    }
  }
}
