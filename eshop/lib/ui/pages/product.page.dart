import 'package:eshop/models/product-details.model.dart';
import 'package:eshop/repositories/product.repository.dart';
import 'package:eshop/ui/widgets/shared/progress-indicator.widget.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String tag;
  final _repository = new ProductRepository();

  ProductPage({@required this.tag});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductDetailsModel>(
      future: _repository.get(tag),
      builder: (context, snapshot) {
        ProductDetailsModel product = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text("Aguardando...");
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: GenericProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Center(
                child: Text("Não foi possível obter o produto."),
              );
            }
            return content(product);
        }
        return null;
      },
    );
  }

  Widget content(ProductDetailsModel product) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white.withOpacity(0),
              elevation: 0.0,
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Hero(
                  tag: product.images[0],
                  child: new ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: product.images.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Container(
                        width: 200,
                        child: Image.network(
                          product.images[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: Text(
                product.title,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                product.description,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                product.brand,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Nike Dri-FIT is a polyester fabric designed to help you keep dry so you",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
