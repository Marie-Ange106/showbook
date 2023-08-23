import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  


  void launchInstagram(String url) async {
     final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    }  else {
      throw 'Impossible d\'ouvrir l\'URL $url';
    }
  }
}
