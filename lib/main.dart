import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_business_card/bottom_sheet_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_image_slider/carousel.dart';
// import 'package:contacts_service/contacts_service.dart';
// import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Ubuntu',
      ),
      home: BusinessCardPage(),
    );
  }
}

class BusinessCardPage extends StatelessWidget {
  final String name = "Mohamed Rasheed Rahman";
  final String family = "Levitate";
  final String phoneNum1 = '+91 9790241289';
  final String phoneNum2 = '+91 9944757883';
  final String email = 'rasheed.levitate@gmail.com';
  final String address =
      '3, Vathiar street, Karuvadikuppam, Lawspet, Puducherry, 605008';
  final String website = 'https://levitatestudios.in/';
  final String location = 'https://maps.app.goo.gl/Do4wHcyMzh8TZwnL8';
  final String position = 'Flutter Developer';
  final String company = 'Levitate Studios';
  final String about_me_text =
      "Hey, I'm the co-founder and Chief Design Officer at Levitate Studios, shaping awesome experiences for over four years. From pixels to user smiles, I've got a knack for making things look and feel amazing. Let's design the future together! 🎨";

  Future<void> openDialPad(String phoneNumber) async {
    final Uri dialUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    if (await canLaunchUrl(dialUri)) {
      await launchUrl(dialUri);
    } else {
      throw 'Could not launch $dialUri';
    }
  }

  Future<void> launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF29695D),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                color: Color(0xFF29695D),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 78),
                      color: Color(0xFF29695D),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/logo.svg',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                        ),
                        color: Color(0xFFF5F5F5),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 140,
                                ),
                                Text(
                                  'About Me',
                                  style: TextStyle(
                                      color: Color(0xFF29695D),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  about_me_text,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFA8B6B3)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ButtonWidget(
                                  text: 'Qr Code',
                                  svgPath: 'assets/scan.svg',
                                  onTapped: () {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) => Wrap(
                                            children: [QRBottomSheetWidget()]));
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: ButtonWidget(
                                  text: 'Share',
                                  svgPath: 'assets/share.svg',
                                  onTapped: () {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) => Wrap(children: [
                                              ShareBottomSheetWidget()
                                            ]));
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ButtonWidget(
                            text: 'View Portfolio',
                            svgPath: 'assets/document.svg',
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SocialMediaLinksWidget(
                              text: 'Levitate',
                              behanceUrl: 'https://www.behance.net/',
                              instagramUrl: 'https://www.instagram.com/',
                              dribbleUrl: 'https://dribbble.com/',
                              linkedUrl: 'https://in.linkedin.com/'),
                          SizedBox(
                            height: 30,
                          ),
                          SocialMediaLinksWidget(
                              text: 'Personal',
                              behanceUrl: 'https://www.behance.net/',
                              instagramUrl: 'https://www.instagram.com/',
                              dribbleUrl: 'https://dribbble.com/',
                              linkedUrl: 'https://in.linkedin.com/'),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Contact',
                                  style: TextStyle(
                                      color: Color(0xFF33423F),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ContactDetailsWidget(
                                  text: 'Work',
                                  textDetails: phoneNum1,
                                  svgPath: 'assets/call.svg',
                                  onTap: () async {
                                    await openDialPad(phoneNum1);
                                  },
                                  bottom: 0,
                                ),
                                ContactDetailsWidget(
                                  text: 'Personal',
                                  textDetails: phoneNum2,
                                  svgPath: 'assets/call.svg',
                                  onTap: () async {
                                    await openDialPad(phoneNum2);
                                  },
                                  top: 0,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ContactDetailsWidget(
                                  text: 'Work',
                                  textDetails: email,
                                  svgPath: 'assets/sms.svg',
                                  onTap: () async {
                                    await launchEmail(email);
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ContactDetailsWidget(
                                  text: 'Website',
                                  textDetails: website,
                                  svgPath: 'assets/global.svg',
                                  onTap: () async {
                                    await launchURL(website);
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ContactDetailsWidget(
                                  text: 'Location',
                                  textDetails: address,
                                  svgPath: 'assets/location.svg',
                                  onTap: () async {
                                    await launchURL(location);
                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                // ShareButton(
                                //   buttonText: 'Add to contact',
                                //   onTap: () async {
                                //     await _createContact();
                                //   },
                                // ),
                                // SizedBox(
                                //   height: 30,
                                // ),
                              ],
                            ),
                          ),
                          Divider(),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Forms',
                                style: TextStyle(
                                    color: Color(0xFF33423F),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ShareButton(
                                buttonText: 'Job Application Form',
                                height: 45,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ShareButton(
                                buttonText: 'Brand Questionnaire Form',
                                height: 45,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Our Services',
                                  style: TextStyle(
                                      color: Color(0xFF33423F),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ServicesWidget(
                                  position: 'Graphic Design',
                                  detail:
                                      "Our graphic design services are customised to meet customer needs and preferences, whether you're looking for a captivating logo or a creative package.",
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ServicesWidget(
                                  position: 'UIUX Design',
                                  detail:
                                      "Our graphic design services are customised to meet customer needs and preferences, whether you're looking for a captivating logo or a creative package.",
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ServicesWidget(
                                  position: 'Application Development',
                                  detail:
                                      "Our graphic design services are customised to meet customer needs and preferences, whether you're looking for a captivating logo or a creative package.",
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ServicesWidget(
                                  position: 'Artworks',
                                  detail:
                                      "Our graphic design services are customised to meet customer needs and preferences, whether you're looking for a captivating logo or a creative package.",
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ServicesWidget(
                                  position: 'Animation',
                                  detail:
                                      "Our graphic design services are customised to meet customer needs and preferences, whether you're looking for a captivating logo or a creative package.",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Divider(),
                          Carousel(
                            height: 240,
                            autoScroll: true,
                            activateIndicatorColor: Color(0xFF29695D),
                            unActivatedIndicatorColor: Color(0xFFA4BDB8),
                            indicatorHeight: 10,
                            indicatorWidth: 10,
                            indicatorBarColor: Colors.transparent,

                            // widgets
                            items: [
                              Image.asset(
                                'images/banner.png',
                              ),
                              Image.asset(
                                'images/banner.png',
                              ),
                              Image.asset(
                                'images/banner.png',
                              ),
                              Image.asset(
                                'images/banner.png',
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/copyright.svg'),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '2023  www.levitatestudios.in',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF29695D)),
                              ),
                            ],
                          ),
                          // Container(
                          //   color: Color(0xFF29695D),
                          //   height: 10,
                          //   width: double.infinity,
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // Positioned(
              //   bottom: 30,
              //   right: 95,
              //   child: Container(
              //     child: Center(child: Text('Add to contact')),
              //     color: Color(0xFF29695D),
              //     height: 30,
              //     width: 300,
              //   ),
              // ),

              Positioned(
                top: 140,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        foregroundImage: AssetImage('images/rasheed.jpg'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                color: Color(0xFF29695D),
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '(He, Him)',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFFA8B6B3)),
                          ),
                        ],
                      ),
                      Text(
                        position,
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFFA8B6B3)),
                      ),
                      Text(
                        company,
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFFA8B6B3)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServicesWidget extends StatefulWidget {
  final String position;
  final String detail;

  ServicesWidget({required this.position, required this.detail});

  @override
  _ServicesWidgetState createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> {
  bool _isExpanded = false;

  Future<void> _launchURL() async {
    const url = 'https://www.google.com';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFD1E6D8),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.position,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2A695D),
              ),
            ),
            trailing: Icon(
              _isExpanded ? Icons.expand_less : Icons.expand_more,
              color: Color(0xFF2A695D),
            ),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
          _isExpanded
              ? Column(
                  children: [
                    Divider(),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.detail,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF2A695D),
                            ),
                          ),
                          SizedBox(height: 15),
                          GestureDetector(
                            onTap: _launchURL,
                            child: Text(
                              'For more details, visit our website',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2A695D),
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFF2A695D),
                                  decorationThickness: 0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String svgPath;
  final String text;
  final void Function()? onTapped;

  ButtonWidget({required this.svgPath, required this.text, this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: TextButton.icon(
        style: TextButton.styleFrom(
          backgroundColor: Color(0xFFEBEEED), // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
          ),
          // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
        onPressed: onTapped,
        icon: SvgPicture.asset(
          svgPath,
          height: 24,
          width: 24,
        ),
        label: Text(
          text,
          style: TextStyle(
              color: Color(0xFF29695D),
              fontWeight: FontWeight.w500,
              fontSize: 15),
        ),
      ),
    );
  }
}

class SocialMediaIcons extends StatelessWidget {
  final String svgPath;
  final String url;
  SocialMediaIcons({required this.svgPath, required this.url});

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
    return GestureDetector(
      onTap: _launchURL,
      child: Container(
        height: 66,
        width: 66,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color(0xFFDCE2E1)),
          borderRadius: BorderRadius.circular(8),
          color: Color(0xFFEBEEED),
        ),
        padding: EdgeInsets.all(15),
        child: SvgPicture.asset(
          svgPath,
          height: 26,
          width: 26,
        ),
      ),
    );
  }
}

class ContactDetailsWidget extends StatelessWidget {
  final String text;
  final String textDetails;
  final String svgPath;
  final void Function()? onTap;
  final double? top;
  final double? bottom;

  ContactDetailsWidget(
      {required this.text,
      required this.textDetails,
      required this.svgPath,
      this.onTap,
      this.top = 16,
      this.bottom = 16});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(top!), bottom: Radius.circular(bottom!)),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: EdgeInsets.only(bottom: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(fontSize: 14, color: Color(0xFFA8B6B3)),
                  ),
                  SizedBox(height: 5), // Space between the texts
                  Text(
                    textDetails,
                    style: TextStyle(
                        color: Color(0xFF29695D),
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            SizedBox(width: 10), // Space between text and icon
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFFEBEEED),
              ),
              height: 48,
              width: 48,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                svgPath,
                fit: BoxFit.contain, // Ensure the SVG fits within the container
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialMediaLinksWidget extends StatelessWidget {
  final String text;
  final String instagramUrl;
  final String behanceUrl;
  final String linkedUrl;
  final String dribbleUrl;
  SocialMediaLinksWidget(
      {required this.text,
      required this.behanceUrl,
      required this.instagramUrl,
      required this.dribbleUrl,
      required this.linkedUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Social Media Links ($text)',
            style: TextStyle(
                color: Color(0xFF33423F),
                fontSize: 17,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SocialMediaIcons(
                svgPath: 'assets/instagram.svg',
                url: instagramUrl,
              ),
              SocialMediaIcons(svgPath: 'assets/be.svg', url: behanceUrl),
              SocialMediaIcons(svgPath: 'assets/in.svg', url: linkedUrl),
              SocialMediaIcons(svgPath: 'assets/ball.svg', url: dribbleUrl),
            ],
          )
        ],
      ),
    );
  }
}
