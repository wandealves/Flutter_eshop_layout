import 'package:flutter/material.dart';

import 'package:eshop/widgets/search-box.widget.dart';
import 'package:eshop/widgets/category/category-list.widget.dart';
import 'package:eshop/widgets/product/product-list.widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  SerachBox(),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Categories",
                    style: Theme.of(context).textTheme.headline,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 90,
                    child: CategoryList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Best Selling",
                        style: Theme.of(context).textTheme.headline,
                      ),
                      FlatButton(
                        child: Text("See All"),
                        onPressed: () => {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 350,
                    child: ProductList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
