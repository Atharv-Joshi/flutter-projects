import 'package:flutter/material.dart';
import '../Widgets/products_grid.dart ';

class ProductOverviewScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
          body: ProductsGrid( loadedProducts: [],),
    );
  }
}

