import 'dart:convert';

UserProfile userProfileFromMap(String str) => UserProfile.fromMap(json.decode(str));

String userProfileToMap(UserProfile data) => json.encode(data.toMap());

class UserProfile {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String profilePicture;
  final String qrCode;

  UserProfile({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.profilePicture,
    required this.qrCode,
  });

  factory UserProfile.fromMap(Map<String, dynamic> json) => UserProfile(
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
        profilePicture: json["profile_picture"],
        qrCode: json["qr_code"],
      );

  factory UserProfile.idle() => UserProfile(
        firstName: '',
        lastName: '',
        phone: '',
        email: '',
        profilePicture: '',
        qrCode: '',
      );

  Map<String, dynamic> toMap() => {
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "profile_picture": profilePicture,
        "qr_code": qrCode,
      };
}
