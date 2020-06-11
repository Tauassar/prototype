import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<String> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged.map(
        (FirebaseUser user) => user?.uid,
  );

  // Email & Password Sign In
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password)).user.uid;
  }

  // Sign Out
  signOut() {
    return _firebaseAuth.signOut();
  }

}


class EmailValidator {
  static String validate(String value) {
    if(value.isEmpty) {
      return "Это поле нельзя оставлять пустым";
    }
    return null;
  }
}

class PasswordValidator {
  static String validate(String value) {
    if(value.isEmpty) {
      return "Это поле нельзя оставлять пустым";
    }
    if(value.length < 6) {
      return "Пароль должен содердать не менее 6 символов";
    }
    if(value.length > 50) {
      return "Слишком много символов для пароля";
    }
    return null;
  }
}