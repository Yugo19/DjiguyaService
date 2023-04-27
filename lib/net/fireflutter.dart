import 'package:djiguya_service_app/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Users? _userFromFireBaseUser(User user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  Stream<Users?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFireBaseUser(user!));
  }

  Future signIn(String email, String password) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFireBaseUser(user!);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future register(String email, String password) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFireBaseUser(user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak');
      } else if (e.code == 'email-alreasy-in-use') {
        print('The accountt already exist for that email.');
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future AnomSignIn() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFireBaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
