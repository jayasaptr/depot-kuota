import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class TextfielCostume extends StatelessWidget {
  const TextfielCostume({
    super.key,
    this.title,
    this.hint,
    this.prefix,
    this.type,
  });

  final String? title;
  final String? hint;
  final Widget? prefix;
  final TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 40,
          child: TextField(
            keyboardType: type,
            style: GoogleFonts.nunito(
              color: const Color(0xff626262),
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 10),
              prefixIcon: prefix != null ? prefix! : null,
              fillColor: Colors.white,
              filled: true,
              hintText: hint ?? "",
              hintStyle: GoogleFonts.nunito(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: const Color(0xffAFAFAF),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
