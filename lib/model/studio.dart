class YoutubeStudio {
  String image, day;
  int views, like, comments, realTime;

  YoutubeStudio(
      {required this.image,
      required this.day,
      required this.views,
      required this.like,
      required this.comments,
      required this.realTime});
}

final StudioList = [
  YoutubeStudio(
      image: "meals.png",
      day: "15 days",
      views: 183,
      like: 15,
      comments: 2,
      realTime: 14),
  YoutubeStudio(
      image: "cool_drinks.png",
      day: "4 days",
      views: 203,
      like: 30,
      comments: 3,
      realTime: 18),
  YoutubeStudio(
      image: "house_hold.png",
      day: "7 days",
      views: 195,
      like: 10,
      comments: 5,
      realTime: 5),
  YoutubeStudio(
      image: "shoes_ui.png",
      day: "8 days",
      views: 500,
      like: 30,
      comments: 20,
      realTime: 65),
];
