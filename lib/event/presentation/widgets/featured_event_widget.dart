import 'package:flutter/material.dart';
import 'package:showbook/shared/widgets/button_like_widget.dart';

import '../../../shared/widgets/button_price.dart';

class FeaturedEventWidget extends StatelessWidget {
  const FeaturedEventWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 256,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        for (int i = 0; i <= 5; i++)
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Hero(
              tag: i,
              child: GestureDetector(
                // onTap: () {
                //   context.router.push(const DetailEventRoute());
                // },
                child: Container(
                  height: 255,
                  width: 230,
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
                      ), //BoxShadow
                      BoxShadow(
                        color: Color.fromARGB(255, 255, 255, 255),
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 165, 
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: const AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/image.jpg'),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ButtonLikeWidget(),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: 'Tuesday 25 jull',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: '.18:00 GMT',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 10,
                                ),
                              ),
                            ]),
                          ),
                          const Text(
                            'Tayc en concert au Cameroun',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 14,
                            ),
                          ),
                          const Text(
                            'Concert',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: ButtonPriceWidget(price: 'Free',),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
      ]),
    );
  }
}
