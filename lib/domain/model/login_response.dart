class LoginResponse {
  final String jwtToken;
  final bool firstLogin;

  LoginResponse({
    required this.jwtToken,
    required this.firstLogin,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      jwtToken: json['jwtToken'],
      firstLogin: json['firstLogin'],
    );
  }
}
