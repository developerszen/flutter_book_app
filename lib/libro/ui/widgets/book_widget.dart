import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
    const BookWidget({
        Key key,
        @required this.titulo,
        @required this.categoria,
        @required this.urlImagen
    }) : super(key: key);

    final String titulo;
    final String categoria;
    final String urlImagen;

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
            width: 20,
            height: 150,
            child: Card(
                elevation: 4,
                child: Row(
                    children: [
                        // Espacio de imagen
                        ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image(
                                width: 100,
                                image: NetworkImage(urlImagen),
                                fit: BoxFit.fitWidth,
                            ),
                        ),
                        // SizedBox(width: 10),
                        // espcaio para informacion de libro
                        Expanded(
                            child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                            titulo,
                                            style: TextStyle(
                                                fontFamily: "PingFang SC",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color:Color(0xff333333), 
                                            ),
                                        ),
                                        SizedBox(height: 6),
                                        Row(
                                            children: [
                                                Icon(
                                                    Icons.bookmark,
                                                    color: Color(0xffFFF6B03),
                                                    size: 20,
                                                ),
                                                Text(
                                                    categoria,
                                                    style: TextStyle(
                                                        fontFamily: "PingFang SC",
                                                        fontSize: 13,
                                                        color:Color(0xFFFF6B03),
                                                    ),
                                                )
                                            ],
                                        )
                                    ],
                                ),
                            )
                            
                        )
                    ],
                ),
            )
        );
    }
}