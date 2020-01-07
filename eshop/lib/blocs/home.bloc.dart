import 'package:flutter/widgets.dart';

import 'package:eshop/models/category-list-item.model.dart';
import 'package:eshop/models/product-list-item.model.dart';
import 'package:eshop/repositories/category.repository.dart';
import 'package:eshop/repositories/product.repository.dart';

class HomeBloc extends ChangeNotifier {
  final categoryRepository = new CategoryRepository();
  final productRepository = new ProductRepository();

  List<ProductListItemModel> products;
  List<CategoryListItemModel> categories;
  String selectedCategory = 'todos';

  HomeBloc() {
    getCategories();
    getProduts();
  }

  getCategories() {
    categoryRepository.getAll().then((data) {
      this.categories = data;
      notifyListeners();
    });
  }

  getProduts() {
    productRepository.getAll().then((data) {
      this.products = data;
      notifyListeners();
    });
  }

  getProductByCategory() {
    productRepository.getByCategory(selectedCategory).then((data) {
      this.products = data;
      notifyListeners();
    });
  }

  changeCategory(tag) {
    selectedCategory = tag;
    products = null;
    getProductByCategory();
    notifyListeners();
  }
}
