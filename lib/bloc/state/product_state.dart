import 'package:technical_challange/model/product_model.dart';

abstract class ProductState {}

class InitialProductState extends ProductState {}

class SuccesGetProductState extends ProductState {
  List<ProductModel> products;

  SuccesGetProductState(this.products);
}

class LoadingProductState extends ProductState {}

class FailureProductState extends ProductState {
  String msg;

  FailureProductState(this.msg);
}
