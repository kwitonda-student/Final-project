import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_profile.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fire = FirebaseFirestore.instance;

  Future<User?> signInOrRegister(String email, String password) async {
    try {
      final signIn = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return signIn.user;
    } catch (e) {
      // If sign in fails, try to register
      final reg = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return reg.user;
    }
  }

  Future<void> saveUserProfile(UserProfile profile) async {
    await _fire.collection('users').doc(profile.uid).set(profile.toMap());
  }

  Future<void> submitPrivateReport(Map<String, dynamic> data) async {
    await _fire.collection('private_reports').add(data);
  }

  Future<void> submitPublicReport(Map<String, dynamic> data) async {
    await _fire.collection('public_reports').add(data);
  }

  Stream<QuerySnapshot> publicReportsStream() {
    return _fire.collection('public_reports').orderBy('date', descending: true).snapshots();
  }
}
