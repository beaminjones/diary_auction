import 'package:agenda_leiloes/features/auction/auction_model.dart';
import 'package:flutter/material.dart';

class CardLiveAuctionWidget extends StatefulWidget {
  final List<AuctionModel> auctionModel;
  final String nameAuction;
  final String localeAuction;
  final String timeAuction;
  final String link;
  final String image;
  const CardLiveAuctionWidget({
    Key? key,
    required this.auctionModel,
    required this.nameAuction,
    required this.localeAuction,
    required this.timeAuction,
    required this.link,
    required this.image,
  }) : super(key: key);

  @override
  State<CardLiveAuctionWidget> createState() => _CardLiveAuctionWidgetState();
}

class _CardLiveAuctionWidgetState extends State<CardLiveAuctionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      height: 171,
      width: 351,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 4),
                child: Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.blue,
                  ),
                  child: Image.asset("assets/images/img_live_auction.png"),
                ),
              )
            ],
          ),
          Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                widget.nameAuction,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Image.asset("assets/images/location.png", scale: 3),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(widget.localeAuction),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/images/time.png", scale: 3),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("${widget.timeAuction} (Horário de Brasília)"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Clica aqui e assista esse leilão agora!",
                style: TextStyle(fontSize: 10),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.send_rounded),
                label: const Text("Assistir"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
              )
            ],
          )
        ],
      ),
    );
  }
}
