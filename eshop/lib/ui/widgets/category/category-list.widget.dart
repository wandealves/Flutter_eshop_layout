import 'package:flutter/material.dart';

import 'package:eshop/models/category-list-item.model.dart';
import 'package:eshop/ui/widgets/shared/loader.widget.dart';
import 'package:eshop/ui/widgets/category/category-item.widget.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryListItemModel> categories;

  const CategoryList({@required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Loader(
        object: categories,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        CategoryListItemModel item = categories[index];

        return Padding(
          padding: EdgeInsets.all(5),
          child: CategoryItem(
            item: item,
          ),
        );
      },
    );
  }
}
