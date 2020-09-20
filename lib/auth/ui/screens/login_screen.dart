import 'package:book_app/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
    LoginScreen({Key key}) : super(key: key);

    @override
    _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

    final _formKey = GlobalKey<FormState>();
    String _email = '';
    String _password = '';

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text('LOGIN'),
                            Form(
                                key: _formKey,
                                child: Column(
                                    children: [
                                        TextFormField(
                                            keyboardType: TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                                labelText: 'Email',
                                                icon: Icon(Icons.email),
                                                border: OutlineInputBorder()
                                            ),
                                            validator: (value) {
                                                if (value.isEmpty) {
                                                    return 'El email es obligatorio';
                                                }else{
                                                    setState(() => _email = value);
                                                }
                                            },
                                        ),
                                        SizedBox(height: 15),
                                        TextFormField(
                                            keyboardType: TextInputType.emailAddress,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                                labelText: 'Passwod',
                                                icon: Icon(Icons.security),
                                                border: OutlineInputBorder()
                                            ),
                                            validator: (value) {
                                                if (value.isEmpty) {
                                                    return 'El password es obligatorio';
                                                }else{
                                                    setState(() => _password = value);
                                                }
                                            },
                                        ),
                                        // TextFormField(
                                        //     keyboardType: TextInputType.emailAddress,
                                        //     maxLines: null,
                                        //     decoration: InputDecoration(
                                        //         labelText: 'Passwod',
                                        //         icon: Icon(Icons.security),
                                        //         border: OutlineInputBorder()
                                        //     ),
                                        //     validator: (value) {
                                        //         if (value.isEmpty) {
                                        //             return 'Hola soy el error';
                                        //         }
                                        //     },
                                        // ),
                                        RaisedButton(
                                            child: Text('Iniciar Sesión'),
                                            onPressed: _submit
                                        )
                                    ],
                                )
                            )
                        ],
                    ),
                )
            ),
        );
    }

    _submit() async {
        if (_formKey.currentState.validate()) {
            final login = await AuthBloc().login(
                context, 
                email: _email, 
                password: _password
            );

            if (login) {
                Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
            } else {
                print('Datos erroneos');
            }
        }else{
            print('Error de validacion');
        }
    } 
}