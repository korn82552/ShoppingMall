import 'package:clone_youtubestudio/model/studio.dart';
import 'package:flutter/material.dart';

import 'app__bar.dart';

class contentStudio extends StatefulWidget {
  contentStudio({Key? key}) : super(key: key);

  @override
  State<contentStudio> createState() => _contentStudioState();
}

class _contentStudioState extends State<contentStudio>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 4, vsync: this);
  List<YoutubeStudio> videos = StudioList;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Column(
                children: const [
                  StudioAppbar(),
                  Divider(
                    thickness: 0.3,
                  )
                ],
              )),
          const Divider(
            thickness: 0.3,
          ),
          Expanded(
              flex: 10,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.red,
                        controller: _tabController,
                        tabs: const [
                          Text("video"),
                          Text("shorts"),
                          Text("live"),
                          Text("playlist"),
                        ]),
                  ),
                  Expanded(
                      flex: 12,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          videoContent(),
                          const Center(
                            child: Text("shorts"),
                          ),
                          const Center(
                            child: Text("live"),
                          ),
                          const Center(
                            child: Text("playlist"),
                          ),
                        ],
                      ))
                ],
              ))
        ],
      )),
    );
  }

  Widget videoContent() => Column(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const Icon(Icons.tune),
                    const SizedBox(
                      width: 15,
                    ),
                    contentChip("Sort by", Icons.keyboard_arrow_down),
                    const SizedBox(
                      width: 15,
                    ),
                    contentChip("Visibility", Icons.keyboard_arrow_down),
                    const SizedBox(
                      width: 15,
                    ),
                    contentChip("Views", Icons.keyboard_arrow_down),
                    const SizedBox(
                      width: 15,
                    ),
                    contentChip("Restictions", Icons.keyboard_arrow_down),
                  ],
                ),
              )),
          Expanded(
            flex: 12,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: ListView.builder(
                itemCount: videos.length,
                itemBuilder: (BuildContext context, int index) {
                  final video = videos[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        height: 90,
                        width: 140,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/${video.image}"),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Flutter Ui Practicing | Flutter SQL Lite database...",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "${video.views.toString()} views",
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  video.day,
                                  style: const TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.public,
                                          color: Colors.grey,
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
                                            const Icon(Icons.thumb_up,
                                                color: Colors.grey),
                                            Text(
                                              "${video.like}",
                                              style: const TextStyle(
                                                  color: Colors.grey),
                                            ),
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
                                            const Icon(Icons.message_outlined,
                                                color: Colors.grey),
                                            Text(
                                              "${video.comments}",
                                              style: const TextStyle(
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Icon(Icons.keyboard_arrow_down,
                                    color: Colors.grey)
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.more_vert,
                        size: 18,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      );

  Widget contentChip(String title, IconData icon) => Chip(
      backgroundColor: Colors.grey.shade200,
      label: Row(
        children: [
          Text(title),
          Icon(
            icon,
            size: 18,
          )
        ],
      ));
}
