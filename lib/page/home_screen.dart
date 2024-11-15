import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resikuu/utils/custom_icon_icons.dart';

import '../controller/homec.dart';
import '../data/model/courier.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = Get.find<HomeC>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xFFFAFAFA),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: -2, blurRadius: 10)
            ],
          ),
          margin: EdgeInsets.only(top: 20, left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Lacak Pengiriman Anda',
                  style: TextStyle(
                    color: Color(0xFFA7C9FB),
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: DropdownMenu(
                  inputDecorationTheme: InputDecorationTheme(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFA7C9FB)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF5D99F1)),
                    ),
                    labelStyle: TextStyle(
                      color: Color(0xFFA7C9FB),
                      fontSize: 14,
                    ),
                    iconColor: Color(0xFFA7C9FB),
                    prefixIconColor: Color(0xFFA7C9FB),
                    suffixIconColor: Color(0xFFA7C9FB),
                  ),
                  controller: h.kurirC,
                  textStyle: TextStyle(fontSize: 14),
                  label: Text("Pilih Kurir"),
                  leadingIcon: Icon(CustomIcon.truck2),
                  trailingIcon: Icon(Icons.arrow_drop_down_rounded),
                  selectedTrailingIcon: Icon(Icons.arrow_drop_up_rounded),
                  menuHeight: 250,
                  width: 250,
                  menuStyle: MenuStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xFFFFFFFF)),
                    side: WidgetStatePropertyAll(BorderSide(width: 0.3)),
                  ),
                  dropdownMenuEntries: Courier.list
                      .map(
                        (e) => DropdownMenuEntry(
                            value: e.code, label: e.description),
                      )
                      .toList(),
                  onSelected: (value) {
                    h.kurir.value = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, right: 30, left: 30),
                child: TextField(
                  autocorrect: false,
                  autofocus: false,
                  focusNode: h.resiF,
                  style: TextStyle(fontSize: 14),
                  textCapitalization: TextCapitalization.characters,
                  controller: h.resiC,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF5D99F1)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFA7C9FB),
                      ),
                    ),
                    hintText: "Masukkan Resi...",
                    hintStyle: TextStyle(color: Color(0xFFA7C9FB)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.qr_code_scanner,
                        size: 30,
                        color: Color(0xFFA7C9FB),
                      ),
                      onPressed: h.scanner,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(158, 255, 255, 255),
                    ),
                  ),
                  onPressed: h.cekResi,
                  child: Text(
                    "Cek",
                    style: TextStyle(
                      color: Color(0xFF5D99F1),
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20, right: 30, left: 40),
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pencarian Terbaru",
                style: TextStyle(
                  color: Color(0x7B433535),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Lihat Semua",
                  style: TextStyle(color: Color(0xFFA7C9FB)),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 80),
          child: h.storageList.isEmpty
              ? Text("Tidak ada Riwayat Pencarian")
              : Obx(
                  () => Column(
                    children: [
                      ...h.storageList.reversed.map(
                        (e) => GestureDetector(
                          onTap: () =>
                              h.ontap(e["kurir"], e["kodekurir"], e["resi"]),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 7,
                            ),
                            padding: EdgeInsets.only(left: 20, right: 10),
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
                                color: Color.fromARGB(255, 146, 146, 146),
                              ),
                            ),
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  e["resi"],
                                  style: TextStyle(),
                                ),
                                IconButton(
                                  onPressed: () {
                                    h.storageList.remove(e);
                                    h.box.write('recent', h.storageList);
                                  },
                                  icon: Icon(Icons.delete, color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (h.storageList.isNotEmpty)
                        ElevatedButton(
                          onPressed: () {
                            h.storageList.clear();
                            h.box.write('recent', h.storageList);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                          ),
                          child: Text("Hapus Semua Riwayat"),
                        ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
