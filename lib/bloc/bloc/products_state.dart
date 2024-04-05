part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}
class ProductInitial extends ProductsState {}

class ProductLoading extends ProductsState {}

class ProductLoaded extends ProductsState {
  final List<ProductModel> products;

  ProductLoaded(this.products);
}

class ProductOperationSuccess extends ProductsState {
  final String message;

  ProductOperationSuccess(this.message);
}

class ProductError extends ProductsState {
  final String errorMessage;

  ProductError(this.errorMessage);
}
