import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'virtual_business_card_page.dart';

class QRBottomSheetWidget extends StatefulWidget {
  final String _qrLink = 'https://www.google.com';

  @override
  _QRBottomSheetWidgetState createState() => _QRBottomSheetWidgetState();
}

class _QRBottomSheetWidgetState extends State<QRBottomSheetWidget> {
  bool _showFirstSet = true;
  double bottom = 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: bottom),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Share Qr Code',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFFA8B6B3),
              ),
            ),
            SizedBox(height: 40),
            _showFirstSet
                ? Column(
                    key: ValueKey<bool>(_showFirstSet),
                    children: [
                      QrImageView(
                        data: widget._qrLink,
                        version: QrVersions.auto,
                        size: 220,
                      ),
                      SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _showFirstSet = false;
                            bottom += 20;
                          });
                        },
                        child: ShareButton(
                          buttonText: 'Share Qr Code',
                        ),
                      ),
                    ],
                  )
                : Column(
                    key: ValueKey<bool>(_showFirstSet),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RoundIconWidget(
                            svgPath: 'assets/twitter.svg',
                            text: 'Twitter',
                            url: 'https://www.instagram.com/',
                          ),
                          RoundIconWidget(
                            svgPath: 'assets/facebook.svg',
                            text: 'Facebook',
                            url: 'https://www.instagram.com/',
                          ),
                          RoundIconWidget(
                            svgPath: 'assets/mail.svg',
                            text: 'Email',
                            url: 'https://www.instagram.com/',
                          ),
                          RoundIconWidget(
                            svgPath: 'assets/whatsapp.svg',
                            text: 'Whatsapp',
                            url: 'https://www.instagram.com/',
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bottom -= 20;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        VirtualBusinessCardPage(
                                          qrData: widget._qrLink,
                                        )));
                          });
                        },
                        child: ShareButton(
                          buttonText: 'Share',
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

class ShareBottomSheetWidget extends StatelessWidget {
  const ShareBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 100),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Share a Business Card',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFFA8B6B3),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RoundIconWidget(
                  svgPath: 'assets/twitter.svg',
                  text: 'Twitter',
                  url: 'https://www.instagram.com/',
                ),
                RoundIconWidget(
                  svgPath: 'assets/facebook.svg',
                  text: 'Facebook',
                  url: 'https://www.instagram.com/',
                ),
                RoundIconWidget(
                  svgPath: 'assets/mail.svg',
                  text: 'Email',
                  url: 'https://www.instagram.com/',
                ),
                RoundIconWidget(
                  svgPath: 'assets/whatsapp.svg',
                  text: 'Whatsapp',
                  url: 'https://www.instagram.com/',
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xFFE4E4E4)),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50)),
                      color: Color(0xFFFFFFFF),
                    ),
                    height: 56,
                    child: Text(
                      'http://rasheed/profile',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    color: Color(0xFF29695D),
                  ),
                  height: 56,
                  width: 70,
                  child: Center(child: SvgPicture.asset('assets/copy.svg')),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            ShareButton(buttonText: "Share"),
          ],
        ),
      ),
    );
  }
}

class RoundIconWidget extends StatelessWidget {
  final String svgPath;
  final String text;
  final String url;
  RoundIconWidget(
      {required this.svgPath, required this.text, required this.url});

  Future<void> _launchURL() async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            await _launchURL();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFFEBEEED),
            ),
            height: 66,
            width: 66,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              svgPath,
              fit: BoxFit.contain, // Ensure the SVG fits within the container
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFFAEAEAE),
          ),
        ),
      ],
    );
  }
}

class ShareButton extends StatelessWidget {
  final String buttonText;
  final double? height;
  final void Function()? onTap;

  ShareButton({required this.buttonText, this.onTap, this.height = 54});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color(0xFF29695D),
        ),
        height: height,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
              fontFamily: 'Ubuntu',
              color: Color(0xFFF5F5F5),
            ),
          ),
        ),
      ),
    );
  }
}
