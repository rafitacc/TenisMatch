import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instacia = UserPreferences._internal();

  factory UserPreferences() {
    return _instacia;
  }
  UserPreferences._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

//todo: DATA ***************************************************

  //************ */ GET y SET  localCreateDate
  List<String> get localCreateDate {
    return _prefs.getStringList('localCreateDate') ?? [];
  }

  set localCreateDate(List<String> value) {
    _prefs.setStringList('localCreateDate', value);
  }
}
