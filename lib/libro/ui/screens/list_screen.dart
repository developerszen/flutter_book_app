import 'package:flutter/material.dart';

class BooksListScreen extends StatefulWidget {
    BooksListScreen({Key key}) : super(key: key);

    @override
    _BooksListScreenState createState() => _BooksListScreenState();
}

class _BooksListScreenState extends State<BooksListScreen> {
    @override
    Widget build(BuildContext context) {
        return Container(
            child: Text('Contenido de Libros'),
        );
    }
}