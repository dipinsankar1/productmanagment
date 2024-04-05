import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:productsample/model/product_model.dart';
import 'package:productsample/services/firestore_service.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final FirestoreService _firestoreService;
  ProductsBloc(this._firestoreService) : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async {
      // TODO: implement event handler
      try {
        emit(ProductLoading());
        final products = await _firestoreService.getProducts().first;
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError('Failed to load products.'));
      }
    });
    on<AddProduct>((event, emit) async {
      try {
        emit(ProductLoading());
        await _firestoreService.addProducts(event.products);
        emit(ProductOperationSuccess('Products added successfully.'));
      } catch (e) {
        emit(ProductError('Failed to add todo.'));
      }
    });

    on<UpdateProduct>((event, emit)  async {
      try {
        emit(ProductLoading());
        await _firestoreService.updateProducts(event.products);
        emit(ProductOperationSuccess('Todo updated successfully.'));
      } catch (e) {
        emit(ProductError('Failed to update todo.'));
      }
    });

    on<DeleteProduct>((event, emit) async {
      try {
        emit(ProductLoading());
        await _firestoreService.deleteProducts(event.productId);
        emit(ProductOperationSuccess('Todo deleted successfully.'));
      } catch (e) {
        emit(ProductError('Failed to delete todo.'));
      }
    });

  }
}
