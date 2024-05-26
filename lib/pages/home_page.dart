import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final User? user = FirebaseAuth.instance.currentUser;

  void logOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) return const SizedBox.shrink();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: logOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Text(
          'Logged in!\n${user!.displayName}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
