import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../commons/colors.dart';

class ShareAndRate extends StatelessWidget {
  const ShareAndRate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          child: Row(
            children: [
              Icon(Icons.share, color: ConstColors.aqua),
              const Text("Share", style: TextStyle(color: Colors.white))
            ],
          ),
          onTap: () async => await Share.share(
              'The quiz apps by Hasta Kencana Group. Download here to get started https://hastakencanajaya.co.id/'),
        ),
        GestureDetector(
            child: const Row(
              children: [
                Icon(Icons.grade, color: Colors.yellow),
                Text("Rate Us", style: TextStyle(color: Colors.white))
              ],
            ),
            onTap: () async =>
                await launchUrl(Uri.parse('https://hastakencanajaya.co.id/')))
      ],
    );
  }
}
