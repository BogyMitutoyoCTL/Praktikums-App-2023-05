import 'dart:async';
import 'package:decision_making_app/EditEntscheidungen.dart';
import 'package:decision_making_app/Entscheidung.dart';
import 'package:decision_making_app/ZufallsErgebnis.dart';
import 'package:decision_making_app/main.dart';
import 'package:decision_making_app/storeFiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(AppLocalizations.of(context)!.about)),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: about,
              child: Text(AppLocalizations.of(context)!.about),
            ),
            TextButton(
              onPressed: toLicenses,
              child: Text(AppLocalizations.of(context)!.licenses),
            )
          ],
        ),
      ),
    );
  }

  void about() async {
    const url = 'https://github.com/BogyMitutoyoCTL/Praktikums-App-2023-05';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  void toLicenses() {
    //TODO Licenses Widget or link
  }
}
