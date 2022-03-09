import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:macber/auth.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                final user = FirebaseAuth.instance.currentUser!;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        child: const Text('Logout'),
                        onPressed: () {
                          final provider = Provider.of<GoogleSignProvider>(
                              context,
                              listen: false);
                          provider.logout();
                        }),
                    Text("Name: " + user.displayName.toString()),
                    Text("Email: " + user.email.toString())
                  ],
                );
              } else if (snapshot.hasError) {
                return const Center(child: Text('Something Went Wrong!'));
              } else {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),
                  child: const Text('Sign Up with Google'),
                  onPressed: () {
                    final provider =
                        Provider.of<GoogleSignProvider>(context, listen: false);
                    provider.googleLogin();
                  },
                );
              }
            }),
      ),
    );
  }
}
