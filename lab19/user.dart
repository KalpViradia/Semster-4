class User {
  int id;
  String name;
  String email;
  Address address;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: Address.fromJson(json['address']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': address.toJson(),
    };
  }
}

class Address {
  String street;
  String city;
  String zip;

  Address({
    required this.street,
    required this.city,
    required this.zip,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      city: json['city'],
      zip: json['zip'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'zip': zip,
    };
  }
}
