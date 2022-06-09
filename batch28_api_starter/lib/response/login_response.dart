class LoginResponse {
  bool? success;
  String? token;

  LoginResponse({this.success, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["Success"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "Success": success,
        "token": token,
      };
}
