class ReviewModel {
  final String image;
  final String name;
  final String date;
  final String review;
  final int rate;

  ReviewModel({
    required this.image,
    required this.name,
    required this.date,
    required this.review,
    required this.rate,
  });

  ReviewModel.fromJson(Map<String, dynamic> json)
      : this(
          image: json['image']! as String,
          name: json['name']! as String,
          date: json['date']! as String,
          review: json['review']! as String,
          rate: json['rate']! as int,
        );

  Map<String, Object?> toJson() {
    return {
      'image': image,
      'name': name,
      'date': date,
      'review': review,
      'rate': rate
    };
  }
}
