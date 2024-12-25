import 'package:flutter/material.dart';
import 'package:sandeep_swian/Responsive/responsive.dart';
import 'package:sandeep_swian/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart'; // For URL redirection

class TopSkills extends StatelessWidget {
  const TopSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "My Skills",
          style: TextStyle(
            fontSize: 30, // Larger font size for better visibility
            fontWeight: FontWeight.bold,
            color: Colors.black87, // Darker color for better contrast
          ),
        ),
        const SizedBox(height: 20), // Added more space between title and content
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.isMobile(context)
                ? 15
                : Responsive.widthOfScreen(context) / 4,
          ),
          child: const Wrap(
            children: [
              SkillCard(
                url:
                    'https://cdn.iconscout.com/icon/free/png-256/flutter-2038877-1720090.png',
                redirectUrl: 'https://flutter.dev', // Redirect URL added here
              ),
              SkillCard(
                url:
                    'https://avatars.githubusercontent.com/u/1609975?s=280&v=4',
                redirectUrl: 'https://dart.dev/', // Add URL
              ),
              SkillCard(
                  url:
                      'https://miro.medium.com/v2/resize:fit:300/1*R4c8lHBHuH5qyqOtZb3h-w.png',
                  redirectUrl:
                      'https://firebase.google.com/?gad_source=1&gclid=EAIaIQobChMI5qfEkPS_igMVjA2DAx0HaB01EAAYASAAEgI4_PD_BwE&gclsrc=aw.ds'), // Add URL
              SkillCard(
                  url:
                      'https://cdn-icons-png.flaticon.com/512/1493/1493169.png',
                  redirectUrl:
                      'https://en.wikipedia.org/wiki/API#:~:text=An%20application%20programming%20interface%20(API,to%20other%20pieces%20of%20software.'), // Add URL
              SkillCard(
                  url:
                      'https://images.g2crowd.com/uploads/product/image/social_landscape/social_landscape_fdd66f2658ccba01e8717fedb2db4222/flutterflow.png',
                  redirectUrl: 'https://www.flutterflow.io/'), // Add URL
              SkillCard(
                  url:
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/GitHub_Invertocat_Logo.svg/180px-GitHub_Invertocat_Logo.svg.png',
                  redirectUrl: 'https://github.com'), // Add URL
              SkillCard(
                  url:
                      'https://1.bp.blogspot.com/-LgTa-xDiknI/X4EflN56boI/AAAAAAAAPuk/24YyKnqiGkwRS9-_9suPKkfsAwO4wHYEgCLcBGAsYHQ/s0/image9.png',
                  redirectUrl:
                      'https://developer.android.com/studio?gad_source=1&gclid=EAIaIQobChMIycbKuvS_igMVmalmAh0UkDF-EAAYASAAEgKh4vD_BwE&gclsrc=aw.ds'), // Add URL
              SkillCard(
                  url:
                      'https://i1.wp.com/qavalidation.com/wp-content/uploads/2018/02/python-logo.png',
                  redirectUrl: 'https://www.python.org'), // Add URL
              SkillCard(
                  url:
                      'https://static.vecteezy.com/system/resources/previews/022/227/370/original/openai-chatgpt-logo-icon-free-png.png',
                  redirectUrl: 'https://openai.com'), // Add URL
            ],
          ),
        ),
        // Resources Button to download PDF
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GestureDetector(
            onTap: _downloadResources,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Join Community',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        // Contact Button
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GestureDetector(
            onTap: _sendEmail,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Contact Me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Send email on tap
  Future<void> _sendEmail() async {
    final emailUrl = Uri(
      scheme: 'mailto',
      path: 'sandeepio@proton.me',
      query: Uri.encodeFull('Subject=Hello Sandeep'),
    );
    if (await canLaunch(emailUrl.toString())) {
      await launch(emailUrl.toString());
    } else {
      throw 'Could not open email client';
    }
  }

  // Download resources PDF
  Future<void> _downloadResources() async {
    final pdfUrl = 'https://t.me/sandeepswain54'; // Replace with your URL
    if (await canLaunch(pdfUrl)) {
      await launch(pdfUrl);
    } else {
      throw 'Could not download resources';
    }
  }
}

class SkillCard extends StatefulWidget {
  final String url;
  final String redirectUrl; // URL to redirect to when clicked
  const SkillCard({super.key, required this.url, required this.redirectUrl});

  @override
  _SkillCardState createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _isHovered = false;

  Future<void> _launchURL() async {
    if (await canLaunch(widget.redirectUrl)) {
      await launch(widget.redirectUrl);
    } else {
      throw 'Could not launch ${widget.redirectUrl}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovered = true; // Hover effect on mouse enter
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false; // Reset hover effect on mouse exit
          });
        },
        child: GestureDetector(
          onTap: _launchURL,
          child: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: Colors.blue.shade200,
                        blurRadius: 15,
                        spreadRadius: 6,
                      ),
                    ]
                  : const [
                      BoxShadow(
                        color: shadoColor,
                        blurRadius: 10,
                        spreadRadius: 6,
                      ),
                    ],
              borderRadius: BorderRadius.circular(15),
              gradient: _isHovered
                  ? LinearGradient(
                      colors: [
                        Colors.blueAccent.shade400,
                        Colors.purpleAccent.shade400
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : LinearGradient(
                      colors: [
                        Colors.blueAccent.shade100,
                        Colors.purpleAccent.shade200
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
            ),
            child: SizedBox(
              height: !Responsive.isMobile(context)
                  ? Responsive.widthOfScreen(context) / 7
                  : 100,
              width: !Responsive.isMobile(context)
                  ? Responsive.widthOfScreen(context) / 7
                  : 100,
              child: Padding(
                padding: Responsive.isMobile(context)
                    ? const EdgeInsets.all(10)
                    : const EdgeInsets.all(25),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.url,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
