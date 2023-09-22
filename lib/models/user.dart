
class User {
  final int id;
  final String firstName, lastName, email, phone;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
        id: data['id'],
        email: data['email'],
        firstName: data['firstName'],
        lastName: data['lastName'],
        phone: data['phone'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'firstName': firstName,
    'lastName': lastName,
    'phone' : phone,
  };
}