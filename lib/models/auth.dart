class Auth {
  int id;
  String accessToken;
  String permissions;

  Auth({this.id, this.accessToken, this.permissions});

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      id: json['id'],
      accessToken: json['accessToken'],
      permissions: json['permissions'],
    );
  }
}
