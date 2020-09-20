import 'package:book_app/categoria/ui/screen/list_screen.dart';
import 'package:book_app/inicio/ui/screens/home_content_screen.dart';
import 'package:book_app/libro/ui/screens/list_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
    HomeScreen({Key key}) : super(key: key);

    @override
    _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

    int _currentIndex = 0;
    Widget _content = HomeContentScreen();
    String _titleAppBar = 'Home';

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                centerTitle: false,
                elevation: 0,
                backgroundColor: Colors.white,
                title: Text(
                    _titleAppBar,
                    style: TextStyle(
                        color: Colors.black
                    ),
                ),
            ),
            body: _content,
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentIndex,
                selectedItemColor: Color(0xffFF6B03),
                items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        title: Text('Home')
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.apps),
                        title: Text('Categorías')
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.book),
                        title: Text('Libros')
                    ),
                ],
                onTap: (index){
                    setState((){
                        _currentIndex = index;
                        switch (_currentIndex) {
                            case 0:
                                _titleAppBar = 'Home';
                                _content = HomeContentScreen();
                                break;
                            case 1:
                                _titleAppBar = 'Categorías';
                                _content = CategoriesListScreen();
                                break;
                            case 2:
                                _titleAppBar = 'Libros';
                                _content = BooksListScreen();
                                break;
                            default:
                        }
                    });
                },
            ),
        );
    }
}