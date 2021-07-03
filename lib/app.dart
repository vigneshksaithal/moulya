import 'package:flutter/material.dart';

import 'screens/homepage.dart';
import 'style.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          subtitle1: TextStyle(
            color: dark,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 1,
          ),
          headline3: TextStyle(
            color: dark,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          headline6: TextStyle(
            fontSize: 18,
          ),
        ),
        // hoverColor: Colors.greenAccent[400],
        cardTheme: CardTheme(
          color: light,
          // shadowColor: Colors.greenAccent[400],
          elevation: 3,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: primary, onPrimary: light,
            padding: EdgeInsets.symmetric(
              vertical: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                5,
              ),
            ),
            elevation: 100,

            // onPrimary: Colors.black,
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: primary,
            backgroundColor: light,
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            padding: EdgeInsets.symmetric(
              vertical: 16,
            ),
            side: BorderSide(
              color: primary,
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                5,
              ),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 20,
            ),
            primary: primary,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: light,
          focusColor: primary,
          hoverColor: primary,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.indigoAccent,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.indigoAccent,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          errorStyle: TextStyle(
            color: danger,
            fontSize: 15,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: dark,
              width: 2,
            ),
          ),
          hintStyle: TextStyle(
            color: dark,
            fontSize: 18,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
