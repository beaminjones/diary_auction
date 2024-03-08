import 'package:agenda_leiloes/features/auction/diary_auction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailsAuctionPage extends StatefulWidget {
  final String nameAuction;
  final String phone;
  final String date;
  final String time;
  final String locale;
  final String image;

  const DetailsAuctionPage({
    Key? key,
    required this.nameAuction,
    required this.phone,
    required this.date,
    required this.time,
    required this.locale,
    required this.image,
  }) : super(key: key);

  @override
  State<DetailsAuctionPage> createState() => _DetailsAuctionPageState();
}

class _DetailsAuctionPageState extends State<DetailsAuctionPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(34, 34, 34, 1),
      appBar: AppBar(
        title: const Text("Lote"),
        backgroundColor: Colors.black,
      ),
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
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DiaryAuctionPage(),
                  ),
                ),
              ),
              ExpansionTile(
                collapsedIconColor: Colors.white,
                iconColor: Colors.white,
                title: const Text('Configurações',
                    style: TextStyle(color: Colors.white)),
                leading: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
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
      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(children: [
              Container(
                width: 280,
                height: 365,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.black,
                ),
                child: Text(
                  widget.nameAuction,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Positioned(
                top: 330,
                left: 15,
                child: Text(
                  widget.nameAuction,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.027,
                  ),
                ),
              ),
              SizedBox(
                height: 267,
                width: 280,
                child: Image.asset("assets/images/img_auction.png"),
              ),
              Positioned(
                top: 266,
                child: Container(
                  height: 45,
                  width: 280,
                  color: const Color.fromRGBO(174, 132, 26, 1),
                  child: Center(
                      child: Text(
                    "${widget.date} as ${widget.time} ",
                    style: const TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ]),
          ),
          Container(
            width: 280,
            height: 84,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7), color: Colors.black),
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/phone.png",
                      scale: 2,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.phone,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 280,
            height: 84,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7), color: Colors.black),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Data de início: ',
                          style: TextStyle(color: Color.fromRGBO(0, 136, 0, 1)),
                        ),
                        TextSpan(
                          text: "${widget.date} ${widget.time}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Local: ',
                          style: TextStyle(color: Color.fromRGBO(0, 136, 0, 1)),
                        ),
                        TextSpan(
                          text: widget.locale,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
