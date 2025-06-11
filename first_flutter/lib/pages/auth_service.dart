class AuthService {
  static const _dummyEmail = 'usuario@correo.com';
  static const _dummyPassword = '123456';

  static bool login(String email, String password) {
    return email == _dummyEmail && password == _dummyPassword;
  }
}