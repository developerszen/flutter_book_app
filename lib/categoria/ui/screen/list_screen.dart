import 'package:flutter/material.dart';

class CategoriesListScreen extends StatefulWidget {
    CategoriesListScreen({Key key}) : super(key: key);

    @override
    _CategoriesListScreenState createState() => _CategoriesListScreenState();
}

class _CategoriesListScreenState extends State<CategoriesListScreen> {
    @override
    Widget build(BuildContext context) {
        return Container(
            child: Text('Contenido de Categorias'),
        );
    }
}