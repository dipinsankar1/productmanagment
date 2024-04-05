part of 'products_bloc.dart';

@immutable
abstract  class ProductsEvent {}
class LoadProducts extends ProductsEvent {}

class AddProduct extends ProductsEvent {
  final ProductModel products;

  AddProduct(this.products);
}

class UpdateProduct extends ProductsEvent {
  final ProductModel products;

  UpdateProduct(this.products);
}

class DeleteProduct extends ProductsEvent {
  final String productId;

  DeleteProduct(this.productId);
}