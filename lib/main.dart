import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(MaterialApp(
    home: first(),
  ));
}

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  // TextEditingController email = TextEditingController();
  // TextEditingController password = TextEditingController();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    print("This is called1....");
   ().signIn();
    print("This is called2...."); final GoogleSignInAccount? googleUser = await GoogleSignIn

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    print("This is called3....");

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    print("This is called4....");
    return await FirebaseAuth.instance.signInWithCredential(credential);

  }

  @override
  void initState() {
    super.initState();

      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        print("This is not possible");
      } else {
        print("This is  possible");
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return dashboard();
          },
        ));
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 18, left: 18, top: 15),
            //   child: TextField(
            //     keyboardType: TextInputType.emailAddress,
            //     controller: email,
            //     cursorColor: Color(0xff808080),
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       focusedBorder: OutlineInputBorder(
            //           borderSide: BorderSide(color: Color(0xff808080)),
            //           borderRadius: BorderRadius.all(Radius.circular(15))),
            //       enabledBorder: OutlineInputBorder(
            //           borderSide: BorderSide(color: Color(0xff808080)),
            //           borderRadius: BorderRadius.all(Radius.circular(15))),
            //       contentPadding: EdgeInsets.all(10),
            //       hintText: "Email",
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 18, left: 18, top: 15),
            //   child: TextField(
            //     obscureText: true,
            //     obscuringCharacter: "*",
            //     keyboardType: TextInputType.visiblePassword,
            //     controller: password,
            //     cursorColor: Color(0xff808080),
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       focusedBorder: OutlineInputBorder(
            //           borderSide: BorderSide(color: Color(0xff808080)),
            //           borderRadius: BorderRadius.all(Radius.circular(15))),
            //       enabledBorder: OutlineInputBorder(
            //           borderSide: BorderSide(color: Color(0xff808080)),
            //           borderRadius: BorderRadius.all(Radius.circular(15))),
            //       contentPadding: EdgeInsets.all(10),
            //       hintText: "Password",
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                child: Text("Sign in Google"),
                onPressed: () {
                  signInWithGoogle().then((value) {
                    print("hardik");
                    if (value != null) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return dashboard();
                        },
                      ));
                    } else {
                      print("htAsk7878");
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*todo
// Name, email address, and profile photo URL
final name = user.displayName;
final email = user.email;
final photoUrl = user.photoURL;
//
// Check if user's email is verified
// final emailVerified = user.emailVerified;
// The user's ID, unique to the Firebase project. Do NOT use this value to
// authenticate with your backend server, if you have one. Use
// User.getIdToken() instead.
final uid = user.uid;
*/
