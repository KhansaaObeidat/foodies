import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodes/screens/home/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bloc = HomeBloc();
  Timer? _timer;
  int secondcounter = 60;
  int minutecounter = 59;
  int hourcounter = 2;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (secondcounter == 0) {
          if (minutecounter == 0) {
            if (hourcounter != 0) {
              setState(() {
                hourcounter--;
                secondcounter = 60;
                minutecounter = 59;
              });
            } else {
              setState(() {
                timer.cancel();
              });
            }
          } else {
            setState(() {
              minutecounter--;
              secondcounter = 60;
            });
          }
        } else {
          setState(() {
            secondcounter--;
          });
        }

        //   if (secondcounter == 0) {
        //     setState(() {
        //       minutecounter--;
        //     });
        //   } else if(minutecounter==0) {
        //     setState(() {
        //       hourcounter--;
        //     });
        //   }else if(hourcounter==0) {
        //     setState(() {
        //       timer.cancel();
        //     });
        //   }else{
        //     setState(() {
        //       secondcounter--;
        //     });
        //   }
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F8FB),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: Image.asset("assets/logo.png", scale: 3, color: Colors.red),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications,
                    size: 30, color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 20),
                child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(7.5)),
                    child: const Center(
                        child:
                            Text("2", style: TextStyle(color: Colors.white)))),
              )
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Poular plans",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
                itemCount: bloc.popularOffers.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 117,
                      width: 155,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  bloc.popularOffers[index].gegaperday,
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text("  per day",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 14)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  bloc.popularOffers[index].code,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 37, 39, 41),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                    "validity"
                                    "${bloc.popularOffers[index].validate}days",
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 94, 98, 100),
                                        fontSize: 12)),
                              ],
                            ),
                          ),
                          const Divider(
                            height: 1,
                            thickness: 0.5,
                            color: Color.fromARGB(255, 131, 122, 122),
                          ),
                          Row(
                            children: [
                              Expanded(child: Container()),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "view details >>",
                                    style: TextStyle(color: Colors.red),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                  width: 339,
                  height: 90,
                  color: Colors.white,
                  // ignore: prefer_const_literals_to_create_immutables
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Image.asset(
                          "assets/offer.png",
                          height: 58,
                          width: 58,
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Text(
                                  "New Offers  ",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text("  Only for you, avail today",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.grey))
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "$hourcounter Hrs  $minutecounter Min  $secondcounter Sec",
                                  style: const TextStyle(
                                      fontSize: 21,
                                      color: Color(0xffD6001B),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
