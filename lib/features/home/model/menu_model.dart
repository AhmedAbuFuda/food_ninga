class MenuModel {
  final String image;
  final String item;
  final String restaurant;
  final int price;
  final String type;

  MenuModel({
    required this.image,
    required this.item,
    required this.restaurant,
    required this.price,
    required this.type,
  });

  MenuModel.fromJson(Map<String, Object?> json)
      : this(
            image: json['image']! as String,
            item: json['item']! as String,
            restaurant: json['restaurant']! as String,
            price: json['price']! as int,
            type: json['type']! as String);

  get name => null;

  Map<String, Object?> toJson() {
    return {
      'image': image,
      'item': item,
      'restaurant': restaurant,
      'price': price,
      'type': type,
    };
  }
}
