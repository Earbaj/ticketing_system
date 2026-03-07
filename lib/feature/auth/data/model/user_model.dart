class UserModel {
  final String id;
  final String email;
  final String token;

  UserModel({required this.id, required this.email, required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // Decoding the JWT to get ID/Email if they aren't explicit in the 'data' object
    return UserModel(
      id: json['data']['id'],
      email: json['data']['email'],
      token: json['access_token'],
    );
  }
}