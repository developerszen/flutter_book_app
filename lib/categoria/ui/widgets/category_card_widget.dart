import 'package:flutter/material.dart';

class CategoryCardWidget extends StatelessWidget {
    const CategoryCardWidget({
        Key key,
        this.categoryName = 'Categoria',
        @required this.urlImage,
        this.onTap,
    }) : super(key: key);

    final String urlImage;
    final String categoryName;
    final Function onTap;

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
            height: 150,
            width: 350,
            alignment: Alignment.center,
            child: Text(
                categoryName,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    shadows: <Shadow>[
                        Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 10,
                            color: Colors.black
                        )
                    ]
                ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    image: NetworkImage(urlImage),
                    fit: BoxFit.cover
                ),
            ),
        );
    }
}