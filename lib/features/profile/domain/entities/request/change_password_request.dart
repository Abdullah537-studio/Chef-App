class ChangePaswordRequest {
  final String oldPass;
  final String newPass;
  final String confirmPassword;

  const ChangePaswordRequest({
    required this.oldPass,
    required this.newPass,
    required this.confirmPassword,
  });
}
