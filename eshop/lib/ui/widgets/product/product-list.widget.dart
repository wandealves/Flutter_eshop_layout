import 'package:flutter/material.dart';

import 'package:eshop/ui/widgets/product/product-card.widget.dart';
import 'package:eshop/models/product-list-item.model.dart';
import 'package:eshop/ui/widgets/shared/loader.widget.dart';

class ProductList extends StatelessWidget {
  final Axis scrollDirection;
  final List<ProductListItemModel> products;

  const ProductList({this.products, this.scrollDirection = Axis.horizontal});

  @override
   Widget build(BuildContext context) {
    return Container(
      height: 410,
      child: Loader(
        object: products,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: scrollDirection,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(5),
          child: ProductCard(
            item: products[index],
          ),
        );
      },
    );
  }
}
