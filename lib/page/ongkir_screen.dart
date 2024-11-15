import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:resikuu/utils/custom_icon_icons.dart';

import '../data/model/city.dart';
import '../controller/ongkirc.dart';

class OngkirScreen extends StatelessWidget {
  const OngkirScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final o = Get.find<OngkirC>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
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
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Cek Ongkos Kirim',
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
                child: TypeAheadField<Data>(
                  loadingBuilder: (context) => const ListTile(
                    title: Text('Loading...'),
                  ),
                  errorBuilder: (context, error) => const ListTile(
                    title: Text('Error!'),
                  ),
                  emptyBuilder: (context) => const ListTile(
                    title: Text('Tidak ditemukan!'),
                  ),
                  controller: o.asalC,
                  focusNode: o.asalF,
                  builder: (context, controller, focusNode) => Obx(
                    () => TextField(
                      controller: controller,
                      style: TextStyle(fontSize: 14),
                      focusNode: focusNode,
                      autofocus: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF5D99F1),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFA7C9FB),
                          ),
                        ),
                        labelText: "Asal",
                        labelStyle: TextStyle(color: Color(0xFFA7C9FB)),
                        prefixIcon: Icon(
                          CustomIcon.location,
                          color: Color(0xFFA7C9FB),
                        ),
                        suffixIcon: o.isAsalEmpty.value
                            ? null
                            : IconButton(
                                onPressed: o.clearasal,
                                icon: Icon(Icons.close_rounded),
                              ),
                      ),
                    ),
                  ),
                  itemBuilder: (context, city) => ListTile(
                    title: Text(city.name),
                  ),
                  onSelected: o.onselectedasal,
                  suggestionsCallback: o.onsearch,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TypeAheadField<Data>(
                  loadingBuilder: (context) => const ListTile(
                    title: Text('Loading...'),
                  ),
                  errorBuilder: (context, error) => const ListTile(
                    title: Text('Error!'),
                  ),
                  emptyBuilder: (context) => const ListTile(
                    title: Text('Tidak ditemukan!'),
                  ),
                  controller: o.tujuanC,
                  focusNode: o.tujuanF,
                  builder: (context, controller, focusNode) => Obx(
                    () => TextField(
                      controller: controller,
                      style: TextStyle(fontSize: 14),
                      focusNode: focusNode,
                      autofocus: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF5D99F1),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFA7C9FB),
                          ),
                        ),
                        labelText: 'Tujuan',
                        labelStyle: TextStyle(color: Color(0xFFA7C9FB)),
                        prefixIcon: Icon(
                          CustomIcon.flag_2,
                          color: Color(0xFFA7C9FB),
                        ),
                        suffixIcon: o.isTujuanEmpty.value
                            ? null
                            : IconButton(
                                onPressed: o.cleartujuan,
                                icon: Icon(Icons.close_rounded),
                              ),
                      ),
                    ),
                  ),
                  itemBuilder: (context, city) => ListTile(
                    title: Text(city.name),
                  ),
                  onSelected: o.onselectedtujuan,
                  suggestionsCallback: o.onsearch,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, right: 30, left: 30),
                child: TextField(
                  autocorrect: false,
                  style: TextStyle(fontSize: 14),
                  textCapitalization: TextCapitalization.characters,
                  controller: o.beratC,
                  keyboardType: TextInputType.numberWithOptions(),
                  focusNode: o.beratF,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5D99F1),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFA7C9FB),
                      ),
                    ),
                    labelText: "Berat (gram)",
                    labelStyle: TextStyle(color: Color(0xFFA7C9FB)),
                    prefixIcon: Icon(
                      CustomIcon.weight,
                      color: Color(0xFFA7C9FB),
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
                  onPressed: o.cekOngkir,
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
      ],
    );
  }
}
