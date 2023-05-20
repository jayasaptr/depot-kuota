import 'package:depotkuota/bloc/auth/auth_bloc.dart';
import 'package:depotkuota/model/auth/login_model.dart';
import 'package:depotkuota/pages/navigation/navigation_page.dart';
import 'package:depotkuota/widget/appbar_costume.dart';
import 'package:depotkuota/widget/btn_blue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:sizer/sizer.dart';

class OtpPage extends StatelessWidget {
  const OtpPage(
      {super.key,
      this.loginModel,
      this.email,
      this.hp,
      this.nama,
      required this.isRegister});

  final LoginModel? loginModel;
  final String? email;
  final String? hp;
  final String? nama;
  final bool isRegister;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarCostume(
        title: "Verifikasi OTP",
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            context.loaderOverlay.show();
          }
          if (state is AuthRegisterFailed) {
            context.loaderOverlay.hide();
          }
          if (state is AuthLoginOtpSuccess) {
            context.loaderOverlay.hide();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const NavigationPage(),
                ),
                (route) => false);
          }
          if (state is AuthRegisterOtpSuccess) {
            context.loaderOverlay.hide();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const NavigationPage(),
                ),
                (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthRegisterFailed) {
            return _buildBody(context, true, null);
          }
          if (state is GetOtpSuccess) {
            return _buildBody(context, false, state.otp);
          }
          return _buildBody(context, false, null);
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, bool isReset, String? otp) {
    return Padding(
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
            clearText: isReset,
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
              context.read<AuthBloc>().add(
                    GetOtpEvent(
                      otp: verificationCode,
                    ),
                  );
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
          otp != null
              ? BtnBlue(
                  txtBtn: "Lanjutkan",
                  onPressed: () {
                    if (isRegister == true) {
                      context.read<AuthBloc>().add(
                            AuthRegisterOtpEvent(
                              email!,
                              nama!,
                              hp: hp!,
                              kode: otp,
                            ),
                          );
                    } else {
                      context.read<AuthBloc>().add(
                            AuthLoginOtpEvent(
                              hp: loginModel!.data.hp,
                              otp: otp,
                            ),
                          );
                    }
                  },
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
