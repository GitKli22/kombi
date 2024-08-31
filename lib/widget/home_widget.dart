// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:combi/utils/actus.dart';
import 'package:combi/utils/shop_item.dart';
import 'package:combi/utils/status.dart';
import 'package:flutter/material.dart';

Widget homeWidget() {
  return CustomScrollView(
    slivers: [
      SliverAppBar(
        expandedHeight: 225,
        floating: true,
        pinned: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.blue[800],
        flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            var top = constraints.biggest.height;
            return FlexibleSpaceBar(
              centerTitle: false, // Ensures the title is not centered
              titlePadding:
                  EdgeInsetsDirectional.only(start: 20.0, bottom: 20.0),
              title: top == MediaQuery.of(context).padding.top + kToolbarHeight
                  ? Container(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Combi",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                                IconButton(
                                  onPressed: () => Navigator.pushNamed(
                                      context, '/cart_page'),
                                  icon: const Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : null, // Affiche le titre seulement quand plié
              background: Container(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Combi",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Notification
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                  ),
                                  IconButton(
                                    onPressed: () => Navigator.pushNamed(
                                        context, '/cart_page'),
                                    icon: const Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        // search bar
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Search",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Actus",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Align items to the start of the row
                            children: [
                              Actus(
                                imageName: "assets/images/chocolate.jpg",
                                isSeen: false,
                                statusNum: 3,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Actus(
                                imageName: "assets/images/hamburger.jpg",
                                isSeen: false,
                                statusNum: 6,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Actus(
                                imageName: "assets/images/ice-cream.jpg",
                                isSeen: false,
                                statusNum: 8,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Actus(
                                imageName:
                                    "assets/images/delicious-vanilla.jpg",
                                isSeen: false,
                                statusNum: 2,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Actus(
                                imageName: "assets/images/hamburger.jpg",
                                isSeen: false,
                                statusNum: 1,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Actus(
                                imageName: "assets/images/hamburger.jpg",
                                isSeen: false,
                                statusNum: 2,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Actus(
                                imageName: "assets/images/hamburger.jpg",
                                isSeen: false,
                                statusNum: 9,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Actus(
                                imageName: "assets/images/hamburger.jpg",
                                isSeen: false,
                                statusNum: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            );
          },
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Maket place",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Icon(Icons.more_horiz),
                      ],
                    ),
                    SizedBox(height: 10),
                    ListView(
                      primary:
                          false, // Important to avoid scrolling issues within another scrollable
                      shrinkWrap: true, // Important for proper measuring
                      children: [
                        ShopItem(
                          imageUrl:
                              "https://z-p3-scontent.fdla3-2.fna.fbcdn.net/v/t39.30808-6/227204470_186254440221849_4697864979390589713_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeH8uMMwalE44-UVxyTyFCe3l39_nYZLfTKXf3-dhkt9MqPeZEq2AqQdjj9kRGQylWYYDaOCSHgI1H86kuNn_4oE&_nc_ohc=mFw8b9uqSn4Q7kNvgGpeigg&_nc_zt=23&_nc_ht=z-p3-scontent.fdla3-2.fna&oh=00_AYCDMbxbmI3kaqyP6A5jhAM8GiS0A1DUwl1ciWnZbW7y6g&oe=66D148D1",
                          shopName: "Fernand telecom",
                          shopDescription:
                              "Vente des téléphones et produits divers ",
                          locationMap: "A 200 métre de vous",
                          likes: 500,
                          followers: 2,
                        ),

                        ShopItem(
                          imageUrl:
                              "https://z-p3-scontent.fdla3-2.fna.fbcdn.net/v/t39.30808-1/456280533_530781572800612_3126671216764321917_n.jpg?stp=cp6_dst-jpg_s480x480&_nc_cat=109&ccb=1-7&_nc_sid=f4b9fd&_nc_eui2=AeFYKs1oMuPEQLyej_ic3XBeLOwhz-uPDB0s7CHP648MHQ2qjyB2Spm4YhUd49PUTs54xcweOaIPCTkUjD-CN7Pt&_nc_ohc=c81ylihaGvMQ7kNvgHE-TI_&_nc_ht=z-p3-scontent.fdla3-2.fna&oh=00_AYBbyDUH-FYycjufIk-_v7Uk7SH5iI0zw5CYWrSIBkotzA&oe=66D16D27",
                          shopName: "Akezou store ",
                          shopDescription:
                              "Vente des téléphones  ",
                          locationMap: "A 210 métre de vous",
                          likes: 300,
                          followers: 1,
                        ),
                        ShopItem(
                          imageUrl:
                              "https://z-p3-scontent.fdla3-2.fna.fbcdn.net/v/t39.30808-6/420570615_874831131311011_2444645464567224277_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeGJhLU_h5qBjWU5hTNuYOv_7facFMIH6THt9pwUwgfpMVtu-hZbi_Jm5XBYf3yylhGWeu0IV2559cIecMvcsSra&_nc_ohc=B4JAoHfPj1wQ7kNvgEeHKzR&_nc_zt=23&_nc_ht=z-p3-scontent.fdla3-2.fna&oh=00_AYCYZ6JgYwclvUtIHwneLN4RLdqVEIx_J0_9mscGADaSAA&oe=66D17E07",
                          shopName: "Mr solde ",
                          shopDescription:
                              "Vente des téléphones et produits divers ",
                          locationMap: "A 200 métre de vous",
                          likes: 500,
                          followers: 2,
                        ),
                        ShopItem(
                          imageUrl:
                              "https://z-p3-scontent.fdla3-2.fna.fbcdn.net/v/t39.30808-6/326995549_926778458490612_7797185398826800587_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeHfjs887mqH1iSrH6IYfpW1ekiN7Bh2MqJ6SI3sGHYyoqzb7FhC0q3aEsCVPNFfzYvSb5kuLtMRFxKPmdAdxaTN&_nc_ohc=DtT8YmXWMeAQ7kNvgETkwhI&_nc_zt=23&_nc_ht=z-p3-scontent.fdla3-2.fna&oh=00_AYApdyiKyXJaYmqLkDtIde0__plF74KFIYkxTS8nwcDgng&oe=66D15FD3",
                          shopName: "AFRICAN FOOD BY EMY",
                          shopDescription:
                              "Vente des téléphones et produits divers ",
                          locationMap: "A 200 métre de vous",
                          likes: 500,
                          followers: 2,
                        ),
                        // Repeat for other exercises...
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
