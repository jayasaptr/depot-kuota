import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../bloc/home/home_bloc.dart';
import '../../../widget/textfield_costume.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    this.isShowSaldo = false,
    super.key,
  });

  final bool isShowSaldo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: const BoxDecoration(
        color: Color(0xff128ED3),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.35,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/background_header.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/human.png',
                            width: 14.w,
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Hai, Dora!",
                                style: GoogleFonts.nunito(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  context.read<HomeBloc>().add(
                                      HomeShowSaldoEvent(
                                          isShowSaldo: !isShowSaldo));
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      isShowSaldo
                                          ? "Rp1.500.000"
                                          : "Rp ● ● ● ● ● ●",
                                      style: GoogleFonts.nunito(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(width: 9),
                                    isShowSaldo
                                        ? Image.asset(
                                            'assets/icons/eyes_off.png',
                                            width: 8.w,
                                          )
                                        : Image.asset(
                                            'assets/icons/eyes_on.png',
                                            width: 8.w,
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/transfer.png',
                            width: 10.w,
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            'assets/icons/topup.png',
                            width: 10.w,
                          ),
                        ],
                      )
                    ],
                  ),
                  TextfielCostume(
                    hint: "Cari aksesoris hp...",
                    onChanged: () {},
                    suffix: const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.search,
                        color: Color(0xffAFAFAF),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}