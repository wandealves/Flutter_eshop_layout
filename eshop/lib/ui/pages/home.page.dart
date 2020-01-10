import 'package:eshop/blocs/home.bloc.dart';
import 'package:flutter/material.dart';

import 'package:eshop/ui/widgets/search-box.widget.dart';
import 'package:eshop/ui/widgets/category/category-list.widget.dart';
import 'package:eshop/ui/widgets/product/product-list.widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);

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
                  SearchBox(),
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
                    height: 100,
                    child: CategoryList(
                      categories: bloc.categories,
                    ),
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
                    child: ProductList(
                      products: bloc.products,
                    ),
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
