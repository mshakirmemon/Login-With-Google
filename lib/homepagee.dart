import 'package:flutter/material.dart';
import 'package:loginwithgoogle/googlesignin.dart';
import 'package:provider/provider.dart';

class Homage extends StatefulWidget {
  const Homage({super.key});

  @override
  State<Homage> createState() => _HomageState();
}

class _HomageState extends State<Homage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                final provider =
                    Provider.of<Googlesigninservices>(context, listen: false);
                    provider.googleLogin(context);
              },
              child: Text("login"))
        ],
      ),
    );
  }
}
