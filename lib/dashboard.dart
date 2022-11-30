import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/main.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class dashboard extends StatefulWidget {
  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    if (user != null) {
      print(user!.uid);
    } else {
      print("not login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        width: 200,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            IconButton(
                onPressed: () async {
                  await GoogleSignIn().signOut();
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return first();
                    },
                  ));
                },
                icon: Icon(Icons.logout))
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Center(child: Text("${user!.email}")),
            Center(child: Text("${user!.displayName}")),
            Center(child: Text("${user!.uid}")),
          ],
        ),
      ),
    );
  }
}
