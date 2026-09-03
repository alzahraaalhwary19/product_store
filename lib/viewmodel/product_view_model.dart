import 'package:flutter/material.dart';
import 'package:product_store/product.dart';

class Productmodel extends ChangeNotifier {
  List <Product> _product = [];

  List <Product> get product => _product;

  double get total => _product.fold(0, (sum, product) => sum + product.price);

  void addToCart(Product product){
    _product.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product){
    _product.remove(product);
    notifyListeners();
  }
}