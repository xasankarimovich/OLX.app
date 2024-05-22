import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uzum_app/model/pages/list_view_pages.dart';
import 'package:uzum_app/utils/styles.dart';

import 'model/model.dart';
import 'model/pages/galeriya.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 1;
  String _searchQuery = "";

  void search(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "МЫ НАШЛИ БОЛЕЕ 100 ОБЪЯВЛЕНИЙ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.arrow_up_arrow_down,
                        size: 20,
                      ),
                    ),
                    PopupMenuButton(
                      popUpAnimationStyle: AnimationStyle(
                          curve: const FlippedCurve(Curves.easeInCirc),
                          duration: const Duration(milliseconds: 500)),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            onTap: () {
                              setState(() {
                                _currentPageIndex = 1;
                              });
                            },
                            value: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Галерея",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                12.height(),
                                _currentPageIndex == 1
                                    ? Icon(
                                        Icons.done,
                                        color: Colors.greenAccent.shade400,
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            onTap: () {
                              setState(() {
                                _currentPageIndex = 2;
                              });
                            },
                            value: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Список",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                12.height(),
                                _currentPageIndex == 2
                                    ? Icon(
                                        Icons.done,
                                        color: Colors.greenAccent.shade400,
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            onTap: () {
                              setState(() {
                                _currentPageIndex = 3;
                              });
                            },
                            value: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Плитка",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                12.height(),
                                _currentPageIndex == 3
                                    ? Icon(
                                        Icons.done,
                                        color: Colors.greenAccent.shade400,
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                        ];
                      },
                      child: _currentPageIndex == 1
                          ? const Icon(CupertinoIcons.cube)
                          : _currentPageIndex == 2
                              ? const Icon(Icons.menu)
                              : const Icon(Icons.grid_view_outlined),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 300,
              height: 40,
              child: TextField(
                onChanged: search,
                decoration: InputDecoration(
                  hintText: "Qidiruv...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            20.height(),
            _currentPageIndex != 3
                ? Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 20);
                      },
                      itemCount: contents.length,
                      itemBuilder: (context, index) {
                        final item = contents[index];
                        if (_searchQuery.isEmpty ||
                            item.title.contains("m") ||
                            item.title.contains("м")) {
                          if (_currentPageIndex == 1) {
                            return GallerySection(
                              imgUrl: item.imgUrl,
                              checkTop: item.checkTop,
                              title: item.title,
                              price: item.price,
                              checkStatus: item.checkStatus,
                              location: item.location,
                              time: item.time,
                              heightImg: 250,
                            );
                          } else if (_currentPageIndex == 2) {
                            return ListViewSections(
                              imgUrl: item.imgUrl,
                              checkTop: item.checkTop,
                              title: item.title,
                              price: item.price,
                              checkStatus: item.checkStatus,
                              location: item.location,
                              time: item.time,
                            );
                          }
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  )
                : Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 380.0,
                      ),
                      itemCount: contents.length,
                      itemBuilder: (context, index) {
                        final item = contents[index];
                        if (_searchQuery.isEmpty ||
                            item.title.contains("m") ||
                            item.title.contains("м")) {
                          return GallerySection(
                            imgUrl: item.imgUrl,
                            checkTop: item.checkTop,
                            title: item.title,
                            price: item.price,
                            checkStatus: item.checkStatus,
                            location: item.location,
                            time: item.time,
                            heightImg: 150,
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.grey,
            ),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline_sharp,
              color: Colors.grey,
            ),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.messenger_outline_sharp,
              color: Colors.grey,
            ),
            label: "Message",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person,
              color: Colors.grey,
            ),
            label: "Profile",
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 30,
        width: 150,
        child: FloatingActionButton(
          backgroundColor: const Color(0xff4155FA),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          onPressed: () {},
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 22,
              ),
              Text(
                "Сохранить поиск",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
