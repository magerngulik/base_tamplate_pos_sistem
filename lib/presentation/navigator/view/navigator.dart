import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:testing_local_storage/bloc/visible/visible_cubit.dart';
import 'package:testing_local_storage/presentation/home/view/home.dart';
import 'package:testing_local_storage/presentation/menu_management/view/menu_management.dart';
import 'package:testing_local_storage/presentation/testing/view/testing.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  List item = [
    {"id": 0, "icon": FontAwesomeIcons.house},
    {"id": 1, "icon": FontAwesomeIcons.bookmark},
    {"id": 2, "icon": FontAwesomeIcons.bagShopping},
    {"id": 3, "icon": FontAwesomeIcons.file},
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    VisibleCubit status = context.read<VisibleCubit>();

    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<VisibleCubit, bool>(
          bloc: status,
          builder: (context, state) {
            return Row(
              children: [
                Visibility(
                  visible: state,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: 80,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 24,
                          offset: Offset(0, 11),
                        ),
                      ],
                    ),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.google,
                            size: 24.0.h,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(item.length, (index) {
                            var items = item[index];

                            return Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        selected = items['id'];
                                        setState(() {});
                                      },
                                      icon: FaIcon(
                                        items['icon'],
                                        size: 24.0.h,
                                        color: (selected == items['id'])
                                            ? Colors.orange
                                            : Colors.grey,
                                      ),
                                    ),
                                    const Spacer(),
                                    (selected != items['id'])
                                        ? Container()
                                        : Container(
                                            height: 40.0,
                                            width: 2,
                                            decoration: BoxDecoration(
                                              color: (selected == items['id'])
                                                  ? Colors.orange
                                                  : Colors.grey,
                                            ),
                                          ),
                                  ]),
                            );
                          }),
                        ),
                        IconButton(
                          onPressed: () {
                            status.changeVisible();
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.gear,
                            size: 24.0.h,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        IconButton(
                          onPressed: () async {
                            await showDialog<void>(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Keluar'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: const <Widget>[
                                        Text('Apakah anda yakin ingin keluar?'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Tidak"),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey,
                                      ),
                                      onPressed: () {},
                                      child: const Text("Iya"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.rightFromBracket,
                            size: 24.0.h,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                    ),
                    child: IndexedStack(
                      index: selected,
                      children: [
                        HomePage(),
                        const MenuManagement(),
                        const TestingPage(),
                        Container(
                          color: Colors.blue[100],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class BasicMainNavigationView extends StatefulWidget {
  const BasicMainNavigationView({Key? key}) : super(key: key);

  @override
  State<BasicMainNavigationView> createState() =>
      _BasicMainNavigationViewState();
}

class _BasicMainNavigationViewState extends State<BasicMainNavigationView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: [
            HomePage(),
            const MenuManagement(),
            const TestingPage(),
            Container(
              color: Colors.blue[100],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: Colors.grey[700],
          unselectedItemColor: Colors.grey[500],
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: "Order",
              icon: Icon(
                Icons.list,
              ),
            ),
            BottomNavigationBarItem(
              label: "Favorite",
              icon: Icon(
                Icons.favorite,
              ),
            ),
            BottomNavigationBarItem(
              label: "Me",
              icon: Icon(
                Icons.person,
              ),
            ),
          ],
        ),
      ),
    );
  }
}