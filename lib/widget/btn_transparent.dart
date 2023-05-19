import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BtnTransparent extends StatelessWidget {
  const BtnTransparent({
    super.key,
    this.txtBtn,
  });

  final String? txtBtn;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.25,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          side: const BorderSide(
            color: Color(0xff128ED3),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () {},
        child: Text(
          txtBtn ?? "",
          style: GoogleFonts.nunito(
            color: const Color(0xff128ED3),
          ),
        ),
      ),
    );
  }
}
