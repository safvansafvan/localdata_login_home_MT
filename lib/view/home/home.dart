import 'package:flutter/material.dart';
import 'package:localdataloginandhome/contstant/const.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final ac = Get.find<AuthCtrl>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        title: const Text('Movies'),
      ),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/arrowhead-up.png',
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                              ),
                              Text(
                                '0',
                                style: kTextStyle(
                                    fontWeight: FontWeight.w600, size: 17),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/down-arrow.png',
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  'Votes',
                                  style: kTextStyle(
                                    fontWeight: FontWeight.w500,
                                    size: 15,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 100,
                            width: 70,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: greyClr,
                                  spreadRadius: 0.2,
                                  blurRadius: 0.1,
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://i0.wp.com/sreditingzone.com/wp-content/uploads/2018/03/special-photo-5.png'),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Bond 25'),
                              RichText(
                                  text: TextSpan(
                                      text: 'Genre: ',
                                      style: kTextStyle(
                                          fontWeight: FontWeight.w600,
                                          size: 14,
                                          color: greyClr),
                                      children: [
                                    TextSpan(
                                      text: 'values',
                                      style: kTextStyle(
                                          fontWeight: FontWeight.w500,
                                          size: 14,
                                          color: blackClr),
                                    )
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      text: 'Director: ',
                                      style: kTextStyle(
                                          fontWeight: FontWeight.w600,
                                          size: 14,
                                          color: greyClr),
                                      children: [
                                    TextSpan(
                                      text: 'values',
                                      style: kTextStyle(
                                          fontWeight: FontWeight.w500,
                                          size: 14,
                                          color: blackClr),
                                    )
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      text: 'Starring: ',
                                      style: kTextStyle(
                                          fontWeight: FontWeight.w600,
                                          size: 14,
                                          color: greyClr),
                                      children: [
                                    TextSpan(
                                      text: 'values',
                                      style: kTextStyle(
                                          fontWeight: FontWeight.w500,
                                          size: 14,
                                          color: blackClr),
                                    )
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      text: 'Mins: ',
                                      style: kTextStyle(
                                          fontWeight: FontWeight.w600,
                                          size: 14,
                                          color: greyClr),
                                      children: [
                                    TextSpan(
                                      text: 'values',
                                      style: kTextStyle(
                                          fontWeight: FontWeight.w500,
                                          size: 14,
                                          color: blackClr),
                                    )
                                  ])),
                              Text(
                                '1234 views',
                                style: kTextStyle(
                                    fontWeight: FontWeight.w500,
                                    size: 14,
                                    color: Colors.blue),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: 10)),
      drawer: const Drawer(),
    );
  }
}
