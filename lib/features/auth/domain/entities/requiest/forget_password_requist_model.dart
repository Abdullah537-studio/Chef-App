class ForgetPasswordRequistModel {
  final String email;

  const ForgetPasswordRequistModel({required this.email});

  Map<String, dynamic> toJson() {
    return {
      "email": email,
    };
  }
}
