class Recent {
  String resi;
  String kurir;
  String kodekurir;

  Recent({
    required this.resi,
    required this.kurir,
    required this.kodekurir,
  });

  Recent.fromJson(Map<String, dynamic> json)
      : resi = json['resi'],
        kurir = json['kurir'],
        kodekurir = json['kodekurir'];
}
