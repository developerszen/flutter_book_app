import 'package:book_app/categoria/ui/widgets/category_card_widget.dart';
import 'package:flutter/material.dart';

class CategoriesListScreen extends StatefulWidget {
    CategoriesListScreen({Key key}) : super(key: key);

    @override
    _CategoriesListScreenState createState() => _CategoriesListScreenState();
}

class _CategoriesListScreenState extends State<CategoriesListScreen> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: Color(0xFFFF6B03),
                onPressed: (){}
            ),
            body: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, i) {
                    return CategoryCardWidget(urlImage: 'https://picsum.photos/350/200?random=$i');
                }
            ),
        );
        
    }
}