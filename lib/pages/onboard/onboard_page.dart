import 'package:carousel_slider/carousel_slider.dart';
import 'package:depotkuota/pages/auth/login_page.dart';
import 'package:depotkuota/service/dummy_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _current == 2
          ? InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  LoginPage(),
                    ));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48),
                  color: const Color(0xff128ED3),
                ),
                child: Text(
                  "Mulai",
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w700,
                    fontSize: 17.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : FloatingActionButton(
              onPressed: () {
                setState(() {
                  _controller.nextPage();
                  _current++;
                });
              },
              backgroundColor: const Color(0xff128ED3),
              child: const Icon(Icons.arrow_forward_ios),
            ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo_blue.png',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  height: MediaQuery.of(context).size.height * 0.4,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: carouselOnboard().map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Column(
                        children: [
                          Image.asset(
                            i.image!,
                            width: MediaQuery.of(context).size.width * 0.7,
                          ),
                          const SizedBox(height: 24),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              i.text!,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w700,
                                fontSize: 17.sp,
                                color: const Color(0xff128ED3),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: carouselOnboard().asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: _current == entry.key ? 16.0 : 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : const Color(0xff5BBBF1))
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
