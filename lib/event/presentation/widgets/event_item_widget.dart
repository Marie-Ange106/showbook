import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/auth/business_logic/cubit/auth_cubit.dart';
import 'package:showbook/event/data/models/event_model.dart';

import '../../../shared/utils/app_colors.dart';
import '../../../shared/utils/parse_date.dart';
import '../../../shared/widgets/button_price.dart';

class EventItemWidget extends StatelessWidget {
  final EventModel eventModel;
  const EventItemWidget({
    super.key,
    required this.eventModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        // var user = state.user;
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 130,
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
            child: Row(
              children: [
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 122,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://nvxubcejz.preview.infomaniak.website/storage/${eventModel.pathImage}'),
                          ),
                        ),
                      ),
                    ),
                    if (eventModel.price == null)
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: ButtonPriceWidget(
                          price: 'Free',
                        ),
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ButtonPriceWidget(
                          price: eventModel.price.toString(),
                        ),
                      )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ButtonLikeWidget(eventModel: eventModel, user: user),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: Convertion()
                                      .dateTime(eventModel.startDate),
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                  ),
                                ),
                              ]),
                            ),
                            Text(
                              eventModel.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              eventModel.categories.first.name,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: AppColors.tertiary,
                              size: 14,
                            ),
                            Text(
                              eventModel.location.name,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
