import 'package:firebase_auth/firebase_auth.dart';

class AuthManage {

  Future signUp(String userEmail, String userPass) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: userEmail, password: userPass);
  }

  Future login(String userEmail, String userPass) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: userEmail, password: userPass);
    } catch (e) {
      throw Exception("Login failed: ${e.toString()}");
    }
  }

  Future<void> passwordreset(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception("Password reset failed: ${e.toString()}");
    }
  }  

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw Exception("Sign out failed: ${e.toString()}");
    }
  }

  Future<User?> getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user;
  }

  Future<String> changePassword(String newPassword) async {
    try {
      // Update password in Firebase
      await FirebaseAuth.instance.currentUser!.updatePassword(newPassword);
      return "success";
    } catch (e) {
      return e.toString();
    }
  }
  
}