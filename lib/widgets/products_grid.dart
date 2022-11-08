import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
import '../providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs); 
  
  @override
  Widget build(BuildContext context) {
    final productsData=Provider.of<Products>(context);
    final products =showFavs ? productsData.favoriteitems : productsData.items;
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: ProductItem(
            // products[i].id,
            // products[i].title,
            // products[i].imageUrl,
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
      );
  }
}