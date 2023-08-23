import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/home/business_logic/cubit/profil_cubit.dart';
import 'package:showbook/service_locator.dart';
import 'package:showbook/shared/routes/routes.gr.dart';
import 'package:showbook/shared/widgets/profil_item_widget.dart';

class ProfilListScreen extends StatefulWidget {
  const ProfilListScreen({super.key});

  @override
  State<ProfilListScreen> createState() => _ProfilListScreenState();
}

class _ProfilListScreenState extends State<ProfilListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: BlocBuilder<ProfilCubit, ProfilState>(
          bloc: getIt.get<ProfilCubit>(),
          builder: (context, state) {
            if (state.isLooadingProfil) {
              return const Center(
                child: CircularProgressIndicator(),
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
            return ListView.builder(
              itemBuilder: ((context, index) {
                var profil = profils[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () {
                      context.router.push(DetailProfilRoute(profil: profil));
                    },
                    child: ProfilWidget(
                      imagePath:
                          'http://192.168.149.229:8000/storage/${profil.imagePath}',
                      typeProfil: 'type',
                      profilName: profil.name,
                      follower: '${profil.follower.toString()} Followers',
                    ),
                  ),
                );
              }),
              itemCount: profils!.length,
            );
          },
        ),
      ),
    );
  }
}
