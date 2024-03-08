import 'package:agenda_leiloes/features/auction/diary_auction_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuctionModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const DiaryAuctionPage()),
  ];
}
