class Resi {
  int status;
  String message;
  Data data;

  Resi({
    required this.status,
    required this.message,
    required this.data,
  });

  Resi.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = Data.fromJson(json['data']);
}

class Data {
  Summary summary;
  Detail detail;
  List<History> history;

  Data({
    required this.summary,
    required this.detail,
    required this.history,
  });

  Data.fromJson(Map<String, dynamic> json)
      : summary = Summary.fromJson(json['summary']),
        detail = Detail.fromJson(json['detail']),
        history =
            List<History>.from(json['history'].map((x) => History.fromJson(x)));
}

class Detail {
  String origin;
  String destination;
  String shipper;
  String receiver;

  Detail({
    required this.origin,
    required this.destination,
    required this.shipper,
    required this.receiver,
  });

  Detail.fromJson(Map<String, dynamic> json)
      : origin = json['origin'],
        destination = json['destination'],
        shipper = json['shipper'],
        receiver = json['receiver'];
}

class History {
  String date;
  String desc;
  String location;

  History({
    required this.date,
    required this.desc,
    required this.location,
  });

  History.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        desc = json['desc'],
        location = json['location'];
}

class Summary {
  String awb;
  String courier;
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
        courier = json['courier'],
        service = json['service'],
        status = json['status'],
        date = json['date'],
        desc = json['desc'],
        amount = json['amount'],
        weight = json['weight'];
}
