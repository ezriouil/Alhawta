class Product {

  // - - - - - - - - - - - - - - - - - - STATES - - - - - - - - - - - - - - - - - -  //
  late final String? id, thumbnail, title, description, category, city, size, phoneNumber, initialCountryCode, createAt;

  // - - - - - - - - - - - - - - - - - - CONSTRUCTOR- - - - - - - - - - - - - - - - - -  //
  Product({this.id = "", this.thumbnail = "",  this.title = "", this.description = "", this.category = "", this.city = "", this.size = "", this.phoneNumber = "", this.initialCountryCode = "", this.createAt = ""});

  // - - - - - - - - - - - - - - - - - - TO JSON - - - - - - - - - - - - - - - - - -  //
  Map<String, dynamic> toJson() => {
        'id': id,
        'thumbnail': thumbnail,
        'title': title,
        'description': description,
        'category': category,
        'city': city,
        'size': size,
        'phoneNumber': phoneNumber,
        'initialCountryCode': initialCountryCode,
        'createAt': createAt,
      };

  // - - - - - - - - - - - - - - - - - - FROM JSON- - - - - - - - - - - - - - - - - -  //
  static Product fromJson(Map json) {
    return Product(
        id: json['id'] as String,
        thumbnail: json['thumbnail'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        category: json['category'] as String,
        city: json['city'] as String,
        size: json['size'] as String,
        phoneNumber: json['phoneNumber'] as String,
        initialCountryCode: json['initialCountryCode'] as String,
        createAt: json['createAt'] as String
    );
  }

}
