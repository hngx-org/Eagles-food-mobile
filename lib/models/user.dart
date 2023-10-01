
class User {
  final String? user_id;
  final String? firstName, lastName, email, phone_number;
  final bool? isAdmin;

  User({
    required this.user_id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone_number,
    required this.isAdmin,
  });

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
        user_id: data['user_id'],
        email: data['email'],
        firstName: data['firstName'],
        lastName: data['lastName'],
        phone_number: data['phone_number'],
        isAdmin: data['isAdmin']
    );
  }

  Map<String, dynamic> toJson() => {
    'user_id': user_id,
    'email': email,
    'firstName': firstName,
    'lastName': lastName,
    'phone_number' : phone_number,
    'isAdmin': isAdmin
  };
}