import 'package:depotkuota/bloc/home/home_bloc.dart';
import 'package:depotkuota/bloc/home_data/home_data_bloc.dart';
import 'package:depotkuota/pages/home/widget/header_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeDataBloc>().add(GetProductHomeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // BlocBuilder<HomeBloc, HomeState>(
          //   builder: (context, state) {
          //     if (state is HomeShowSaldoState) {
          //       return HeaderHome(
          //         isShowSaldo: state.isShowSaldo,
          //       );
          //     }
          //     return const HeaderHome(
          //       isShowSaldo: false,
          //     );
          //   },
          // ),
          BlocSelector<HomeBloc, HomeState, bool>(
            selector: (state) {
              if (state is HomeShowSaldoState) {
                return state.isShowSaldo;
              }
              return false;
            },
            builder: (context, state) {
              return HeaderHome(
                isShowSaldo: state,
              );
            },
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mau beli apa?",
                  style: GoogleFonts.nunito(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: BlocBuilder<HomeDataBloc, HomeDataState>(
                    builder: (context, state) {
                      if (state is HomeDataSuccessState) {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state
                              .listHomeModel.data!.list![0].listType!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            mainAxisExtent: 140,
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: const Color(0xffDCE8FA),
                                      width: 2,
                                    ),
                                  ),
                                  child: Image.network(state.listHomeModel.data!
                                      .list![0].listType![index].imgMenu!),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  state.listHomeModel.data!.list![0]
                                      .listType![index].nama!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      }
                      if (state is HomeLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is HomeErrorState) {
                        return const Center(
                          child: Text("Error"),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
