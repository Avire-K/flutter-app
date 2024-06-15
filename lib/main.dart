import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firstapp/firebase_options.dart';
import 'package:firstapp/views/login_view.dart';
import 'package:firstapp/views/register_view.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Ganesh Topper',
    theme: ThemeData(
      colorScheme:
          ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 73, 216, 68)),
      useMaterial3: true,
    ),
    home: const HomePage(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ganesh Topper',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 72, 193, 97)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomePage'),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                final user = FirebaseAuth.instance.currentUser;
                if (user?.emailVerified ?? false){
                  print('You are a verified user');
                }else{
                  print('You first need to verify your google account');
                }
                return const Text('Done');
              default:
                return const Text('Loading...');
            }
          },
        ));
  }
}
