import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginwithgoogle/homepagee.dart';

class Googlesigninservices extends ChangeNotifier {
  final googlesignin = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin(BuildContext context) async {
    final googleUser = await googlesignin.signIn();
    try {
      // Google Sign-In code

      if (googleUser == null) return;
      _user = googleUser as GoogleSignInAccount;

      final googleauth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleauth.accessToken, idToken: googleauth.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();

      print(user.email);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homage()));
      // MySharedPrefrence().setUserLoginStatus(true);
    } catch (e) {
      print('Google Sign-In Error: $e');
    }
  }

  Future logout() async {
    await googlesignin.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
