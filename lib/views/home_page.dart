import 'package:flutter/material.dart';
import 'package:sandeep_swian/Responsive/responsive.dart';
import 'package:sandeep_swian/components/about_me.dart';
import 'package:sandeep_swian/components/contact_form.dart';
import 'package:sandeep_swian/components/drawer.dart';
import 'package:sandeep_swian/components/footer.dart';
import 'package:sandeep_swian/components/prfile_and_intro.dart';
import 'package:sandeep_swian/components/recent_project.dart';
import 'package:sandeep_swian/components/top_skill.dart';
import 'package:sandeep_swian/components/topbar.dart';
import 'package:sandeep_swian/utils/colors.dart';

class DeveloperPortFolio extends StatelessWidget {
  DeveloperPortFolio({super.key});
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Sandeep Swain",
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.w900, color: textColor),
        ),
        backgroundColor: Colors.white,
        elevation: 3,
        toolbarHeight: 70,
        actions: [
          Responsive.isMobile(context)
              ? Padding(
                  padding: EdgeInsets.only(right: 13),
                  child: IconButton(
                    onPressed: () {
                      _globalKey.currentState!.openEndDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: textColor,
                      size: 35,
                    ),
                  ),
                )
              : TopBar(
                  scrollController: _scrollController,
                )
        ],
      ),
      endDrawer: Responsive.isMobile(context)
          ? MyDrawer(
              scrollController: _scrollController,
            )
          : null,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const PrfileAndIntro(),
                const AboutMe(),
                const SizedBox(
                  height: 60,
                ),
                TopSkills(),
                const SizedBox(
                  height: 50,
                ),
                const RecentProject(),
                const SizedBox(
                  height: 50,
                ),
                ContactForm(),
                const SizedBox(
                  height: 50,
                ),
                const Footer(),
              ],
            ),
          )
        ],
      )),
    );
  }
}
