import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:mtb/tab_controller.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(TabControllerX());

  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.getIndex() == 0
              ? myPage(
                  'Dashboard View',
                  Colors.blueGrey,
                )
              : controller.getIndex() == 1
                  ? myPage('Chit Chat', Colors.green)
                  : myPage('Delete', Colors.teal),
        ),
        bottomNavigationBar: MotionTabBar(
          icons: const [
            Icons.dashboard_rounded,
            Icons.voice_chat_rounded,
            Icons.delete_sweep
          ],
          tabIconColor: Colors.orange,
          tabSelectedColor: Colors.deepPurple,
          labels: const ['Dashboard', 'Chit Chat', 'Delete'],
          initialSelectedTab: 'Dashboard',
          textStyle: const TextStyle(
              color: Colors.pink, fontSize: 20.0, fontWeight: FontWeight.bold),
          onTabItemSelected: (int val) => controller.setIndex(val),
        ),
      ),
    );
  }

  myPage(String fashion, Color color) => Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(fashion,
                  style: TextStyle(
                    color: color.computeLuminance() < 0.5
                        ? Colors.black
                        : Colors.pinkAccent,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  )),
            )
          ],
        ),
      );
}
