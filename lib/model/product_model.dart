class ProductModel {
  String id;
  String name;
  String mesurment;
  String price;
  String qrcode;

  ProductModel({
    required this.id,
    required this.name,
    required this.mesurment,
    required this.price,
    required this.qrcode,
  });


  ProductModel copyWith({
    String? id,
    String? name,
    String? mesurment,
    String? price,
    String? qrcode,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      mesurment: mesurment ?? this.mesurment,
      price: price ?? this.price,
      qrcode: qrcode ?? this.qrcode,
    );
  }
}