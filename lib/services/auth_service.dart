import '../firestore/firebase_auth_instance.dart';
import '../models/user.dart';
import 'bff_base_service.dart';

class AuthService {
  static Future<User> login(String email, String password) async {
    var body = <String, String>{
      'email': email,
      'password': password,
    };
    var dto = MsCommunicationDto(
      path: 'auth/login',
      body: body,
    );
    var data = await BffBaseService.Post(dto);
    var firebaseToken = data['firebaseToken'];
    // await firebaseAuth.signInWithCustomToken(firebaseToken); TODO: ver por que salta un error de custom token format is incorrect
    await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return User.fromJson(
      data['session'],
      data['sessionToken'],
      firebaseToken,
    );
  }

  static Future<bool> logOut() async {
    await firebaseAuth.signOut();
    return true;
  }
}
