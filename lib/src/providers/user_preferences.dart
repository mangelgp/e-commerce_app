
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  static final UserPreferences _instancia = new UserPreferences._internal();

  factory UserPreferences() {
    return _instancia;
  }

  UserPreferences._internal();

  SharedPreferences _preferences;

  initPrefs() async {
    this._preferences = await SharedPreferences.getInstance();
  }

  // get & set del id Categoria

  get idCategoria {
    return _preferences.getInt('idCategoria') ?? 1;
  }

  set idCategoria(int value) {
    _preferences.setInt('idCategoria', value);
  }
}