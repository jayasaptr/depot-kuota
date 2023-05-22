import 'package:depotkuota/bloc/navigation/navigation_cubit.dart';
import 'package:depotkuota/pages/history/history_page.dart';
import 'package:depotkuota/pages/home/home_page.dart';
import 'package:depotkuota/pages/notifikasi/notifikasi_page.dart';
import 'package:depotkuota/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: _buildBody(context, state),
          bottomNavigationBar: Container(
            height: MediaQuery.of(context).size.height * 0.12,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff7C7B7B).withOpacity(0.20),
                  spreadRadius: 0,
                  blurRadius: 8,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: BottomNavigationBar(
                showUnselectedLabels: false,
                showSelectedLabels: false,
                onTap: (index) {
                  context.read<NavigationCubit>().changeIndex(index);
                },
                currentIndex: state,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: const Color(0xff2184DB),
                unselectedItemColor: const Color(0xffBDBDBD),
                items: [
                  BottomNavigationBarItem(
                    activeIcon: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff128ED3),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          'assets/icons/home.png',
                          color: Colors.white,
                          width: 8.w,
                        ),
                      ),
                    ),
                    icon: Image.asset(
                      'assets/icons/home.png',
                      color: const Color(0xffC5C5C5),
                      width: 8.w,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff128ED3),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          'assets/icons/history.png',
                          color: Colors.white,
                          width: 8.w,
                        ),
                      ),
                    ),
                    icon: Image.asset(
                      'assets/icons/history.png',
                      color: const Color(0xffC5C5C5),
                      width: 8.w,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff128ED3),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          'assets/icons/notifikasi.png',
                          width: 8.w,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    icon: Image.asset(
                      'assets/icons/notifikasi.png',
                      color: const Color(0xffC5C5C5),
                      width: 8.w,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff128ED3),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          'assets/icons/profile.png',
                          width: 8.w,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    icon: Image.asset(
                      'assets/icons/profile.png',
                      color: const Color(0xffC5C5C5),
                      width: 8.w,
                    ),
                    label: '',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, state) {
    switch (state) {
      case 0:
        return const HomePage();
      case 1:
        return const HistoryPage();
      case 2:
        return const NotifikasiPage();
      case 3:
        return const Profilepage();
    }

    return const HomePage();
  }
}
