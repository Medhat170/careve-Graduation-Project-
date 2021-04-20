import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
import 'package:flutter/cupertino.dart';

class SettingsRepo extends ActiveRepo<String, dynamic> {
  @override
  String get boxName => 'settings';

  bool get firstTime => getValueById('firstTime') as bool;

  String get cachedUserId => getValueById('cachedUserId').toString();

  String get cachedLang => getValueById('cachedLang').toString();

  Future setCachedUserId(String value) => dataBox.put('cachedUserId', value);

  Future setCachedLang(String value) => dataBox.put('cachedLang', value);

  Future setFirstTime({@required bool value}) =>
      dataBox.put('firstTime', value ?? true);
}
