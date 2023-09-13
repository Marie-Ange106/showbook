import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/profil/business_logic/cubit/profil_cubit.dart';

import '../../../service_locator.dart';

class DropdownProfilWidget extends StatefulWidget {
  const DropdownProfilWidget({super.key});

  @override
  State<DropdownProfilWidget> createState() => _DropdownProfilWidgetState();
}

class _DropdownProfilWidgetState extends State<DropdownProfilWidget> {
  String _selectedOption = 'Concert';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: BlocBuilder<ProfilCubit, ProfilState>(
          bloc: (getIt.get<ProfilCubit>().state.profils?.isEmpty ?? true)
              ? getIt.get<ProfilCubit>().getProfil()
              : getIt.get<ProfilCubit>(),
          builder: (context, state) {
            // List<String> profils = [];
            // for (var profil in state.profils!) {
            //   profils.add(profil.name);
            // }
            var profils = state.profils;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField(
                  value: _selectedOption,
                  items: profils!.map((e) {
                    return DropdownMenuItem(
                      value: "${e.name}_${e.id}",
                      child: Text(e.name),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedOption = val!;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 254, 2, 2),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
