class ProductModel {
  String image;
  String name;
  int price;
  String date;

  ProductModel(this.image, this.name, this.price, this.date);

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    return ProductModel(
        data['image'], data['name'], data['price'], data['date']);
  }
}
