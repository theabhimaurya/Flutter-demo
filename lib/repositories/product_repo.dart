import 'package:flutter/material.dart';

abstract class ProductRepo {
  Future getProduct(Map<String, dynamic> req, BuildContext context);
  Future getMoviesList( BuildContext context);

  
}