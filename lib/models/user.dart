class User {
  int id;
  String firstname;
  String lastname;
  String email;
  String companyId;
  String accessToken;
  List<String> permissions;

  User(
      {this.id,
      this.firstname,
      this.lastname,
      this.email,
      this.companyId,
      this.accessToken,
      this.permissions});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstname: json['firstName'],
      lastname: json['lastName'],
      email: json['email'],
      companyId: json['companyId'].toString(),
      accessToken: json['accessToken'],
      permissions:
          (json['permissions'] as List).map((p) => (p.toString())).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstname,
        'last_name': lastname,
        'email': email,
        'companyId': companyId,
        'accessToken': accessToken,
        'permissions': permissions,
      };
}
