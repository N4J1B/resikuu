import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bookmarkc.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final b = Get.find<BookmarkC>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 7),
          padding: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 5),
            ],
            borderRadius: BorderRadius.circular(15),
            color: Color(0xFFFAFAFA),
            border: Border.all(
              color: const Color.fromARGB(255, 146, 146, 146),
            ),
          ),
          height: 70,
          child: Text(
            "Bookmark",
            style: TextStyle(
              color: Color(0xFFA7C9FB),
              fontSize: 30,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        StreamBuilder(
          stream: b.getBookmark(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Terjadi kesalahan: ${snapshot.error}"),
              );
            }
            final bookmark = snapshot.data;
            if (bookmark == null || bookmark.isEmpty) {
              return const Center(
                child: Text("Belum ada Bookmark"),
              );
            }

            return Column(
              children: [
                ...bookmark.map(
                  (e) => GestureDetector(
                    onTap: () => b.onclick(e["resi"], e["kodekurir"]),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                        horizontal: 30,
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
                            onPressed: () =>
                                b.deleteBookmark(e["resi"], e["kurir"]),
                            icon: Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
