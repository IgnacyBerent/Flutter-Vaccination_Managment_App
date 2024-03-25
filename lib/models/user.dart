class User {
  String? id;
  String? username;
  String? email;
  // Add other attributes you need

  User({this.id, this.username, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      // Initialize other attributes here
    );
  }
}
