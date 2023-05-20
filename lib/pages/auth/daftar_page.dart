import 'package:depotkuota/bloc/auth/auth_bloc.dart';
import 'package:depotkuota/pages/auth/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';

import '../../widget/appbar_costume.dart';
import '../../widget/btn_blue.dart';
import '../../widget/textinput_costume.dart';

class DaftarPage extends StatelessWidget {
  DaftarPage({super.key});

  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController hpController = TextEditingController();
  final TextEditingController reffController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarCostume(
        title: "Buat Akun",
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthRegisterSuccess) {
            context.loaderOverlay.hide();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpPage(
                  isRegister: true,
                  email: emailController.text,
                  hp: "62${hpController.text}",
                  nama: namaController.text,
                ),
              ),
            );
          }

          if (state is AuthRegisterFailed) {
            return context.loaderOverlay.hide();
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {}

          if (state is AuthRegisterFailed) {
            return _buildBody(context, true, state.message);
          }

          return _buildBody(context, false, null);
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, bool isNotValid, String? message) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Isi kuota murah dan mudah!",
            style: GoogleFonts.nunito(
              color: const Color(0xff128ED3),
              fontWeight: FontWeight.w700,
              fontSize: 17.sp,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "buat akunmu sekarang",
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w600,
              color: const Color(0xff828282),
            ),
          ),
          const SizedBox(height: 32),
          message != null
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xffD97456).withOpacity(0.50),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text(
                        message,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff79311B),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          message != null ? const SizedBox(height: 16) : const SizedBox(),
          TextInputCostume(
            hint: "Depot Kuota",
            title: "Nama Lengkap",
            controller: namaController,
          ),
          const SizedBox(height: 24),
          TextInputCostume(
            onChanged: () {
              if (hpController.text == "0" || hpController.text == "62") {
                hpController.text = "";
              }
              if (hpController.text.length < 10) {
                BlocProvider.of<AuthBloc>(context).add(const AuthFailedEvent(
                    message: "Nomor handphone minimal 10 angka."));
              } else {
                BlocProvider.of<AuthBloc>(context)
                    .add(const AuthValidEvent(message: "Valid"));
              }
            },
            isNotValid: isNotValid,
            title: "Nomor Handphone",
            controller: hpController,
            hint: "8xx-xxxx-xxxx",
            prefix: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 20,
                child: Center(
                  child: Text(
                    "+62",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      color: const Color(0xff128ED3),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          TextInputCostume(
            controller: emailController,
            title: "E-mail",
            hint: "depotkuota@gmail.com",
          ),
          const SizedBox(height: 24),
          TextInputCostume(
            controller: reffController,
            title: "Kode Referral",
            hint: "masukkan kode referall",
            isButton: true,
          ),
          const SizedBox(height: 32),
          BtnBlue(
            txtBtn: "Daftar",
            onPressed: () {
              if (namaController.text.isEmpty &&
                  emailController.text.isEmpty &&
                  hpController.text.isEmpty) {
                BlocProvider.of<AuthBloc>(context).add(
                    const AuthFailedEvent(message: "Data tidak boleh kosong"));
              } else if (namaController.text.isEmpty) {
                BlocProvider.of<AuthBloc>(context).add(
                    const AuthFailedEvent(message: "Nama tidak boleh kosong"));
              } else if (hpController.text.isEmpty) {
                BlocProvider.of<AuthBloc>(context).add(
                    const AuthFailedEvent(message: "Masukkan nomor handphone"));
              } else {
                context.loaderOverlay.show();
                BlocProvider.of<AuthBloc>(context).add(
                  AuthRegisterEvent(
                    nama: namaController.text,
                    email: emailController.text,
                    hp: "62${hpController.text}",
                    referallcode: reffController.text,
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
