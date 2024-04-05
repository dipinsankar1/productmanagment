import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:productsample/model/product_model.dart';

class FirestoreService {
  final CollectionReference _productCollection =
  FirebaseFirestore.instance.collection('products');

  Stream<List<ProductModel>> getProducts() {
    return _productCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return ProductModel(
          id: doc.id,
          name: data['name'],
          mesurment: data['mesurment'],
          price: data['price'],
          qrcode: data['qrcode'],
        );
      }).toList();
    });
  }

  Future<void> addProducts(ProductModel productmodel) {
    return _productCollection.add({
      'name': productmodel.name,
      'mesurment': productmodel.mesurment,
      'price': productmodel.price,
      'qrcode': productmodel.qrcode,
    });
  }

  Future<void> updateProducts(ProductModel productmodel) {
    return _productCollection.doc(productmodel.id).update({
      'name': productmodel.name,
      'mesurment': productmodel.mesurment,
      'price': productmodel.price,
      'qrcode': productmodel.qrcode,
    });
  }

  Future<void> deleteProducts(String productId) {
    return _productCollection.doc(productId).delete();
  }
}