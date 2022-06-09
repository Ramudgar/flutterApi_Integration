class User {
  String? email;
  String? password;
  String? address;
  String? phone;
  String? username;
  String? country;

  User({
    this.email,
    this.password,
    this.address,
    this.phone,
    this.username,
    this.country,
  });


// convertig json data to dart object and returning it as a dart object (User)  
  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        password: json["password"],
        address: json["address"],
        phone: json["phone"],
        username: json["username"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "address": address,
        "phone": phone,
        "username": username,
        "country": country,
      };
}
