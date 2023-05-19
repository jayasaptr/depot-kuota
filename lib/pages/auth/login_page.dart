import 'package:depotkuota/pages/auth/daftar_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../widget/textfield_costume.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Positioned.fill(
            top: 150,
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/logo_blue.png',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.62,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(48),
                  topRight: Radius.circular(48),
                ),
                color: const Color(0xff128ED3).withOpacity(0.8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      Text(
                        "Selamat Datang di",
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w600,
                          fontSize: 17.sp,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Depot Kuota",
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700,
                          fontSize: 28.sp,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 29),
                      TextfielCostume(
                        type: TextInputType.number,
                        title: "Nomor Handphone",
                        hint: "8xx-xxxx-xxxx",
                        prefix: Padding(
                          padding: const EdgeInsets.only(top: 11, left: 15),
                          child: Text(
                            "+62",
                            style: GoogleFonts.nunito(
                                color: const Color(0xff128ED3),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(height: 29),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(48),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Masuk",
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff128ED3),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: Text(
                          "atau",
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DaftarPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Daftar",
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 16.sp,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
