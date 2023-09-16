import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:showbook/profil/business_logic/cubit/profil_cubit.dart';
import 'package:showbook/service_locator.dart';
import 'package:showbook/shared/routes/routes.gr.dart';

import '../../../shared/utils/app_colors.dart';
import '../../../shared/widgets/button_widget.dart';

class ArtistItemWidget extends StatelessWidget {
  const ArtistItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilCubit, ProfilState>(
      bloc: getIt.get<ProfilCubit>()..getProfil(),
      builder: (context, state) {
        if (state.isLooadingProfil) {
          return Container(
            height: 180,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (int i = 0; i <= 4; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        height: 170,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                height: 10,
                                width: 20,
                                color: AppColors.white,
                              ),
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                height: 10,
                                width: 40,
                                color: AppColors.white,
                              ),
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                height: 20,
                                width: 40,
                                color: const Color.fromARGB(255, 208, 88, 88),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        }

        if (state.errorLoadingProfil) {
          return Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  getIt.get<ProfilCubit>().getProfil();
                },
                child: const Center(
                  child: Text('Try again'),
                ),
              ),
              Text('${state.message}')
            ],
          );
        }

        var profils = state.profils!;

        return SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var profil = profils[index];
              return GestureDetector(
                onTap: () {
                  context.router.push(DetailProfilRoute(profil: profil));
                },
                child: Hero(
                  tag: profil,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Container(
                          height: 170,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(35, 128, 129, 128),
                                offset: Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ),
                              BoxShadow(
                                color: Color.fromARGB(255, 255, 255, 255),
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'http://192.168.28.229:8000/storage/${profil.imagePath}',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 170,
                          width: 160,
                          decoration: BoxDecoration(
                            color: AppColors.secondary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  profil.name,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                      color: AppColors.white),
                                ),
                                Text(
                                  '${profil.follower} Followers',
                                  style: const TextStyle(
                                      // fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                      color: AppColors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ButtonWidget(
                                  borderColor: AppColors.primary,
                                  bgColor: AppColors.primary,
                                  height: 30,
                                  width: 100,
                                  text: 'Follow',
                                  textColor: AppColors.white,
                                  fontSize: 12,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: profils.length,
          ),
        );
      },
    );
  }
}
