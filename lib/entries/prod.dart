
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import '../helpers/utils.dart';
import '../main.dart';
import '../services/api_service.dart';
import '../services/definitions.dart';
import '../services/storage_service.dart';

Future main() async {
  // set up environment
  GetIt.instance.registerLazySingleton<PublishSubject<ErrorInfo>>(() => PublishSubject<ErrorInfo>());
  GetIt.instance.registerLazySingleton<StorageService>(() => StorageService());
  GetIt.instance.registerLazySingleton<BaseApiService>(() => ApiService(
    getValidToken: () async => '',
    authority: "PROD URL",
    subPath: "PROD SUB PATH",
    errorSubject: GetIt.instance<PublishSubject<ErrorInfo>>(),
  ));

  await initMain();
  return runApp(App(
    iosLocale: await iosLocale(),
    serviceInfo: AppInfo(isDev: false),
  ));
}
