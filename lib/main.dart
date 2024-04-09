import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_fitness/models/user.dart';
import 'package:flutter_fitness/screens/services/auth.dart';
import 'package:flutter_fitness/screens/wrapper.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  //Dont know why but it works fam
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Wrapping the root widget in th eStreamProvider means that every part of the applicaiton
    //can listen or acces the data from the stream (logged in or not)
    //Specify that it listens after UserObjects
    return StreamProvider<UserObject?>.value(
        value: AuthService().userStream,
        initialData: null,
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // TRY THIS: Try running your application with "flutter run". You'll see
              // the application has a purple toolbar. Then, without quitting the app,
              // try changing the seedColor in the colorScheme below to Colors.green
              // and then invoke "hot reload" (save your changes or press the "hot
              // reload" button in a Flutter-supported IDE, or press "r" if you used
              // the command line to start the app).
              //
              // Notice that the counter didn't reset back to zero; the application
              // state is not lost during the reload. To reset the state, use hot
              // restart instead.
              //
              // This works for code too, not just values: Most code changes can be
              // tested with just a hot reload.
              primaryColor: Colors.yellow,
              scaffoldBackgroundColor: const Color.fromARGB(255, 216, 216, 216),
              useMaterial3: true,
            ),
            home: const Wrapper()));
  }
}
