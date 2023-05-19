import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarCostume extends StatefulWidget implements PreferredSizeWidget {
  const AppbarCostume({
    super.key,
    this.title,
    this.height = kToolbarHeight,
  });
  final String? title;

  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  State<AppbarCostume> createState() => _AppbarCostumeState();
}

class _AppbarCostumeState extends State<AppbarCostume> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xff128ED3),
      centerTitle: true,
      title: Text(
        widget.title ?? "",
        style: GoogleFonts.nunito(
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}
