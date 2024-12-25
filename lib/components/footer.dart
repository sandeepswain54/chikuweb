import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            '© Copyright 2025',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontStyle: FontStyle.italic, // Italic style for elegance
            ),
          ),
          const SizedBox(height: 10), // Increased space between text and row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Built with ❤ by",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500, // Slightly bold for emphasis
                  color: Colors.black54,
                ),
              ),
              TextButton(
                onPressed: () {
                  launchUrl(Uri.parse("https://superprofile.bio/sandeepswain"));
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // Remove padding for a cleaner look
                ),
                child: const Text(
                  "Team Sandeep",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent, // Make the link more attractive
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
