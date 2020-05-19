import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import '../helpers/utils.dart' as util;
import '../main.dart';
import '../mocks/mock_api_service.dart';
import '../services/api_service.dart';
import '../services/definitions.dart';
import '../services/storage_service.dart';

Future main() async {
  // set up environment
  GetIt.instance.registerLazySingleton<PublishSubject<ErrorInfo>>(() => PublishSubject<ErrorInfo>());
  GetIt.instance.registerLazySingleton<StorageService>(() => StorageService());
  GetIt.instance.registerLazySingleton<BaseApiService>(() => MockApiService(
    errorSubject: GetIt.instance<PublishSubject<ErrorInfo>>(),
  ));

  await initMain();
  return runApp(App(
    iosLocale: await util.iosLocale(),
    serviceInfo: AppInfo(isDev: true),
  ));
}
