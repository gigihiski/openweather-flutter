import 'package:weatherforecast/providers/help_provider.dart';

class HelpRepository {
  HelpProvider _helpProvider = HelpProvider();

  // Load HTML File
  Future<String> fetchHTMLFile(String path) async {
    return _helpProvider.fetchHTMLFile(path);
  }
}
