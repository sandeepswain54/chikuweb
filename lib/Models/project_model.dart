class ProjectModel {
  final String imgURL;
  final String projectName;
  final String? description;

  ProjectModel({
    required this.imgURL,
    required this.projectName,
    this.description,
  });
}
// this is the mode that i have already created.
List<ProjectModel> projects = [
  ProjectModel(
    description:
        "I was honored to receive the Best Pitch Award at the Innovation, Design, and Entrepreneurship (IDE) Bootcamp held at IIM Sambalpur. This recognition provided an incredible opportunity to expand my network, collaborate with inspiring individuals, and explore innovative ideas",
    imgURL: 'lib/assets/price.jpg',
    projectName: 'Best Pitch',
  ),
  ProjectModel(
    description:
        "I recently met Anurag Batra, Chairman and Editor-in-Chief of Businessworld. He is a serial entrepreneur who has founded and led various media and technology companies.",
    imgURL: 'lib/assets/anurag2.jpg',
    projectName: 'Connection',
  ),
  ProjectModel(
    description:
        "My first pitch to an angel investor at Silicon University, showcasing my social networking platform that connects people, encourages collaboration, and offers a unique user experience with potential for growth.",
    imgURL: 'lib/assets/st11.jpg',
    projectName: 'Angel Investor Pitch',
  ),
  ProjectModel(
    description:
        "Speaking at Utkal University about the growing threat of cybercrime, stressing the importance of online security and simple precautions like strong passwords and avoiding phishing attacks.",
    imgURL: 'lib/assets/cyber11.jpg',
    projectName: 'Cyber Crime',
  ),
  ProjectModel(
    description:
        "I recently had the chance to be a guest on a podcast with Dyan, a content creator, sponsored by TIE Bangalore, Startup Mahakumbh, and CSR Partner GRST. During the podcast, I shared my entrepreneurial journey and thoughts on startup growth and innovation.",
    imgURL: 'lib/assets/tt.jpg',
    projectName: 'Podcast',
  ),
];