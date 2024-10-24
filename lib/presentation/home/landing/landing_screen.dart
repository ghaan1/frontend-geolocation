import 'package:flutter/material.dart';
import 'package:frontend_geolocation/presentation/home/landing/landing_provider.dart';
import 'package:frontend_geolocation/presentation/home/landing/widget/list_food_card.dart';
import 'package:frontend_geolocation/presentation/home/landing/widget/picture_header_card.dart';
import 'package:frontend_geolocation/core/theme/app_color.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late LandingProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = LandingProvider();
    _provider.getListProjects();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _provider,
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Consumer<LandingProvider>(builder: (_, provider, __) {
      return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Home',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF302F2C),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: 1,
                  ),
                ),
              ]),
              SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        offset: Offset(12, 26),
                        blurRadius: 50,
                        spreadRadius: 0,
                        color: AppColor.secondaryBackground),
                  ]),
                  child: const TextField(
                    // controller: test,
                    // onChanged: (value) {
                    //   setState(() {
                    //     searchQuery = value;
                    //   });
                    // },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColor.primary,
                      ),
                      filled: true,
                      fillColor: AppColor.whiteText,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                height: 195,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.state.restaurants.length,
                  itemBuilder: (context, index) {
                    var restaurantItems = provider.state.restaurants;
                    return PictureHeaderCard(
                        restaurantModel: restaurantItems[index]);
                  },
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Most Popular',
                    style: TextStyle(
                      color: Color(0xFF302F2C),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                height: 450,
                width: double.infinity,
                child: (provider.state.restaurants.isEmpty)
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/img-no-data.png',
                              width: 200,
                              height: 200,
                            ),
                            const Text('No Data'),
                          ],
                        ),
                      )
                    : GridView.builder(
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 2 / 2,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0),
                        itemCount: provider.state.restaurants.length,
                        itemBuilder: (context, index) {
                          var restaurantItems = provider.state.restaurants;
                          return ListFoodCard(
                            restaurantItems: restaurantItems[index],
                            refreshParent: () => setState(() {}),
                          );
                        },
                      ),
              ),
            ],
          ),
        )),
      );
    });
  }
}
