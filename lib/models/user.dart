class User {
  String? firstName;
  String? lastName;
  String? age;
  String? dob;
  String? email;
  String? password;

  User(
      {this.firstName,
      this.lastName,
      this.age,
      this.dob,
      this.email,
      this.password});

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["firstName"],
        lastName: json["lastName"],
        age: json["age"],
        dob: json["dob"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "age": age,
        "dob": dob,
        "email": email,
        "password": password
      };
}
