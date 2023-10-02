import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

typedef ButtonCallback = void Function();

class TextBottonSobre extends StatelessWidget {
  final String link;
  final String title;
  final IconData icone;
  final VoidCallback onTap;
  TextBottonSobre({
    super.key,
    required this.link,
    required this.title,
    required this.icone,
    required this.onTap,
  });

  Future<void> _launchLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false, forceSafariVC: false);
    } else {
      print('Não e possível executar o link $url');
    }
  }

  @override
  // Widget build(BuildContext context) {
  //   final size = MediaQuery.of(context).size;
  //   return Container(
  //     child: Column(
  //       children: [
  //         Container(
  //           padding: EdgeInsets.symmetric(vertical: 13, horizontal: 7),
  //           child: InkWell(
  //             onTap: onTap,
  //             child: Padding(
  //               padding: EdgeInsets.symmetric(
  //                 horizontal: size.width * 0.01,
  //               ),
  //               child: Row(
  //                 children: [
  //                   Padding(
  //                     padding: EdgeInsets.only(right: 15),
  //                     child: Icon(icone, color: Color.fromARGB(255, 0, 48, 39)),
  //                   ),
  //                   Expanded(
  //                     flex: 8,
  //                     child: Text(
  //                       title,
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold,
  //                         color: Color.fromARGB(255, 0, 48, 39),
  //                       ),
  //                     ),
  //                   ),
  //                   Icon(
  //                     Icons.arrow_forward_ios,
  //                     color: Color.fromARGB(255, 0, 48, 39),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //         Container(
  //           padding: EdgeInsets.symmetric(
  //             horizontal: size.width * 0.02,
  //           ),
  //           width: size.width * 1,
  //           child: Divider(
  //             thickness: 2,
  //             color: Colors.grey[400],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              if (link == '') {
                onTap;
              } else {
                _launchLink(link);
              }
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
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios),
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
              thickness: 2,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
