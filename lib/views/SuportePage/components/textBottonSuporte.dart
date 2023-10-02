import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TextBottonSuporte extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icone;
  final String link;

  TextBottonSuporte({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icone,
    required this.link,
  });

  Future<void> _launchLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false, forceSafariVC: false);
    } else {
      print('Não e possível executar o link $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        TextButton(
          onPressed: () {
            
            _launchLink(link);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.01,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(icone),
                ),
                Expanded(
                  flex: 8,
                  child: ListTile(
                    title: Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    subtitle: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.02,
          ),
          width: size.width * 1,
          child: Divider(
            thickness: 1,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }
}
