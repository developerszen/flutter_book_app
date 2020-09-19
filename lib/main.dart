import 'package:book_app/auth/ui/screens/login_screen.dart';
import 'package:book_app/inicio/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main(){
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Aplicación de Libros',
            // home: HomeScreen(),
            initialRoute: '/login',
            routes: {
                '/login'        : (BuildContext context) => LoginScreen(),
                '/home'         : (BuildContext context) => HomeScreen(),
            },
        );
    }
}