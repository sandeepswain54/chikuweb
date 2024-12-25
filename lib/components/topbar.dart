import 'package:flutter/material.dart';
import 'package:sandeep_swian/Responsive/responsive.dart';

const primaryColor = Colors.blue; // Define primaryColor

class TopBar extends StatelessWidget {
  final ScrollController scrollController;
  final int scrollDuration = 500; // Define scrollDuration

  const TopBar({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);

    return isMobile
        ? Column(
            children: topBarData(scrollController, context, isMobile: true),
          )
        : Row(
            children: topBarData(scrollController, context),
          );
  }

  List<Widget> topBarData(
      ScrollController scrollController, BuildContext context,
      {bool isMobile = false}) {
    double homePosition = 850.0; // Position of the "About me" section
    double aboutPosition =
        isMobile ? 1650.0 : 500.0; // Position of the "Skills" section
    double networkPosition =
        isMobile ? 2800.0 : 1750.0; // Position above the "Contact me" form
    double connectPosition = scrollController
        .position.maxScrollExtent; // Position of the "Contact me" section

    return [
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 10, vertical: isMobile ? 20 : 0),
        child: ElevatedButton.icon(
          icon: const Icon(Icons.arrow_downward, color: Colors.white),
          label: const Text(
            "⬇️ Scroll Down",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w900),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 10, // Add shadow effect
            minimumSize: Size(200, 50), // Customize button size
            side: BorderSide(color: Colors.white, width: 2),
          ),
          onPressed: () {
            if (isMobile) Navigator.pop(context); // Close drawer on mobile
            print('Scrolling to About me section at position $homePosition');
            scrollController.animateTo(
              homePosition,
              duration: Duration(milliseconds: scrollDuration),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 10, vertical: isMobile ? 20 : 0),
        child: ElevatedButton.icon(
          icon: const Icon(Icons.work, color: Colors.white),
          label: const Text(
            "Skills",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w900),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 10, // Add shadow effect
            minimumSize: Size(200, 50), // Customize button size
            side: BorderSide(color: Colors.white, width: 2),
          ),
          onPressed: () {
            if (isMobile) Navigator.pop(context); // Close drawer on mobile
            print('Scrolling to Skills section at position $aboutPosition');
            scrollController.animateTo(
              aboutPosition,
              duration: Duration(milliseconds: scrollDuration),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 10, vertical: isMobile ? 20 : 0),
        child: ElevatedButton.icon(
          icon: const Icon(Icons.person, color: Colors.white),
          label: const Text(
            "About me",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w900),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 10, // Add shadow effect
            minimumSize: Size(200, 50), // Customize button size
            side: BorderSide(color: Colors.white, width: 2),
          ),
          onPressed: () {
            if (isMobile) Navigator.pop(context); // Close drawer on mobile
            print('Scrolling to About me section at position $homePosition');
            scrollController.animateTo(
              homePosition,
              duration: Duration(milliseconds: scrollDuration),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 10, vertical: isMobile ? 20 : 0),
        child: ElevatedButton.icon(
          icon: const Icon(Icons.link, color: Colors.white),
          label: const Text(
            "Network",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w900),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 10, // Add shadow effect
            minimumSize: Size(200, 50), // Customize button size
            side: BorderSide(color: Colors.white, width: 2),
          ),
          onPressed: () {
            if (isMobile) Navigator.pop(context); // Close drawer on mobile
            print('Scrolling to Network section at position $networkPosition');
            scrollController.animateTo(
              networkPosition,
              duration: Duration(milliseconds: scrollDuration),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 10, vertical: isMobile ? 20 : 0),
        child: ElevatedButton.icon(
          icon: const Icon(Icons.mail, color: Colors.white),
          label: const Text(
            "Contact me",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w900),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 10, // Add shadow effect
            minimumSize: Size(200, 50), // Customize button size
            side: BorderSide(color: Colors.white, width: 2),
          ),
          onPressed: () {
            if (isMobile) Navigator.pop(context); // Close drawer on mobile
            print(
                'Scrolling to Contact me section at position $connectPosition');
            scrollController.animateTo(
              connectPosition,
              duration: Duration(milliseconds: scrollDuration),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
    ];
  }
}
