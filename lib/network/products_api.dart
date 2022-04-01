import 'dart:convert';

import 'package:technical_challange/model/product_model.dart';
import 'package:technical_challange/shared/url.dart';
import 'package:http/http.dart' as http;
class ProductsApi{
  final url = Url.url;

  Future<List<ProductModel>> getProducts()async{
    final urlProduct=url+'/products';
    final request = await http.get(Uri.parse(urlProduct));
    List body=jsonDecode(request.body);
    if(request.statusCode==200){
      List<ProductModel> data=[];
      for(int i=0;i<body.length;i++){
        data.add(ProductModel.fromJson(body[i]));
      }
      return data;
    }else{
      throw(request.statusCode);
    }
  }
}