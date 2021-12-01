
class Review{
  final String id;
  final String reviewString;
  final double rating;


  Review({
    required this.id,
    required this.reviewString,
    required this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json){

    return Review(
      id: json['id'],
      reviewString : json['reviewString'],
      rating: json['rating'],
    );
  }
}
