import 'package:agenda_leiloes/features/auction/auction_model.dart';
import 'package:agenda_leiloes/features/auction/card_live_auction_widget.dart';
import 'package:agenda_leiloes/features/auction/details_auction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DiaryAuctionPage extends StatefulWidget {
  const DiaryAuctionPage({Key? key}) : super(key: key);

  @override
  State<DiaryAuctionPage> createState() => _DiaryAuctionPageState();
}

class _DiaryAuctionPageState extends State<DiaryAuctionPage> {
  List<AuctionModel> result = [];

  Future<List<AuctionModel>> fetchAuctions() async {
    final response = await http.get(
      Uri.parse('https://bis365.com.br/bid365/api/v1/auctions'),
      headers: {
        'app': '583f0a5b-c017-4956-b788-a6305767c117',
        'Authorization':
            'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI3IiwianRpIjoiNTY2MzdhYTRhZWQ4MDdhZWViOGVmZGQ2ZmFjOWI0M2E5ZDY0MmZhMWE4YjIxYzdmMmZlNGM3OTU0NmU5OGE4Y2Y1YWZkMWUxM2RhM2M1NjkiLCJpYXQiOjE3MDk0OTM3MDMsIm5iZiI6MTcwOTQ5MzcwMywiZXhwIjoxNzQxMDI5NzAzLCJzdWIiOiI1NTIiLCJzY29wZXMiOltdfQ.Llg01VU1Rv8ieK4z81e6xuYkx9wNilypjJir-dMcBa1x5dZYZ8R0D1b_BEcJ8VGsidG0E5aj7Q3ZQa_hnx6ASVXdyddIIejpNLpVKuU9ZfwXWhLgKhuhyPQw2PqaI3B1HoQkI08Xu2SJIwc5HAO2VTR7d_vSH8dWNji17KsRULyEiIkv5SXIncV7SNM9LchH7TIiaikl4Qj18_fDznfBtyiDrPYzp960I2__npjT-EuqOrV21hz7ja-nD6X_F5F_Ug_qgNWb2eWER1Fr5KHCfk-aoFyST6f_ZXPKI9O000y-8Zmsf3Ana7QKixFa8DN7f7kgw3oQWjoDiU_Lq81pIBmEHbEaV5eKdI2y6muJvTeBSdcbb9BCH9Xa-ooe4aUEnYMCK220kF-uiz27RqAtMVHhNxIEqABPr538TPeooAHIJJGIwRvC7ybeVU8kDgFP53DRo3o-1gF3xJ4RurxbJ6_KrWLKvzKUGmwdGwFUzIK9OkzqDLpoPf3071m6IzOVkcy0v52tNwT-VvucEmIN0aenoNIKW8tjLrFbXOvUrMl5c_t5yqmDkVN2SB5I_xs34srIf6N2ULowuEEa9MBUbiun45NFTpv_dk49GR6txHixZsWTxsuFFhxZkMZYDGuLwr-1p9HAjgQPfZWFGNq5zvVu7fd2_7fasONzAx6jMIM',
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      result = data.map((json) => AuctionModel.fromJson(json)).toList();
      return data.map((json) => AuctionModel.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar leilões');
    }
  }

  detailsCardSelected(AuctionModel auctionModel) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DetailsAuctionPage(
            date: auctionModel.date,
            nameAuction: auctionModel.name,
            phone: auctionModel.deskOne,
            locale: auctionModel.auctionHouse,
            time: auctionModel.time,
            image: auctionModel.image,
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    fetchAuctions();
  }

  @override
  Widget build(BuildContext context) {
    final Stream<int> myStream =
        Stream<int>.periodic(const Duration(microseconds: 1), (value) => value);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromRGBO(0, 0, 0, 1),
                Color.fromRGBO(38, 38, 41, 1),
                Color.fromRGBO(9, 20, 9, 1),
              ])),
          child: ListView(
            children: [
              const SizedBox(
                height: 200,
              ),
              ListTile(
                leading: const Icon(
                  Icons.gavel,
                  color: Colors.white,
                ),
                title: const Text(
                  'Leilão',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Modular.to.pop();
                },
              ),
              ExpansionTile(
                collapsedIconColor: Colors.white,
                iconColor: Colors.white,
                title: const Text('Configurações',
                    style: TextStyle(color: Colors.white)),
                leading: const Icon(Icons.settings, color: Colors.white),
                children: [
                  ListTile(
                    title: const Text(
                      "Sair",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Modular.to.navigate('/');
                      Modular.to.pop();
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(34, 34, 34, 1),
      appBar: AppBar(
        title: const Text("Leilão"),
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder<Object>(
          stream: myStream,
          builder: (context, snapshot) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                      child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: result
                                .where((element) => element.isOnline == 1)
                                .length,
                            itemBuilder: (context, index) {
                              result[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CardLiveAuctionWidget(
                                  auctionModel: result,
                                  nameAuction: result[index].name,
                                  localeAuction: result[index].city,
                                  timeAuction: result[index].time,
                                  link: result[index].link,
                                  image: result[index].image,
                                ),
                              );
                            },
                          ))),
                  const Text(
                    "Próximos leilões",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    color: const Color.fromRGBO(174, 132, 26, 1),
                    width: 40,
                    height: 2,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: result
                          .where((element) => element.isOnline == 0)
                          .length,
                      itemBuilder: (context, index) {
                        result[index];
                        return Center(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () => detailsCardSelected(result[index]),
                                child: Stack(children: [
                                  Container(
                                    width: 280,
                                    height: 365,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.black,
                                    ),
                                  ),
                                  Positioned(
                                    top: 330,
                                    left: 15,
                                    child: Text(
                                      result[index].name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.width * 0.027,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 267,
                                    width: 280,
                                    child: Image.asset(
                                        "assets/images/img_auction.png"),
                                  ),
                                  Positioned(
                                    top: 266,
                                    child: Container(
                                      height: 45,
                                      width: 280,
                                      color:
                                          const Color.fromRGBO(174, 132, 26, 1),
                                      child: Center(
                                          child: Text(
                                        "${(result[index].date)} as ${result[index].time} ",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      )),
                                    ),
                                  ),
                                ]),
                              )),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
