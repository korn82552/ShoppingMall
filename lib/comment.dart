import 'package:clone_youtubestudio/app__bar.dart';
import 'package:flutter/material.dart';

class commentStudio extends StatefulWidget {
  commentStudio({Key? key}) : super(key: key);

  @override
  State<commentStudio> createState() => _commentStudioState();
}

class _commentStudioState extends State<commentStudio> {
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
            child: Column(children: [
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const Icon(Icons.tune),
                        const SizedBox(
                          width: 15,
                        ),
                        commentChip("Published", Icons.keyboard_arrow_down),
                        const SizedBox(
                          width: 15,
                        ),
                        commentChip(
                            "I haven't responeded", Icons.keyboard_arrow_down),
                        const SizedBox(
                          width: 15,
                        ),
                        commentChip("Search", Icons.keyboard_arrow_down),
                        const SizedBox(
                          width: 15,
                        ),
                        commentChip(
                            "Contains questions", Icons.keyboard_arrow_down),
                        const SizedBox(
                          width: 15,
                        ),
                        commentChip(
                            "Public subscribers", Icons.keyboard_arrow_down),
                        const SizedBox(
                          width: 15,
                        ),
                        commentChip(
                            "Subscribers count", Icons.keyboard_arrow_down),
                      ],
                    ),
                  )),
              const Expanded(flex: 12, child: Text("No comment"))
            ]),
          )
        ],
      )),
    );
  }

  Widget commentChip(String title, IconData icon) => Chip(
      backgroundColor: Colors.black,
      label: Row(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          Icon(
            icon,
            size: 18,
            color: Colors.white,
          )
        ],
      ));
}
