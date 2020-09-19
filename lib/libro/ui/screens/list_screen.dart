import 'package:book_app/libro/ui/widgets/book_widget.dart';
import 'package:flutter/material.dart';

class BooksListScreen extends StatefulWidget {
    BooksListScreen({Key key}) : super(key: key);

    @override
    _BooksListScreenState createState() => _BooksListScreenState();
}

class _BooksListScreenState extends State<BooksListScreen> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: Color(0xFFFF6B03),
                onPressed: (){}
            ),
            body: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, i){
                    return BookWidget(
                        titulo: 'Libro $i', 
                        categoria: 'Categoria $i', 
                        urlImagen: 'https://picsum.photos/150/300?random=$i'
                    );
                }
            ),
        );
    }
}