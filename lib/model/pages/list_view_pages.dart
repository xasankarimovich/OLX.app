import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewSections extends StatefulWidget {
  String imgUrl;
  bool checkTop;
  String title;
  String price;
  bool checkStatus;
  String location;
  String time;
  ListViewSections({
    super.key,
    required this.imgUrl,
    required this.checkTop,
    required this.title,
    required this.price,
    required this.checkStatus,
    required this.location,
    required this.time,
  });

  @override
  State<ListViewSections> createState() => _GalereySectionState();
}

class _GalereySectionState extends State<ListViewSections> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 170,
            width: 150,
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 18,
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
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  widget.checkStatus
                      ? Chip(
                    side: BorderSide.none,
                    backgroundColor: Colors.grey.shade300,
                    visualDensity: VisualDensity.compact,
                    label: const Text(
                      "Новый",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  )
                      : const SizedBox(),
                  Text(
                    widget.location,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Text(
                    widget.time,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}