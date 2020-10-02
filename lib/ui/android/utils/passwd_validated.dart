final lettersRegex = RegExp(r'[a-zA-Z]');
final numberRegex = RegExp(r'\d');

String passwdValidated(String value) {
  if (value.length < 8) {
    return 'Sua senha deve ter pelo menos 8 caracteres';
  }
  for (var i = 0; i < value.length - 1; i++) {
    if (isNumeric(value[i]) && isNumeric(value[i + 1])) {
      if (int.parse(value[i]) + 1 == int.parse(value[i + 1]) ||
          int.parse(value[i]) == int.parse(value[i + 1])) {
        return "Sua senha não deve ter números sequenciais";
      }
    }
  }
  if (lettersRegex.hasMatch(value) && numberRegex.hasMatch(value)) {
    return null;
  }
  return 'Sua senha deve ser alfanumérica';
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.parse(s, (e) => null) != null;
}
