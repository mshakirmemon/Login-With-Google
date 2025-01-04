import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginwithgoogle/googlesignin.dart';
import 'package:loginwithgoogle/homepagee.dart';
import 'package:provider/provider.dart';

final navigatorkey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Googlesigninservices(),
        child: MaterialApp(
          home: const Homage(),
        ));
  }
}
