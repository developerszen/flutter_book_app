import 'package:book_app/categoria/bloc/category_bloc.dart';
import 'package:book_app/categoria/model/category_model.dart';
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
                onPressed: (){
                    Navigator.pushNamed(context, '/category/create');
                }
            ),
            body: createList()
        );
        
    }

    Widget createList() {
        return FutureBuilder(
            future: CategoryBloc().listCategories(),
            builder: (BuildContext context, AsyncSnapshot<List<CategoryModel>> snapshot){
                if (snapshot.hasData) {
                    final data = snapshot.data;
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, i){
                            return CategoryCardWidget(
                                urlImage: 'https://picsum.photos/350/200?random=$i',
                                categoryName: data[i].name,
                                onTap: (){
                                    Navigator.pushNamed(context, '/category/detail', arguments: data[i]);
                                },
                            );
                        }
                    );
                } else {
                    return Center(
                        child: CircularProgressIndicator(),
                    );
                }
            }
        );
    }
}