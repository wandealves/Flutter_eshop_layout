import 'package:flutter/material.dart';

import 'package:eshop/models/product-list-item.model.dart';
import 'package:eshop/ui/pages/product.page.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  final ProductListItemModel item;

  const ProductCard({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final price = new NumberFormat("#,##0.00", "pt_BR");

    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      width: 240,
      color: Colors.black12,
      child: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(
                        tag: item.tag,
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: item.image,
                  child: Image.network(
                    item.image,
                    width: 240,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                child: Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                item.brand,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 120,
                      child: Text(
                        "R\$ ${price.format(item.price)}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    // addToCart(item: item),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
