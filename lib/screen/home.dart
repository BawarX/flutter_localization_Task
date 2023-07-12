import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:loc_flut/language.dart';
import 'package:loc_flut/main.dart';

extension AppLocalizationsExtension on BuildContext {
  AppLocalizations get tr => AppLocalizations.of(this)!;
}

enum MenuItem { item1, item2 }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.language,style: const TextStyle(fontSize: 20),),
        actions: [
          DropdownButton<Language>(
            items: Language.languageList()
                .map(
                  (e) => DropdownMenuItem<Language>(
                    value: e,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[Text(e.name)],
                    ),
                  ),
                )
                .toList(),
            onChanged: (Language? language) async {
              if (language != null) {
               MyApp.setLocale(context,  Locale(language.languageCode,''));
              }
            },
          )
        ],
      ),
      body:  Center(
          child: SingleChildScrollView(
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
            const SizedBox(
              height: 10,
            ),
            const CircleAvatar(
              maxRadius: 50,
            ),
            const SizedBox(
              height: 55,
            ),
            Text(
              context.tr.personalinformation,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
              SizedBox(
              width: 350,
              child: TextField(
                  decoration: InputDecoration(  
                  border: const OutlineInputBorder(),
                  labelText: context.tr.name,
                //  labelText: 'name',
                  hintText: ''
                  
                ),
              ),
            ),
            const SizedBox(height: 10,),
             const SizedBox(
              width: 350,
              child: TextField(
                  decoration: InputDecoration(  
                  border: OutlineInputBorder(),
                  labelText: 'Tellephone',
                  hintText: 'name',
                  
                ),
              ),
            ),
                  ],
                ),
          )),
    );
  }
}
