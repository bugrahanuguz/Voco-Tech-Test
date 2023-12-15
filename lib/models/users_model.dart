class Users {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Users({this.id, this.email, this.firstName, this.lastName, this.avatar});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }
}