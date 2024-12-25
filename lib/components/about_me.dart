import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sandeep_swian/Responsive/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Color(0xFFECEFF1)
          ], // Replace with a valid constant color
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 20 : 80,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Circular Avatar
            CircleAvatar(
              radius: Responsive.isMobile(context) ? 60 : 80,
              backgroundImage: const AssetImage(
                  'assets/profile.jpg'), // Replace with your image path
              backgroundColor: Colors.transparent,
            ),
            

            // Title Section
            const Center(
              child: Text(
                "About Me",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Bio Section
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "I’m Sandeep Kumar Swain, an aspiring entrepreneur passionate about building innovative solutions that address real-world challenges.",
                    style: TextStyle(
                      fontSize: Responsive.isMobile(context) ? 16 : 18,
                      color: Colors.black87,
                      height: 1.6,
                      fontFamily: 'Roboto',
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Through experiences like the IDE Bootcamp at IIM Sambalpur and the IIT Bombay Entrepreneurship Challenge, I’ve gained valuable insights into innovation and networking with industry leaders.",
                    style: TextStyle(
                      fontSize: Responsive.isMobile(context) ? 16 : 18,
                      color: Colors.black87,
                      height: 1.6,
                      fontFamily: 'Roboto',
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Skills Section
            const Text(
              "Skills",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 10),
            _buildSkillRow("App Development", 0.70),
            _buildSkillRow("UI/UX Design", 0.75),
            _buildSkillRow("Entrepreneurship", 0.90),

            const SizedBox(height: 20),

            // Social Media Links
            const Text(
              "Connect with Me",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialIcon(FontAwesomeIcons.linkedin,
                    "https://www.linkedin.com/in/sandeep-kumar-swain-45128532b?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app"),
                const SizedBox(width: 20),
                _buildSocialIcon(FontAwesomeIcons.github,
                    "https://github.com/sandeepswain54"),
                const SizedBox(width: 20),
                _buildSocialIcon(FontAwesomeIcons.twitter,
                    "https://x.com/Sandeepswain54?t=b8AWcZRROPKiRRXTz5pmBw&s=09"),
              ],
            ),
            const SizedBox(height: 20),

            // Call to Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _launchResourcesPDF,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Join Community"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _sendEmail,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Contact Me"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillRow(String skill, double proficiency) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              skill,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: LinearProgressIndicator(
              value: proficiency,
              backgroundColor: Colors.grey.shade300,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () {
        _launchURL(url);
      },
      child: Icon(
        icon,
        size: 30,
        color: Colors.blueAccent,
      ),
    );
  }

  // Function to launch the URL for social media icons
  Future<void> _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function to open email client
  Future<void> _sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'sandeepio@proton.me',
      queryParameters: {
        'subject': 'Hello Sandeep',
        'body': 'I would like to connect with you.',
      },
    );
    // ignore: deprecated_member_use
    if (await canLaunch(emailUri.toString())) {
      // ignore: deprecated_member_use
      await launch(emailUri.toString());
    } else {
      throw 'Could not launch email client';
    }
  }

  // Function to download PDF resources
  Future<void> _launchResourcesPDF() async {
    const String pdfUrl =
        'https://t.me/sandeepswain54'; // Replace with your PDF URL
    // ignore: deprecated_member_use
    if (await canLaunch(pdfUrl)) {
      // ignore: deprecated_member_use
      await launch(pdfUrl);
    } else {
      throw 'Could not launch $pdfUrl';
    }
  }
}
