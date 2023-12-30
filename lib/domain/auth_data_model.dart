class AuthDataModel {
  final String access;
  final String refresh;

  AuthDataModel({
    required this.access,
    required this.refresh,
  });

  factory AuthDataModel.fromMap(Map<String, dynamic> json) => AuthDataModel(
        access: json["access"],
        refresh: json["refresh"],
      );

  Map<String, dynamic> toMap() => {
        "access": access,
        "refresh": refresh,
      };
}
