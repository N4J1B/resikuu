import 'package:flutter/material.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  MySliverAppBar({
    required this.title,
    required this.subText,
    required this.maxExtent,
    required this.minExtent,
  });

  String title;
  String subText;
  @override
  double maxExtent;
  @override
  double minExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 16),
            ],
          ),
          child: Image.asset(
            "assets/background/background_utama.png",
            alignment: Alignment.bottomCenter,
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: Text(
            "ResiKuu",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Color(0xFFF5F5F5),
              fontSize: 24,
              fontWeight: FontWeight.w900,
              fontFamily: "Poppins",
              letterSpacing: 1.5,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.only(top: 70),
          child: Text(
            "Cek posisi dan status pesananmu disini !",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Color(0xFFF5F5F5),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.only(top: 90),
          child: Text(
            "Mau tahu ongkos kirim saat mengirim barang  cek disini !",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Color(0xFFF5F5F5),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
