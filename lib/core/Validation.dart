


String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'You have to enter your email';
  }

  if (!email.contains("@")) {
    return 'Email must contain @';
  }



  return null; 
}


String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'you have to write password';
  }

  if (password.length < 6) {
  

    return 'password must be at least 6 characters';
  }

  return null;
}



String? validateUsername(String? username) {
  if (username == null || username.isEmpty) {
    return 'you have to write your name';
  }

  return null; 
}

