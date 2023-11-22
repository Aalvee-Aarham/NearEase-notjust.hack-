// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  String name;
  String price;
  String description;

  ProductModel(
      {required this.name,
      required this.price,
      required this.description,
      isInd = false});
}

class ProductSlideModel {
  List productlist;
  String title;

  ProductSlideModel({required this.productlist, required this.title});
}

class Data {
  var one;
  var two;
  var three;
  var categories;

  Data({
    required this.one,
    required this.two,
    required this.three,
    required this.categories,
  });
}
