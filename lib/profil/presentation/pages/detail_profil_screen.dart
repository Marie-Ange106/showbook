import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:showbook/event/presentation/pages/coming_event_profil.dart';
import 'package:showbook/event/presentation/pages/past_event_profil_screen.dart';
import 'package:showbook/shared/utils/app_colors.dart';
import 'package:showbook/shared/widgets/button_widget.dart';

import '../../data/models/profil_model.dart';

@RoutePage()
class DetailProfilScreen extends StatefulWidget {
  final ProfilModel profil;

  const DetailProfilScreen({
    Key? key,
    required this.profil,
  }) : super(key: key);

  @override
  State<DetailProfilScreen> createState() => _DetailProfilScreenState();
}

class _DetailProfilScreenState extends State<DetailProfilScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool _isExpanded = false;
  bool isOpend = false;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  void urlLauncher(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Impossible d\'ouvrir l\'URL $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'detail_profil',
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '${widget.profil.name} detail',
            ),
            actions: [
              PopupMenuButton(
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'partager',
                    child: Row(
                      children: [
                        Icon(Icons.share),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Partager'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Booker',
                    child: Row(
                      children: [
                        Icon(Icons.contact_phone),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Contacter'),
                      ],
                    ),
                  ),
                ],
                onSelected: (String value) {
                  // Faire quelque chose lorsque l'un des éléments est sélectionné
                },
                icon: const Icon(Icons.more_vert),
              ),
            ],
            backgroundColor: AppColors.tertiary,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // header

                Column(
                  children: [
                    Stack(
                      // alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 100,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                            ),
                            color: AppColors.tertiary,
                          ),
                        ),
                        Container(
                          height: 130,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 102,
                                    width: 102,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      // color: Colors.amber,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        'http://192.168.100.140:8000/storage/${widget.profil.imagePath}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Column(
                                  children: [
                                    Text(
                                      widget.profil.follower.toString(),
                                      style: const TextStyle(
                                        color: AppColors.white,
                                      ),
                                    ),
                                    const Text(
                                      'Followers',
                                      style: TextStyle(
                                        color: AppColors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Column(
                                  children: [
                                    Text(
                                      '10',
                                      style: TextStyle(
                                        color: AppColors.white,
                                      ),
                                    ),
                                    Text(
                                      'Coming event',
                                      style: TextStyle(
                                        color: AppColors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.profil.name,
                                maxLines: 1,
                                softWrap: true,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const ButtonWidget(
                          borderColor: AppColors.secondary,
                          text: 'Contact',
                          textColor: AppColors.secondary,
                          height: 34,
                          width: 115,
                          fontSize: 12,
                        ),
                        const ButtonWidget(
                          borderColor: AppColors.primary,
                          bgColor: AppColors.primary,
                          text: 'Follow',
                          textColor: AppColors.white,
                          height: 34,
                          width: 115,
                          fontSize: 12,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),

                Column(
                  children: [
                    // description or biography
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Biography',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Text(
                          //   widget.profil.biography,
                          //   style: const TextStyle(
                          //     fontSize: 12,
                          //   ),
                          // )
                          Text(
                            widget.profil.biography,
                            maxLines: _isExpanded ? null : 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (!_isExpanded)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isExpanded = true;
                                });
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Voir plus",
                                  style: TextStyle(
                                    //*************************************************** */
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          if (_isExpanded)
                            Text(
                              widget.profil.biography,
                            ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isExpanded = false;
                              });
                            },
                            child: !_isExpanded
                                ? Container()
                                : const Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Voir moins",
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    // events
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 15, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Events',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          TabBar(
                            controller: _tabController,
                            indicatorColor: AppColors.primary,
                            automaticIndicatorColorAdjustment: false,
                            labelColor: AppColors.primary,
                            labelPadding: const EdgeInsets.only(top: 10),
                            tabs: const [
                              Text('Coming'),
                              Text('Past'),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 100,
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    Coming(profilModel: widget.profil),
                                    PastEventProfilScreen(
                                        profilModel: widget.profil)
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //  account **************
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Other accounts',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    //urlLauncher(widget.profil.instagram!);
                                    await _launchInBrowser(
                                      Uri.parse(widget.profil.instagram!),
                                    );
                                  },
                                  child: const Image(
                                    image: AssetImage(
                                        'assets/images/instagram.jpeg'),
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    //urlLauncher(widget.profil.facebook!);
                                    await _launchInBrowser(
                                      Uri.parse(widget.profil.facebook!),
                                    );
                                  },
                                  child: const Image(
                                    image: AssetImage(
                                        'assets/images/facebook.png'),
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    //urlLauncher(widget.profil.twitter!);
                                    await _launchInBrowser(
                                      Uri.parse(widget.profil.twitter!),
                                    );
                                  },
                                  child: const Image(
                                    image:
                                        AssetImage('assets/images/twitter.png'),
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
