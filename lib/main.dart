import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_egypt_store/Constants.dart';
<<<<<<< HEAD
import 'package:mr_egypt_store/screens/HomeScreen.dart';
import 'package:mr_egypt_store/screens/LandingPage.dart';
=======
import 'package:mr_egypt_store/providers/pageState.dart';
import 'package:mr_egypt_store/screens/LandingPage.dart';
import 'package:provider/provider.dart';
>>>>>>> 0259716 (first commit)

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  WidgetsFlutterBinding.ensureInitialized();
<<<<<<< HEAD
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

=======
  runApp(
    MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_) => PageState()),
      ]
      ,child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
>>>>>>> 0259716 (first commit)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Constants.blueColor,
        primarySwatch: Colors.red,
        bottomSheetTheme:
<<<<<<< HEAD
        BottomSheetThemeData(backgroundColor: Colors.transparent),
=======
            BottomSheetThemeData(backgroundColor: Colors.transparent),
>>>>>>> 0259716 (first commit)
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: LandingPage(),
    );
  }
}
