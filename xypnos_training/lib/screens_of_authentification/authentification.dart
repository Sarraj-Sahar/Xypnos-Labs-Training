// import 'package:google_sign_in/google_sign_in.dart';

// // 1 :Create authentification class

// class Authentification {
//   //3 : we need an instance of googleSignIn() that should be
//   // equal to googleSignIn() itself
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

// // 2 :Make a Future Method of type String , named googleSignIn()
// // the method is Asynchronus
//   Future<String> googleSignIn() async {
//     //4 : Making a final Variable for googleSignInAccount()

//     final GoogleSignInAccount googleSignInAccount =
//         await _googleSignIn.signIn();

//     final GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;

//     final AuthCredential authCredential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken);

//     final UserCredential userCredential =
//         await _firebaseAuth.signInWithCredential(authCredential);

//     final User user = userCredential.user;
//     assert(user.displayName != null);
//     assert(user.email != null);

//     final User currentUser = _firebaseAuth.currentUser;
//     assert(currentUser.uid == user.uid);

//     return 'Error occured';
//   }

// // Creating googleSignOut function

//   Future<String> googleSignOut() async {
//     _googleSignIn.signOut();
//     return 'Error out';
//   }
// }
