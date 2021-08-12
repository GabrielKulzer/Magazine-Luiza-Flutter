class Product {
  String photos;
  String name;
  String descrition;
  String price;
  String plots;
  String value;
  bool islove;
  Product({
    required this.photos,
    required this.name,
    required this.descrition,
    required this.price,
    required this.plots,
    required this.value,
    this.islove = false,
  });
}
