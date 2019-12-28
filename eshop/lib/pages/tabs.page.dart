import 'package:flutter/material.dart';

import 'package:eshop/pages/cart.page.dart';
import 'package:eshop/pages/home.page.dart';
import 'package:eshop/pages/login.page.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          HomePage(),
          CartPage(),
          LoginPage(),
        ],
      ),
      bottomNavigationBar: new TabBar(
        tabs: <Widget>[
          Tab(
            icon: new Icon(
              Icons.home,
            ),
          ),
          Tab(
            icon: new Icon(
              Icons.shopping_cart,
            ),
          ),
          Tab(
            icon: new Icon(
              Icons.perm_identity,
            ),
          ),
        ],
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.black38,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.blue,
      ),
    );
  }
}