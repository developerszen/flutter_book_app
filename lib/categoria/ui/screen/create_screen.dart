import 'package:book_app/categoria/bloc/category_bloc.dart';
import 'package:book_app/categoria/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryCreateScreen extends StatefulWidget {
    CategoryCreateScreen({Key key}) : super(key: key);

    @override
    _CategoryCreateScreenState createState() => _CategoryCreateScreenState();
}

class _CategoryCreateScreenState extends State<CategoryCreateScreen> {

    final _formKey = GlobalKey<FormState>();
    CategoryModel category = new CategoryModel();

    @override
    Widget build(BuildContext context) {
        final CategoryModel dataCategory = ModalRoute.of(context).settings.arguments;
        if(dataCategory != null) category = dataCategory;

        return Scaffold(
            appBar: AppBar(
                centerTitle: false,
                elevation: 0,
                backgroundColor: Colors.white,
                title: Text(
                    'Registro de Categoría',
                    style: TextStyle(
                        color: Colors.black
                    ),
                ),
            ),
            body: Center(
                child: Container(
                    margin: EdgeInsets.all(15),
                    child: Form(
                        key: _formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                TextFormField(
                                    initialValue: category.name,
                                    decoration: InputDecoration(
                                        labelText: 'Nombre de Categoría',
                                        icon: Icon(Icons.category),
                                        border: OutlineInputBorder()
                                    ),
                                    onSaved: (value) => category.name = value,
                                    validator: (value) {
                                        if (value.isEmpty) {
                                            return 'La categoria es obligatoria';
                                        }else{
                                            return null;
                                        }
                                    },
                                ),
                                RaisedButton(
                                    color: Color(0xFFFF6B03),
                                    textColor: Colors.white,
                                    child: Text('Registrar'),
                                    onPressed: submit
                                )
                            ],
                        )
                    ),
                ),
            ),
        );
    }

    submit() async {
        if(_formKey.currentState.validate()){
            _formKey.currentState.save();
            if (category.id != null) {
                await CategoryBloc().editCategory(category);
            } else {
                await CategoryBloc().createCategory(category);
            }
        }else{
            return null;
        }
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    }
}