import 'package:flutter/material.dart';
import 'package:sandeep_swian/Models/project_model.dart';
import 'package:sandeep_swian/Responsive/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class RecentProject extends StatelessWidget {
  const RecentProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Some of My Recent Meetups",
          style: TextStyle(
            fontSize: 30, // Increased font size for prominence
            fontWeight: FontWeight.bold,
            color: Colors.black87, // Slightly darker color for better contrast
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          children: [
            ProjectCard(
              projectModel: projects[0],
              url: "https://www.linkedin.com/posts/sandeep-kumar-swain-45128532b_winner-at-ide-bootcamp-indian-institute-activity-7245498648413806592-H_mJ?utm_source=share&utm_medium=member_android",
            ),
            ProjectCard(
              projectModel: projects[1],
              url: "https://www.instagram.com/share/p/_jOCiSv7d",
            ),
            ProjectCard(
              projectModel: projects[2],
              url: "https://x.com/Sandeepswain54/status/1864510098359656734?t=ZHd2scAOAi9ZKMEwEt-seg&s=19",
            ),
            ProjectCard(
              projectModel: projects[3],
              url: "https://x.com/Sandeepswain54?t=TnJzMk7TMITo2UKTEluztQ&s=09",
            ),
            ProjectCard(
              projectModel: projects[4],
              url: "https://www.instagram.com/share/reel/BAJBpPMqTz",
            ),
          ],
        )
      ],
    );
  }
}

class ProjectCard extends StatelessWidget {
  final ProjectModel projectModel;
  final String url;
  const ProjectCard({super.key, required this.projectModel, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              spreadRadius: 5,
            ),
          ],
          borderRadius: BorderRadius.circular(15), // Increased radius for more rounded corners
          gradient: LinearGradient(
            colors: [Colors.blueAccent.shade200, Colors.purpleAccent.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SizedBox(
          width: Responsive.isMobile(context)
              ? Responsive.widthOfScreen(context) * 0.9
              : Responsive.widthOfScreen(context) / 4,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    projectModel.imgURL,
                    fit: BoxFit.cover, // Ensuring the image fits well inside the box
                  ),
                ),
              ),
              Text(
                projectModel.projectName,
                style: const TextStyle(
                  fontSize: 23, // Slightly increased font size
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White color for contrast
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  projectModel.description!,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70, // Slightly lighter text color
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 10,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    launchUrl(Uri.parse(url));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber, // Changed to a more vibrant color
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded corners for the button
                    ),
                    shadowColor: Colors.black26,
                    elevation: 5,
                  ),
                  child: const Text(
                    "Check It Out",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
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
