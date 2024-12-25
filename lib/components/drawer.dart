import 'package:flutter/material.dart';
import 'package:sandeep_swian/components/topbar.dart';
import 'package:sandeep_swian/utils/colors.dart';

class MyDrawer extends StatelessWidget {
  final ScrollController scrollController;
  const MyDrawer({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: textColor,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: TopBar(scrollController: scrollController),
        ),
      ),
    );
  }
}