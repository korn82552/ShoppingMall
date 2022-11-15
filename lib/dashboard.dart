import 'package:clone_youtubestudio/model/studio.dart';
import 'package:flutter/material.dart';
import 'app__bar.dart';

class dashboardStudio extends StatefulWidget {
  dashboardStudio({Key? key}) : super(key: key);

  @override
  State<dashboardStudio> createState() => _dashboardStudioState();
}

class _dashboardStudioState extends State<dashboardStudio> {
  List<YoutubeStudio> videos = StudioList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Column(
                children: const [StudioAppbar()],
              )),
          const Divider(
            thickness: 0.3,
          ),
          Expanded(
            flex: 10,
            child: dashboardHeader(),
          )
        ],
      )),
    );
  }

  Widget dashboardHeader() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.yellow,
                          backgroundImage: AssetImage(
                            "assets/noboman.jpg",
                          ),
                          radius: 35,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "NOBOMAN".toUpperCase(),
                              style: const TextStyle(
                                  fontFamily: "CHARCOAL",
                                  fontSize: 30,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Text(
                              "480",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 22),
                            ),
                            const Text(
                              "Total Subscribers",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Channel Analytics",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Last 28 days",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            analyticsCard("Views", "1.6K"),
                            analyticsCard("Watch time(hours)", "46.2")
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Latest publish content",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    )
                  ],
                )),
            Expanded(
              flex: 6,
              child: ListView.builder(
                itemCount: videos.length,
                itemBuilder: (BuildContext context, int index) {
                  final video = videos[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 70,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/${video.image}"))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                      "Flutter UI Practiceing | Flutter S..."),
                                  Text(
                                    "${video.day}",
                                    style: const TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                          const Divider(
                            height: 30,
                            thickness: 0.3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.bar_chart),
                                      Text("${video.views}"),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.thumb_up),
                                          Text("${video.like}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.message_outlined),
                                          Text("${video.comments}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
  Widget analyticsCard(String title, String value) => Container(
        width: MediaQuery.of(context).size.width / 2 - 18,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                value,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )
            ]),
          ),
        ),
      );
}
