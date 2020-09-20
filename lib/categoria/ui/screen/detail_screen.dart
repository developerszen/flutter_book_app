import 'package:book_app/categoria/bloc/category_bloc.dart';
import 'package:book_app/categoria/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryDetailScreen extends StatelessWidget {
    const CategoryDetailScreen({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {

        final CategoryModel category = ModalRoute.of(context).settings.arguments;

        return Scaffold(
            appBar: AppBar(
                centerTitle: false,
                elevation: 0,
                backgroundColor: Colors.white,
                title: Text(
                    'DEtalle Categoria',
                    style: TextStyle(
                        color: Colors.black
                    ),
                ),
            ),
            body: Center(
                child: Column(
                    children: [
                        Text(category.name),
                        Text(category.created_at),
                        Text('${category.updated_at}'),
                    ],
                ),
            ),
            floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                    FloatingActionButton(
                        heroTag: 1,
                        backgroundColor: Colors.amber,
                        child: Icon(Icons.edit),
                        onPressed: (){
                            Navigator.pushNamed(context, '/category/create', arguments: category);
                        }
                    ),
                    FloatingActionButton(
                        heroTag: 2,
                        backgroundColor: Colors.red,
                        child: Icon(Icons.delete),
                        onPressed: () async {
                            await CategoryBloc().deleteCategory(category.id);
                            Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                        }
                    ),
                ],
            ),
        );
    }
}