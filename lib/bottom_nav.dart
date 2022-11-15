import 'package:clone_youtubestudio/analytics.dart';
import 'package:clone_youtubestudio/comment.dart';
import 'package:clone_youtubestudio/content.dart';
import 'package:clone_youtubestudio/dashboard.dart';
import 'package:clone_youtubestudio/motinize.dart';
import 'package:flutter/material.dart';

class YoutubeStudioBNB extends StatefulWidget {
  const YoutubeStudioBNB({Key? key}) : super(key: key);

  @override
  State<YoutubeStudioBNB> createState() => _YoutubeStudioBNBState();
}

class _YoutubeStudioBNBState extends State<YoutubeStudioBNB> {
  Widget getWidgets(index) {
    switch (index) {
      case 0:
        return dashboardStudio();
      case 1:
        return contentStudio();
      case 2:
        return analyticsStudio();
      case 3:
        return commentStudio();
      case 4:
        return motinizeStudio();
    }
    return Container();
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int value) {
            setState(() {
              _currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          items: const [
            BottomNavigationBarItem(
                tooltip: "",
                icon: Icon(Icons.dashboard_outlined),
                label: "dashboard"),
            BottomNavigationBarItem(
                tooltip: "", icon: Icon(Icons.content_copy), label: "content"),
            BottomNavigationBarItem(
                tooltip: "",
                icon: Icon(Icons.analytics_outlined),
                label: "analytics"),
            BottomNavigationBarItem(
                tooltip: "",
                icon: Icon(Icons.comment_outlined),
                label: "comment"),
            BottomNavigationBarItem(
                tooltip: "",
                icon: Icon(Icons.attach_money_outlined),
                label: "motinize")
          ]),
      body: getWidgets(_currentIndex),
    );
  }
}
