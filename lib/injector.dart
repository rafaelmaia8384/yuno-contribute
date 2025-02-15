import 'dart:io';

import 'package:auto_injector/auto_injector.dart';
import 'package:uno/uno.dart';
import 'package:yuno/app/data/repositories/apps/android_apps_repository.dart';
import 'package:yuno/app/data/repositories/share_preferences/shared_preference_config_repository.dart';
import 'package:yuno/app/data/services/gamepad/android_gamepad_service.dart';
import 'package:yuno/app/interactor/services/gamepad_service.dart';

import 'app/data/repositories/isar/isar_platform_repository.dart';
import 'app/data/repositories/uno_sync_repository.dart';
import 'app/interactor/repositories/apps_repository.dart';
import 'app/interactor/repositories/config_repository.dart';
import 'app/interactor/repositories/platform_repository.dart';
import 'app/interactor/repositories/sync_repository.dart';

final injector = AutoInjector(
  on: (i) {
    i.addSingleton<Uno>(Uno.new);
    i.addSingleton<SyncRepository>(UnoSyncRepository.new);
    i.addSingleton<ConfigRepository>(SharedPreferenceConfigRepository.new);
    i.addSingleton<PlatformRepository>(IsarPlatformRepository.new);

    _androidConfig(i);
  },
);

void _androidConfig(Injector i) {
  if (!Platform.isAndroid) return;
  i.addSingleton<AppsRepository>(AndroidAppsRepository.new);
  i.addSingleton<GamepadService>(AndroidGamepadService.new);
}
