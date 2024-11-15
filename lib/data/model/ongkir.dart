class Ongkir {
  int status;
  String message;
  Data data;

  Ongkir({
    required this.status,
    required this.message,
    required this.data,
  });

  Ongkir.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = Data.fromJson(json['data']);
}

class Data {
  Summary summary;
  List<Cost> cost;

  Data({
    required this.summary,
    required this.cost,
  });

  Data.fromJson(Map<String, dynamic> json)
      : summary = Summary.fromJson(json['summary']),
        cost = List<Cost>.from(json['costs'].map((x) => Cost.fromJson(x)));
}

class Cost {
  String code;
  String name;
  String service;
  String type;
  String price;
  String estimated;

  Cost({
    required this.code,
    required this.name,
    required this.service,
    required this.type,
    required this.price,
    required this.estimated,
  });

  Cost.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        name = json['name'],
        service = json['service'],
        type = json['type'],
        price = json['price'],
        estimated = json['estimated'];
}

class Summary {
  String awb;
  List<String> courier;
  String service;
  String status;
  String date;
  String desc;
  String amount;
  String weight;

  Summary({
    required this.awb,
    required this.courier,
    required this.service,
    required this.status,
    required this.date,
    required this.desc,
    required this.amount,
    required this.weight,
  });

  Summary.fromJson(Map<String, dynamic> json)
      : awb = json['awb'],
        courier = List<String>.from(json['courier']),
        service = json['service'],
        status = json['status'],
        date = json['date'],
        desc = json['desc'],
        amount = json['amount'],
        weight = json['weight'];
}
