import 'package:agenda_leiloes/features/login_user/login_user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_user_page.dart';

class LoginUserModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginUserPage()),
  ];
}
