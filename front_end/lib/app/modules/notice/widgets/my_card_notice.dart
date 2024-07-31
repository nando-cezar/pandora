import 'package:flutter/material.dart';
import 'package:pandora_front/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCardNotice extends StatefulWidget {
  final String url;
  final String image;
  final String title;
  final String date;

  const MyCardNotice({
    super.key,
    required this.url,
    required this.image,
    required this.title,
    required this.date,
  });

  @override
  State<MyCardNotice> createState() => _MyCardNoticeState();
}

class _MyCardNoticeState extends State<MyCardNotice> {

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: ListTile(
        leading: _buildImage(),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: myThirdColor,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.date,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 10,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () => _launchInBrowser(widget.url),
      ),
    );
  }

  Widget _buildImage() {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/placeholder_notice.jpg',
      image: widget.image,
      imageErrorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error);
      },
      fit: BoxFit.cover,
    );
  }



  Future<void> _launchInBrowser(String url) async {
    final Uri url = Uri(
      scheme: Uri.parse(widget.url).scheme,
      host: Uri.parse(widget.url).host,
      path: Uri.parse(widget.url).path,
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
