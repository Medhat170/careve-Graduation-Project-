import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';

class SettingsRepo extends ActiveRepo<String, dynamic> {
  @override
  String get boxName => 'settings';

  bool get firstTime => getValueById('firstTime');

  String get cachedUserId => getValueById('cachedUserId');

  String get cachedLang => getValueById('cachedLang');

  Future setCachedUserId(String value) async =>
      await dataBox.put('cachedUserId', value);

  Future setCachedLang(String value) async =>
      await dataBox.put('cachedLang', value);

  Future setFirstTime(bool value) async =>
      await dataBox.put('firstTime', value);
}
