import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../profil/business_logic/cubit/profil_cubit.dart';
import '../../../service_locator.dart';
import '../../../shared/routes/routes.gr.dart';
import '../../../profil/presentation/widgets/profil_item_widget.dart';

class ProfilListScreen extends StatefulWidget {
  const ProfilListScreen({super.key});

  @override
  State<ProfilListScreen> createState() => _ProfilListScreenState();
}

class _ProfilListScreenState extends State<ProfilListScreen> {
  Future<void> _refresh() async {
    setState(() {
      getIt.get<ProfilCubit>().getProfil();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: BlocBuilder<ProfilCubit, ProfilState>(
          bloc: getIt.get<ProfilCubit>(),
          builder: (context, state) {
            if (state.isLooadingProfil) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      for (int i = 0; i <= 3; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Shimmer.fromColors(
                            baseColor: const Color.fromARGB(255, 236, 234, 234),
                            highlightColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height,
                                    width: 122,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                  ),
                                  const Column(
                                    children: [
                                      Text(
                                        'chargement',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }

            if (state.errorLoadingProfil) {
              return const Center(
                child: Text("An error has occurred"),
              );
            }
            if (state.profils!.isEmpty) {
              return const Center(
                child: Text(
                  'No profils found',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            }

            var profils = state.profils;
            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                itemBuilder: ((context, index) {
                  var profil = profils[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: GestureDetector(
                      onTap: () {
                        context.router.push(DetailProfilRoute(profil: profil));
                      },
                      child: ProfilWidget(
                        profilModel: profil,
                      ),
                    ),
                  );
                }),
                itemCount: profils!.length,
              ),
            );
          },
        ),
      ),
    );
  }
}
