
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'services/storage_service.dart';
import 'services/definitions.dart';
import 'blocs/app_bloc.dart';
import 'localizations/app_localizations.dart';

Future initMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class App extends StatefulWidget {
  final Locale iosLocale;
  final AppInfo serviceInfo;

  const App({
    Key key,
    @required this.iosLocale,
    @required this.serviceInfo,
    }) :
      super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<AppBloc>(
      create: (_) => AppBloc(
        GetIt.instance<StorageService>(),
        widget.serviceInfo,
        ),
      dispose: (_, bloc) => bloc.dispose(),
      child: MaterialApp(
        localizationsDelegates: [
          const AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('jp', ''),
        ],
        localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
          Locale candidateLocale = widget.iosLocale??locale;
          for (Locale lc in supportedLocales) {
            if (lc.languageCode == candidateLocale.languageCode) {
              return candidateLocale;
            }
          }
          return supportedLocales.first;
        },
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Container()
      ),
    );
  }
}
