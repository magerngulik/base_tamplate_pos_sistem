// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_local_storage/util/color/color_util.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({Key? key}) : super(key: key);

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          height: 150.0,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/image/user_background.png",
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Column(
          children: [
            Text(
              "Coffe Santuy",
              style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: darkCoffee,
                  radius: 31,
                  child: const CircleAvatar(
                    radius: 28.0,
                    backgroundImage: NetworkImage(
                      "https://i.ibb.co/PGv8ZzG/me.jpg",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "M.Zulkarnaen",
                      style: GoogleFonts.montserrat(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Zulkarnaim70@gmail.com",
                      style: GoogleFonts.montserrat(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    16.0,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 100.0,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(
                            28.0,
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 50.0,
                                width: 150,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      16.0,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "23000",
                                      style: GoogleFonts.montserrat(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Total Point",
                                      style: GoogleFonts.montserrat(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 50.0,
                                width: 150,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      16.0,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "15",
                                      style: GoogleFonts.montserrat(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Jumlah Transaksi",
                                      style: GoogleFonts.montserrat(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: darkCoffee,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(
                            28.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 160,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 400.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            28.0,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 50.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Container()),
                                        );
                                      },
                                      child: Container(
                                        height: 100.0,
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: darkCoffee,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                              16.0,
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            "assets/image/clock.png",
                                            width: 70.0,
                                            height: 70.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "History Transaksi",
                                      style: GoogleFonts.montserrat(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Container()),
                                        );
                                      },
                                      child: Container(
                                        height: 100.0,
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: darkCoffee,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                              16.0,
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            "assets/image/resume.png",
                                            width: 70.0,
                                            height: 70.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Profile",
                                      style: GoogleFonts.montserrat(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hot Menu",
                                  style: GoogleFonts.montserrat(
                                    textStyle:
                                        Theme.of(context).textTheme.headline4,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            height: 130.0,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Container()),
                                    );
                                  },
                                  child: SizedBox(
                                    height: 120,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 100.0,
                                          height: 100,
                                          margin: const EdgeInsets.only(
                                              right: 10.0),
                                          decoration: BoxDecoration(
                                            image: const DecorationImage(
                                              image: NetworkImage(
                                                "https://upload.wikimedia.org/wikipedia/commons/c/c8/Cappuccino_at_Sightglass_Coffee.jpg",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(16.0),
                                            ),
                                            color: Colors.blue[400],
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: 25.0,
                                                width: 50,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0),
                                                decoration: const BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(16),
                                                    topRight:
                                                        Radius.circular(16.0),
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    "-30%",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "Product Name",
                                          style: GoogleFonts.montserrat(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 150,
                    right: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                16.0,
                              ),
                            ),
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/image/qr-code.png",
                              ),
                              fit: BoxFit.fitWidth,
                            ),
                            border: Border.all(
                              width: 2.0,
                              color: darkCoffee,
                            ),
                          ),
                        ),
                        Text(
                          "Scan QR",
                          style: GoogleFonts.montserrat(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
