import 'package:agenda_leiloes/features/auction/auction_module.dart';
import 'package:agenda_leiloes/features/login_user/login_user_module.dart';
import 'package:agenda_leiloes/features/register_user/register_user_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: LoginUserModule()),
        ModuleRoute('/registerUser', module: RegisterUserModule()),
        ModuleRoute('/diaryAuction', module: AuctionModule()),
      ];
}
