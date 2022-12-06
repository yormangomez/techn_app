import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseDatasourcesImpl {
  FirebaseAuth auth = FirebaseAuth.instance;

  AuthFirebaseDatasourcesImpl();

  Future registerUser(String mobile) async {
    auth.verifyPhoneNumber(
        phoneNumber: mobile,
        timeout: Duration(seconds: 120),
        verificationCompleted: (phoneAuthCredential) {},
        verificationFailed: (authException) {},
        codeSent: (verificationId, [forceResendingToken]) {},
        codeAutoRetrievalTimeout: ((verificationId) {}));
  }
}
