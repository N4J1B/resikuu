class Bookmark {
  String resi;
  String kurir;
  String kodekurir;

  Bookmark({
    required this.resi,
    required this.kurir,
    required this.kodekurir,
  });

  Bookmark.fromJson(Map<String, dynamic> json)
      : resi = json['resi'],
        kurir = json['kurir'],
        kodekurir = json['kodekurir'];
}
