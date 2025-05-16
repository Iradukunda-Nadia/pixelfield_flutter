class Bottle {
  final String id;
  final String name;
  final int year;
  final int bottleNumber;
  final int total;
  final String image;
  final String distillery;
  final String region;
  final String country;
  final String type;
  final int age;
  final String filled;
  final int caskNumber;
  final String abv;
  final String date;
  final String size;
  final String finish;
  final String notes;
  final String history;
  final List<String> flavours;

  Bottle({
    required this.id,
    required this.name,
    required this.year,
    required this.bottleNumber,
    required this.total,
    required this.image,
    required this.distillery,
    required this.region,
    required this.country,
    required this.type,
    required this.age,
    required this.filled,
    required this.caskNumber,
    required this.abv,
    required this.date,
    required this.size,
    required this.finish,
    required this.notes,
    required this.history,
    required this.flavours,
  });

  factory Bottle.fromJson(Map<String, dynamic> json) => Bottle(
    id: json['id'],
    name: json['name'],
    year: json['year'],
    bottleNumber: json['bottleNumber']??0,
    total: json['total']??0,
    image: json['image'],
    distillery: json['distillery'],
    region: json['region'],
    country: json['country'],
    type: json['type'],
    age: json['age'],
    filled: json['filled'],
    caskNumber: json['caskNumber']??0,
    abv: json['abv'],
    date: json['date'],
    size: json['size'],
    finish: json['finish'],
    notes: json['notes'],
    history: json['history'],
    flavours: List<String>.from(json['flavours']),
  );
}
