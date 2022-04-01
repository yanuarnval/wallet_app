import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_challange/bloc/event/product_event.dart';
import 'package:technical_challange/bloc/state/product_state.dart';
import 'package:technical_challange/network/products_api.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(InitialProductState()) {
    on<ProductEvent>((event, emit) async {
      if (event is GetProduct) {
        emit(LoadingProductState());
        try {
          final data = await ProductsApi().getProducts();
          emit(SuccesGetProductState(data));
        } catch (e) {
          emit(FailureProductState(e.toString()));
        }
      }
    });
  }
}
