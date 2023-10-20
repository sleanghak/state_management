class ProductResModel {
  int? id;
  String? name;
  String? price;
  String? desc;

  ProductResModel({this.id, this.name, this.price, this.desc});

  ProductResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['desc'] = desc;
    return data;
  }
}
