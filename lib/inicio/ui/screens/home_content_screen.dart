import 'package:book_app/categoria/ui/widgets/category_card_widget.dart';
import 'package:flutter/material.dart';

class HomeContentScreen extends StatelessWidget {
    const HomeContentScreen({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Column(
            children: [
                Text(
                    'Categorías',
                    style: TextStyle(
                        fontFamily: "PingFang SC",
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color(0xff333333)
                    ),
                ),
                Container(
                    height: 200,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                            CategoryCardWidget(categoryName: 'Drama', urlImage: 'https://picsum.photos/350/200?random=1'),
                            CategoryCardWidget(urlImage: 'https://picsum.photos/350/200?random=2'),
                            CategoryCardWidget(urlImage: 'https://picsum.photos/350/200?random=3'),
                            CategoryCardWidget(urlImage: 'https://picsum.photos/350/200?random=4'),
                        ],
                    ),
                ),
                Text(
                    'Libros',
                    style: TextStyle(
                        fontFamily: "PingFang SC",
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color(0xff333333)
                    ),
                ),
                Expanded(
                    child: ListView(
                        children: [
                            CategoryCardWidget(categoryName: 'Drama', urlImage: 'https://picsum.photos/350/200?random=1'),
                            CategoryCardWidget(urlImage: 'https://picsum.photos/350/200?random=2'),
                            CategoryCardWidget(urlImage: 'https://picsum.photos/350/200?random=3'),
                            CategoryCardWidget(urlImage: 'https://picsum.photos/350/200?random=4'),
                        ],
                    ),
                )
            ],
        );
    }
}