// ignore_for_file: unused_label

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return AppBar(
      key: scaffoldKey,
      leading: IconButton(
          icon: Image.asset(
            'assets/icons/menu.png',
            color: Colors.white,
            width: 25,
          ),
          // icon:  Icon(
          //   'assets',
          //   // FontAwesomeIcons.alignLeft,
          //   color: Colors.black87,
          // ),
          splashRadius: 20,
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
            tooltip:
            MaterialLocalizations.of(context).openAppDrawerTooltip;
            // ZoomDrawer.of(context)!.toggle();
          }),
      title: RichText(
        text: TextSpan(
            text: "SMART",
            style: GoogleFonts.solway(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: " HRM",
                style: GoogleFonts.solway(
                    fontSize: 17,
                    color: const Color(0xFFED0A72),
                    fontWeight: FontWeight.bold),
              )
            ]),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {},
              splashRadius: 20,
              icon: const Icon(
                Icons.notifications,
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
      backgroundColor: Colors.blue,
      elevation: 8,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
