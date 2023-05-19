import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class BtnBlue extends StatelessWidget {
  const BtnBlue({
    super.key, this.txtBtn, this.onPressed,
  });

  final String? txtBtn;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color(0xff128ED3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          txtBtn ?? "",
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
