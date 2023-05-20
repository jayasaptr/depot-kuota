import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class TextfielCostume extends StatefulWidget {
  const TextfielCostume({
    super.key,
    this.title,
    this.hint,
    this.prefix,
    this.type,
    this.onChanged,
    this.controller,
  });

  final String? title;
  final String? hint;
  final Widget? prefix;
  final TextInputType? type;
  final TextEditingController? controller;
  final VoidCallback? onChanged;

  @override
  State<TextfielCostume> createState() => _TextfielCostumeState();
}

class _TextfielCostumeState extends State<TextfielCostume> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title ?? "",
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: Colors.white,
          ),
        ),
        SizedBox(
          child: TextField(
            controller: widget.controller,
            onChanged: (value) {
              if (widget.onChanged != null) {
                widget.onChanged!();
              }
            },
            keyboardType: widget.type,
            style: GoogleFonts.nunito(
              color: const Color(0xff626262),
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              prefixIcon: widget.prefix != null ? widget.prefix! : null,
              fillColor: Colors.white,
              filled: true,
              hintText: widget.hint ?? "",
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
