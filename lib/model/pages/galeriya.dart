import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uzum_app/utils/styles.dart';

class GallerySection extends StatefulWidget {
  String imgUrl;
  bool checkTop;
  String title;
  String price;
  bool checkStatus;
  String location;
  String time;
  double heightImg;

  GallerySection({
    super.key,
    required this.imgUrl,
    required this.checkTop,
    required this.title,
    required this.price,
    required this.checkStatus,
    required this.location,
    required this.time,
    required this.heightImg,
  });

  @override
  State<GallerySection> createState() => _GallerySectionState();
}

class _GallerySectionState extends State<GallerySection> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: widget.heightImg,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.imgUrl,
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: widget.checkTop
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 30,
                        width: 60,
                        color: const Color(0xff1EE1D7),
                        child: const Center(
                          child: Text(
                            "ТОП",
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                        ),
                      )
                    ],
                  )
                : null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.heart),
                    ),
                  ],
                ),
                Text(
                  widget.price,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                10.height(),
                widget.checkStatus
                    ? Chip(
                        side: BorderSide.none,
                        backgroundColor: Colors.grey.shade300,
                        visualDensity: VisualDensity.compact,
                        label: const Text(
                          "Новый",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      )
                    : const SizedBox(),
                Text(
                  widget.location,
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.grey.shade700),
                ),
                Text(
                  widget.time,
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
