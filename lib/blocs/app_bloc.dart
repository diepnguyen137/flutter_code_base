import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../services/storage_service.dart';
import '../services/definitions.dart';

class AppBloc {
  final StorageService _storageService;
  final AppInfo _info;

  AppBloc(this._storageService, this._info);

  Future<bool> setup() async {
    return true;
  }

  Future<bool> login() async {
    return true;
  }

  Future logout() async {
  }

  dispose() {
  }

}
