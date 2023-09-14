import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/location/business_logic/cubit/location_cubit.dart';

import '../../../service_locator.dart';

class DropdownLocationWidget extends StatefulWidget {
  static String selectedLocation = 'Canal olympia';
  const DropdownLocationWidget({super.key});

  @override
  State<DropdownLocationWidget> createState() => _DropdownLocationWidgetState();
}

class _DropdownLocationWidgetState extends State<DropdownLocationWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: BlocBuilder<LocationCubit, LocationState>(
          bloc: (getIt.get<LocationCubit>().state.locations?.isEmpty ?? true)
              ? getIt.get<LocationCubit>().getLocation()
              : getIt.get<LocationCubit>(),
          builder: (context, state) {
            List<String> locations = [];
            for (var location in state.locations!) {
              locations.add(location.name);
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField(
                  value: DropdownLocationWidget.selectedLocation,
                  items: locations.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      DropdownLocationWidget.selectedLocation = val!;
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
