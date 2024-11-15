import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resikuu/utils/custom_icon_icons.dart';

import '../controller/detailongkirc.dart';

class OngkirDetail extends StatelessWidget {
  const OngkirDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final od = Get.find<DetailOngkirC>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Ongkos Kirim",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            padding: EdgeInsets.only(left: 20),
            color: Colors.white,
            onPressed: () => Get.back(),
          ),
          flexibleSpace: Image.asset(
            "assets/background/background_secodary.png",
            fit: BoxFit.fitWidth,
          ),
          shadowColor: Color(0xFF000000),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          toolbarHeight: 80,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      spreadRadius: 0,
                      blurRadius: 5,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFFAFAFA),
                  border: Border.all(
                    color: const Color.fromARGB(255, 146, 146, 146),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${od.origin.cityName}, ${od.origin.provinceName}",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Icon(CustomIcon.truck2),
                    Text(
                      "${od.destination.cityName}, ${od.destination.provinceName}",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("(${od.berat} gram)"),
                  ],
                ),
              ),
              Column(
                  children: od.data.map(
                (e) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          spreadRadius: 0,
                          blurRadius: 5,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFFAFAFA),
                      border: Border.all(
                        color: const Color.fromARGB(255, 146, 146, 146),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          e.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(e.serviceName),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(e.duration),
                            Text("Rp.${e.price}"),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ).toList()),
            ],
          ),
        ),
      ),
    );
  }
}
