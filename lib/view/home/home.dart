import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localdataloginandhome/contstant/const.dart';
import 'package:localdataloginandhome/contstant/controller/base_controller.dart';
import 'package:localdataloginandhome/view/widgets/drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final bc = Get.find<BaseCtrl>();
  @override
  void initState() {
    bc.getMoviesDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return bc.getMoviesDetails();
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              return _scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          title: const Text('Movies'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<BaseCtrl>(
            builder: (bCtrl) {
              return bCtrl.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        final data = bCtrl.movieDetails?.result?[index];
                        String date =
                            data?.releasedDate.toString().substring(0, 2) ?? '';
                        String language = 'KANNADA | ';
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
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
                                        data?.totalVoted.toString() ?? "",
                                        style: kTextStyle(
                                            fontWeight: FontWeight.w600,
                                            size: 17),
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
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: greyClr,
                                          spreadRadius: 0.2,
                                          blurRadius: 0.1,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(data?.poster ??
                                            'https://i0.wp.com/sreditingzone.com/wp-content/uploads/2018/03/special-photo-5.png'),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        child: Text(
                                          data?.title ?? 'Unknown',
                                          style: kTextStyle(
                                              fontWeight: FontWeight.w600,
                                              size: 13),
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Genre: ',
                                          style: kTextStyle(
                                              fontWeight: FontWeight.w600,
                                              size: 14,
                                              color: greyClr),
                                          children: [
                                            TextSpan(
                                              text: data?.genre ?? 'Unknown',
                                              style: kTextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  size: 14,
                                                  color: blackClr),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 216,
                                        child: RichText(
                                          text: TextSpan(
                                            text: 'Director: ',
                                            style: kTextStyle(
                                                fontWeight: FontWeight.w600,
                                                size: 14,
                                                color: greyClr),
                                            children: [
                                              TextSpan(
                                                text: data?.director?[0] ??
                                                    'Unknown',
                                                style: kTextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    size: 14,
                                                    color: blackClr),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 216,
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            text: TextSpan(
                                                text: 'Starring: ',
                                                style: kTextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    size: 14,
                                                    color: greyClr),
                                                children: [
                                                  TextSpan(
                                                    text: data?.stars?[0] ??
                                                        'Unknow',
                                                    style: kTextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        size: 14,
                                                        color: blackClr),
                                                  )
                                                ])),
                                      ),
                                      RichText(
                                          text: TextSpan(
                                              text: 'Mins | ',
                                              style: kTextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  size: 14,
                                                  color: greyClr),
                                              children: [
                                            TextSpan(
                                              text: "$language $date",
                                              style: kTextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  size: 14,
                                                  color: blackClr),
                                            )
                                          ])),
                                      Text(
                                        "${data?.pageViews.toString()} views | voted by ${data?.voted![0].upVoted?.length} peoples ",
                                        style: kTextStyle(
                                            fontWeight: FontWeight.w500,
                                            size: 14,
                                            color: Colors.blue),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(217, 33, 149, 243),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Watch Trailer',
                                    style: kTextStyle(
                                        fontWeight: FontWeight.bold,
                                        size: 16,
                                        color: whiteClr),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: bCtrl.movieDetails?.result?.length ?? 0);
            },
          ),
        ),
        drawer: const DrawerWidget(),
      ),
    );
  }
}
