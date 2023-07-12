import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String KURDISH = 'ku';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? ENGLISH;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return const Locale(ENGLISH, '');
    case KURDISH:
      return const Locale(KURDISH, "");
    default:
      return const Locale(ENGLISH, '');
  }
}

