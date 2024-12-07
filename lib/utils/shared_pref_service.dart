import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {

  static SharedPreferences? _pref;

  static Future init()
  async{
    _pref=await SharedPreferences.getInstance();
  }


  static Future setTeamId(String teamid)async
  {
    await _pref!.setString("teamid", teamid);
  }
  static String? getTeamId()=> _pref!.getString("teamid");
}