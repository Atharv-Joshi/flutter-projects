import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  //parameters
  final String id;
  final String title;
  final String imageUrl;

  //Constructor
  ProductItem({this.id, this.imageUrl, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: GridTile(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,),
              
            footer: GridTileBar(
              backgroundColor: Colors.black54 ,
              leading: IconButton(
                onPressed: (){},
                icon: Icon(Icons.favorite),
              ), 
              title: Text(
                title,
                textAlign: TextAlign.center,
                ),
              trailing: IconButton(
                onPressed: (){},
                icon: Icon(Icons.shopping_cart),
              ), 
                ),
            ),
    );
  }
}
