class GarbaCategory {
  final String category;
  final String albumPoster;
  final List<Video> videos;

  GarbaCategory({required this.category, required this.albumPoster, required this.videos});

  factory GarbaCategory.fromJson(Map<String, dynamic> json) {
    return GarbaCategory(
      category: json['category'],
      albumPoster: json['albumPoster'],
      videos: (json['videos'] as List).map((i) => Video.fromJson(i)).toList(),
    );
  }
}

class Video {
  final String name;
  final String artist;
  final String link;

  Video({required this.name, required this.link, required this.artist});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      name: json['name'],
      link: json['link'],
      artist: json['artist'] ?? "",
    );
  }
}