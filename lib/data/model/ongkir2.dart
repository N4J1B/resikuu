class Ongkir2 {
  bool success;
  String message;
  Destination origin;
  Destination destination;
  List<DataOngkir> data;

  Ongkir2({
    required this.success,
    required this.data,
    required this.message,
    required this.origin,
    required this.destination,
  });

  Ongkir2.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        message = json['message'],
        origin = Destination.fromJson(json["origin"]),
        destination = Destination.fromJson(json["destination"]),
        data = List<DataOngkir>.from(
            json['pricing'].map((x) => DataOngkir.fromJson(x)));
}

class DataOngkir {
  String name;
  String serviceName;
  String duration;
  String serviceType;
  dynamic price;

  DataOngkir(
      {required this.name,
      required this.serviceName,
      required this.duration,
      required this.serviceType,
      required this.price});

  DataOngkir.fromJson(Map<String, dynamic> json)
      : name = json['courier_name'],
        serviceName = json['courier_service_name'],
        duration = json['duration'],
        serviceType = json['service_type'],
        price = json['price'];
}

class Destination {
  dynamic locationId;
  dynamic latitude;
  dynamic longitude;
  int postalCode;
  String countryName;
  String countryCode;
  String provinceName;
  String cityName;
  String districtName;
  String subDistrictName;
  dynamic address;

  Destination({
    required this.locationId,
    required this.latitude,
    required this.longitude,
    required this.postalCode,
    required this.countryName,
    required this.countryCode,
    required this.provinceName,
    required this.cityName,
    required this.districtName,
    required this.subDistrictName,
    required this.address,
  });

  Destination.fromJson(Map<String, dynamic> json)
      : locationId = json["location_id"],
        postalCode = json["postal_code"],
        countryName = json["country_name"],
        countryCode = json["country_code"],
        provinceName = json["administrative_division_level_1_name"],
        cityName = json["administrative_division_level_2_name"],
        districtName = json["administrative_division_level_3_name"],
        subDistrictName = json["administrative_division_level_4_name"],
        address = json["address"];
}

//   "pricing":
// "available_for_cash_on_delivery": true,
//       "available_for_proof_of_delivery": false,
//       "available_for_instant_waybill_id": true,
//       "available_for_insurance": true,
//       "available_collection_method": ["pickup"],
//       "company": "jet",
//       "courier_name": "JET Express",
//       "courier_code": "jet",
//       "courier_service_name": "Cargo",
//       "courier_service_code": "crg",
//       "description": "Layanan kargo diatas 10 kg",
//       "duration": "3 - 6 Hari",
//       "shipment_duration_range": "3 - 6",
//       "shipment_duration_unit": "days",
//       "service_type": "standard",
//       "shipping_type": "freight",
//       "price": 24000,
//       "type": "crg"