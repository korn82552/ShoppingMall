import 'package:clone_youtubestudio/app__bar.dart';
import 'package:clone_youtubestudio/model/studio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class analyticsStudio extends StatefulWidget {
  @override
  State<analyticsStudio> createState() => _analyticsStudioState();
}

class _analyticsStudioState extends State<analyticsStudio>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
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
                          Text("Overview"),
                          Text("Content"),
                          Text("Audience"),
                        ]),
                  ),
                  Expanded(
                      flex: 12,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          overView(),
                          const Center(
                            child: Text("Content"),
                          ),
                          const Center(
                            child: Text("Audience"),
                          ),
                        ],
                      ))
                ],
              ))
        ],
      )),
    );
  }

  Widget overView() => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 800),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your channel got 15,000 views in last 28 days",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Views"),
                          const Text(
                            "1.6K",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                          const Text(
                            "31% more than previous 28 days",
                            style: TextStyle(color: Colors.green),
                          ),
                          Container(
                            height: 120,
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            child: viewLineChart(),
                          )
                        ]),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Top content",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "Last 28 days.Views",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 200,
                            child: ListView.builder(
                              itemCount: videos.length,
                              itemBuilder: (BuildContext context, int index) {
                                final video = videos[index];
                                return Container(
                                  height: 40,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 80,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/${video.image}"),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const Text(
                                            "Flutter UI D...",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13),
                                          )
                                        ],
                                      ),
                                      Text(video.views.toString())
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ]),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Real Time",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "76",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "Last 28 days.Views",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 200,
                            child: ListView.builder(
                              itemCount: videos.length,
                              itemBuilder: (BuildContext context, int index) {
                                final video = videos[index];
                                return Container(
                                  height: 40,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 80,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/${video.image}"),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const Text(
                                            "Flutter UI D...",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13),
                                          )
                                        ],
                                      ),
                                      Text(video.realTime.toString())
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  Widget viewLineChart() => LineChart(LineChartData(
      minX: 0,
      maxY: 15,
      maxX: 10,
      minY: 0,
      lineBarsData: [
        LineChartBarData(spots: [
          const FlSpot(0, 2),
          const FlSpot(1, 4),
          const FlSpot(2, 3),
          const FlSpot(3, 6),
          const FlSpot(4, 8),
          const FlSpot(5, 5),
          const FlSpot(6, 4),
          const FlSpot(7, 6),
          const FlSpot(8, 3),
          const FlSpot(9, 7),
          const FlSpot(10, 8),
        ], dotData: FlDotData(show: false))
      ],
      gridData: FlGridData(
          show: true, drawHorizontalLine: true, drawVerticalLine: false),
      titlesData: FlTitlesData(
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 30)),
      ),
      borderData: FlBorderData(show: false)));
}
