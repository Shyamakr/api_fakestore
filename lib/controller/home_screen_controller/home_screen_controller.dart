import 'dart:convert';

import 'package:api_fakestore/model/fake_store_api_res_model/fake_store_api_res_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  List<ProductResModel> productsList = [];
  fetchData() async {
    var url = Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body) as List;

      productsList = decodedData
          .map<ProductResModel>((element) => ProductResModel.fromJson(element))
          .toList();
      print(productsList[1].category);
      notifyListeners();
    }
  }
}
