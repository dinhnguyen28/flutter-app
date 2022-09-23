class LoginRequestModel {
  String email;
  String password;
  String realm;

  LoginRequestModel({
    required this.email,
    required this.password,
    required this.realm,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "email": email,
      "password": password,
      "realm": realm,
    };
    return map;
  }
}

class LoginResponseModel {
  LoginResponseModel({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  Data data;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.accessToken,
    //required this.realm,
  });

  String accessToken;
  //String realm;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["access_token"],
        //realm: json["realm"],
      );
  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        // "realm": realm,
      };
}
