class ProductModel {
  String name;
  String price;
  String description;

  ProductModel(
      {required this.name, required this.price, required this.description});
}

class ProductSlideModel {
  List productlist;
  String title;

  ProductSlideModel({required this.productlist, required this.title});
}
