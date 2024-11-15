class City {
  bool success;
  List<Data>areaData;

  City({
    required this.success,
    required this.areaData,
  });

  City.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        areaData = List<Data>.from(json['areas'].map((x) => Data.fromJson(x)));
}

class Data{
  String id;
  String name;

  Data({
    required this.id,
    required this.name,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}