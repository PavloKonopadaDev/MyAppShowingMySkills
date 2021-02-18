class SetProfileSignIn {
  final String email;
  final String password;
  SetProfileSignIn({
    this.email,
    this.password,
  });
}

class SetProfileSignUp {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  SetProfileSignUp({
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
  });
}

class SetProfileSignUpChangeEmail {
  final String email;
  SetProfileSignUpChangeEmail({
    this.email,
  });
}

class SetProfileSignUpForgotPassword {
  final String password;
  SetProfileSignUpForgotPassword({
    this.password,
  });
}

class SetProfileInputData {
  final String secondName;
  final String country;
  final String age;
  final String phoneNumber;

  SetProfileInputData({
    this.secondName,
    this.country,
    this.age,
    this.phoneNumber,
  });
}
