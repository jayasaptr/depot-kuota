import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'btn_transparent.dart';

class TextInputCostume extends StatefulWidget {
  const TextInputCostume({
    super.key,
    this.title,
    this.hint,
    this.prefix,
    this.type,
    this.isButton = false,
    this.isTrue = false,
    this.controller,
    this.isNotValid = false,
    this.onChanged,
  });

  final String? title;
  final String? hint;
  final Widget? prefix;
  final TextInputType? type;
  final bool isButton;
  final bool isTrue;
  final bool isNotValid;
  final TextEditingController? controller;
  final VoidCallback? onChanged;

  @override
  State<TextInputCostume> createState() => _TextInputCostumeState();
}

class _TextInputCostumeState extends State<TextInputCostume> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.title ?? "",
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: const Color(0xff333333),
              ),
            ),
            const SizedBox(width: 8),
            widget.isNotValid
                ? Text(
                    'tidak sesuai format',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: const Color(0xffD97456),
                    ),
                  )
                : widget.isTrue
                    ? Text(
                        'dapat digunakan',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: const Color(0xff56D974),
                        ),
                      )
                    : const SizedBox(),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 41,
                child: TextField(
                  controller: widget.controller,
                  keyboardType: widget.type,
                  style: GoogleFonts.nunito(
                    color: const Color(0xff626262),
                    fontWeight: FontWeight.w600,
                  ),
                  onChanged: (value) {
                    if (widget.onChanged != null) {
                      widget.onChanged!();
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    prefixIcon: widget.prefix != null ? widget.prefix! : null,
                    hintText: widget.hint ?? "",
                    suffixIcon: widget.isNotValid
                        ? Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset(
                              'assets/icons/warning.png',
                            ),
                          )
                        : widget.isTrue
                            ? Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Image.asset(
                                  'assets/icons/check.png',
                                ),
                              )
                            : null,
                    suffixIconConstraints: BoxConstraints(maxHeight: 7.w),
                    hintStyle: GoogleFonts.nunito(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: Color(0xff9A9A9A),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                        color: widget.isNotValid
                            ? const Color(0xffD97456)
                            : widget.isTrue
                                ? const Color(0xff56D974)
                                : const Color(0xff9A9A9A),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: Color(0xff9A9A9A),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            widget.isButton
                ? const Row(
                    children: [
                      SizedBox(width: 8),
                      BtnTransparent(
                        txtBtn: "Cek",
                      )
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ],
    );
  }
}
