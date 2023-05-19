import 'package:depotkuota/widget/appbar_costume.dart';
import 'package:depotkuota/widget/btn_blue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:sizer/sizer.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarCostume(
        title: "Verifikasi OTP",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Masukkan kode OTP",
              style: GoogleFonts.nunito(
                color: const Color(0xff128ED3),
                fontWeight: FontWeight.w700,
                fontSize: 17.sp,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "periksa pesan WhatsAppmu",
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w600,
                color: const Color(0xff828282),
              ),
            ),
            const SizedBox(height: 32),
            OtpTextField(
              textStyle: GoogleFonts.nunito(
                fontWeight: FontWeight.w700,
                color: const Color(0xff128ED3),
              ),
              enabledBorderColor: const Color(0xff9A9A9A),
              focusedBorderColor: const Color(0xff128ED3),
              fillColor: const Color(0xff2CA8ED),
              numberOfFields: 6,
              borderColor: const Color(0xff2CA8ED),
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              }, // end onSubmit
            ),
            const SizedBox(height: 16),
            Center(
              child: OtpTimerButton(
                loadingIndicator: const CircularProgressIndicator(
                  color: Color(0xff128ED3),
                ),
                height: 60,
                onPressed: () {},
                text: Text(
                  "Kirim ulang",
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                buttonType: ButtonType.text_button,
                backgroundColor: const Color(0xff128ED3),
                duration: 120,
              ),
            ),
            const Spacer(),
            BtnBlue(
              txtBtn: "Lanjutkan",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
