class ChangePasswordRequest {
  final String oldPass;
  final String newPass;
  final String confirmPassword;

  const ChangePasswordRequest({
    required this.oldPass,
    required this.newPass,
    required this.confirmPassword,
  });
  Map<String, dynamic> toJson() {
    return {
      "oldPass": oldPass,
      "newPass": newPass,
      "confirmPassword": confirmPassword,
    };
  }
}
