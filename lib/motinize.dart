import 'package:clone_youtubestudio/app__bar.dart';
import 'package:flutter/material.dart';

class motinizeStudio extends StatefulWidget {
  motinizeStudio({Key? key}) : super(key: key);

  @override
  State<motinizeStudio> createState() => _motinizeStudioState();
}

class _motinizeStudioState extends State<motinizeStudio> {
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            "Hello NOBOMAN",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Grow with YouTube",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Join the youtube partner programz to earn money.get creator support and more.",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Program Benefits",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          programBenefits(Icons.work_outline, "Monetization",
                              "Earn money from ads and more"),
                          programBenefits(
                              Icons.message_outlined,
                              "Creator Support",
                              "Get support via chat or email"),
                          programBenefits(Icons.copyright_outlined, "Tools",
                              "Access to the Copyright Match Tool")
                        ],
                      )),
                  Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "How to join",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          requirementIndicator(
                              0.5, "480 subscribers", "1000 required"),
                          requirementIndicator(
                              0.1, "380 public watch hours", "4000 required"),
                          Row(
                            children: const [
                              Icon(
                                Icons.check_circle_outline,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "NO Community Guideliness strikes",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.lock_outline,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "2 Step Verification",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ],
                          )
                        ],
                      )),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget programBenefits(IconData icon, String title, String content) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              Text(
                content,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              )
            ],
          )
        ],
      );
  Widget requirementIndicator(double value, String current, String required) =>
      Column(
        children: [
          LinearProgressIndicator(
            value: value,
            backgroundColor: Colors.white,
            color: Colors.indigo,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(current),
              Text(
                required,
                style: const TextStyle(color: Colors.grey),
              )
            ],
          )
        ],
      );
}
