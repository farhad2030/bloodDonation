import 'package:blood_donation/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//convert to usetModel
  UserModel? _firebaseUsertoUserModel(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

//get user auth stream
  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_firebaseUsertoUserModel);
  }

  //register with email & pass

  Future registerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      return _firebaseUsertoUserModel(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      print('e.code ${e.code}');
      return e.code;
    } catch (e) {
      print(e);
    }
  }

  //sign in with email & pass
  Future signinWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _firebaseUsertoUserModel(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return e.code;
    }
  }

  //sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print('signout');
      print(e);
      return null;
    }
  }

  Future forgotPass({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return print('all ok sending email');
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

//auth test
  Future reauthUser({required String email, required String password}) async {
    // Create a credential
    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);

    try {
// Reauthenticate
      await FirebaseAuth.instance.currentUser!
          .reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  //delete account
  Future deleteAccount() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print(
            'The user must reauthenticate before this operation can be executed.');
      }

      return e.code;
    }
  }
}
