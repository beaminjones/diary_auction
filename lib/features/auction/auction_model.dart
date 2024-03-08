class AuctionModel {
  final int id;
  final String name;
  final String deskOne;
  final String date;
  final String time;
  final String auctionHouse;
  final String image;
  final String city;
  final int isOnline;
  final String link;

  const AuctionModel({
    required this.id,
    required this.name,
    required this.deskOne,
    required this.date,
    required this.time,
    required this.auctionHouse,
    required this.image,
    required this.city,
    required this.isOnline,
    required this.link,
  });

  factory AuctionModel.fromJson(Map<String, dynamic> json) {
    return AuctionModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      deskOne: json['desk_one'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      auctionHouse: json['auctionhouse'] ?? '',
      image: json['image'] ?? '',
      city: json['city'] ?? '',
      isOnline: json['is_online'] ?? 0,
      link: json['link'] ?? '',
    );
  }
}
