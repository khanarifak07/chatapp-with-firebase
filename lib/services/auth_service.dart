import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//login
  Future<QuerySnapshot> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      // Login
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // Make the query snapshot to get the data from the database
      QuerySnapshot snapshot = await _firestore
          .collection("users")
          .where("email", isEqualTo: email)
          .get();

      return snapshot; // Return the query snapshot
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }

  //register
  Future<UserCredential> registerWithEmailAndPassword(
      String fullName, String email, String password) async {
    try {
      //create the user
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      //save the created user data in firebase
      _firestore.collection("users").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'fullName': fullName,
        'email': email,
        'groups': [],
        'profilePic': "",
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //logout
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      e.toString();
    }
  }
}
