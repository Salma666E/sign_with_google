// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AuthService {
//   var googleSignIn = GoogleSignIn();
//   var authuser = FirebaseAuth.instance;
//   final FirebaseFirestore db = FirebaseFirestore.instance;
//   var user; // firebase user
//   var profile;
//    signIns() async {
//     var googleUser = await googleSignIn.signIn();
//     var googleAuth = await googleUser!.authentication;
//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     User user = (await authuser.signInWithCredential(credential)) as User;
//     updateUserData(user);
//     print("signed in " + user.displayName.toString());
//     return user;
//   }

//   void updateUserData(User user) async {
//     DocumentReference ref = db.collection('users').doc(user.uid);
//     return ref.set({
//       'uid': user.uid,
//       'email': user.email,
//       'displayName': user.displayName,
//       'lastSeen': DateTime.now()
//     });
//   }

//   void signout() {
//     authuser.signOut();
//   }
// }

// final AuthService authService = AuthService();
