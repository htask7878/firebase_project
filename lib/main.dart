import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,

      );
  runApp(MaterialApp());
}

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);
//
  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
          Center(child: Container(color: Colors.red, height: 200, width: 200)),
    );
  }
}
