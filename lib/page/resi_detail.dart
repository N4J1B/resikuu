import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resikuu/controller/detailresic.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ResiDetail extends StatelessWidget {
  const ResiDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final rd = Get.find<DetailresiC>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Pelacakan",
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
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Obx(() => IconButton(
                    icon: Icon(
                      rd.statusBook.value
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: rd.change
                  )),
            ),
          ],
          toolbarHeight: 80,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFFAFAFA),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        spreadRadius: -2,
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 15, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nomor Resi",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          rd.summary.awb,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFFAFAFA),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        spreadRadius: -2,
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 15, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Status",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          rd.summary.status.isEmpty ? "-" : rd.summary.status,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Pengirim",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          rd.detail.shipper.isEmpty ? "-" : rd.detail.shipper,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Penerima",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          rd.detail.receiver.isEmpty ? "-" : rd.detail.receiver,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Asal",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          rd.detail.origin.isEmpty ? "-" : rd.detail.origin,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Tujuan",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          rd.detail.destination.isEmpty
                              ? "-"
                              : rd.detail.destination,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFFAFAFA),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        spreadRadius: -2,
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Riwayat Pengiriman",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                      ),
                      Column(
                        children: rd.history
                            .map(
                              (e) => TimelineTile(
                                alignment: TimelineAlign.start,
                                isFirst: rd.history.indexOf(e) == 0,
                                isLast: rd.history.indexOf(e) ==
                                    rd.history.length - 1,
                                indicatorStyle: const IndicatorStyle(
                                  width: 20,
                                  color: Colors.blue,
                                  padding: EdgeInsets.all(6),
                                ),
                                endChild: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.date,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Text(
                                        e.desc,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
