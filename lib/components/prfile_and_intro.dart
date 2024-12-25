import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sandeep_swian/Responsive/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class PrfileAndIntro extends StatefulWidget {
  const PrfileAndIntro({super.key});

  @override
  _PrfileAndIntroState createState() => _PrfileAndIntroState();
}

class _PrfileAndIntroState extends State<PrfileAndIntro>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late String _animatedText;
  late int _textIndex;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _controller.forward();
    _animatedText = '';
    _textIndex = 0;
    _scrollController = ScrollController();
    _startTypingAnimation(
        "Hey, I’m Sandeep Swain, an aspiring entrepreneur.\nBuilding solutions that truly matter.\nOn a mission to make an impact.");
  }

  void _startTypingAnimation(String fullText) {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_textIndex < fullText.length) {
        setState(() {
          _animatedText += fullText[_textIndex];
          _textIndex++;
        });
        _startTypingAnimation(fullText);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'sandeepio@proton.me',
      query: 'subject=Contact&body=Hello Sandeep,',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      debugPrint('Could not launch $emailUri');
      throw 'Could not launch $emailUri';
    }
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      debugPrint('Could not launch $url');
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller:
          _scrollController, // Assign scrollController to the scroll view
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              SizedBox(
                width: Responsive.isMobile(context)
                    ? Responsive.widthOfScreen(context)
                    : Responsive.widthOfScreen(context) / 2,
                height: Responsive.isMobile(context)
                    ? Responsive.heightOfScreen(context) / 3
                    : Responsive.heightOfScreen(context) - 70,
                child: MouseRegion(
                  onEnter: (_) => setState(() {}),
                  onExit: (_) => setState(() {}),
                  child: AnimatedScale(
                    scale: 1.1,
                    duration: const Duration(milliseconds: 300),
                    child: AnimatedPositioned(
                      duration: const Duration(seconds: 1),
                      top: 0,
                      left: 0,
                      child: Image.asset("lib/assets/me.png"),
                    ),
                  ),
                ),
              ),
              if (Responsive.isMobile(context)) const SizedBox(height: 20),
              const SizedBox(height: 10),
              SizedBox(
                width: Responsive.isMobile(context)
                    ? Responsive.widthOfScreen(context)
                    : Responsive.widthOfScreen(context) / 2,
                height: Responsive.isMobile(context)
                    ? null
                    : Responsive.heightOfScreen(context) - 70,
                child: Center(
                  child: SizedBox(
                    height: Responsive.isMobile(context) ? null : 260,
                    width: Responsive.isMobile(context)
                        ? Responsive.widthOfScreen(context) * 0.85
                        : 450,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 8,
                            spreadRadius: 5,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [Colors.blue, Colors.purple],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FadeTransition(
                              opacity: _opacityAnimation,
                              child: const Text(
                                "Hello!",
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.black,
                                      offset: Offset(5.0, 5.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              _animatedText,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 5.0,
                                    color: Colors.black,
                                    offset: Offset(3.0, 3.0),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed:
                                  _launchEmail, // Call the email launch function
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.orangeAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text("Contact Me"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Add Social Media Links with Hover Effects
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => _launchUrl(
                          'https://www.linkedin.com/in/sandeep-kumar-swain-45128532b?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app'), // LinkedIn URL
                      icon: const FaIcon(FontAwesomeIcons.linkedin,
                          color: Colors.blue, size: 30),
                    ),
                    IconButton(
                      onPressed: () => _launchUrl(
                          'https://www.reddit.com/u/SandeepSwain54/s/zHQy2UJCIJ'), // Reddit URL
                      icon: const FaIcon(FontAwesomeIcons.reddit,
                          color: Colors.blue, size: 30),
                    ),
                    IconButton(
                      onPressed: () => _launchUrl(
                          'https://github.com/sandeepswain54'), // GitHub URL
                      icon: const FaIcon(FontAwesomeIcons.github,
                          color: Colors.blue, size: 30),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
