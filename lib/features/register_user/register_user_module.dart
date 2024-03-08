import 'package:agenda_leiloes/features/register_user/register_user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterUserModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const RegisterUserPage()),
  ];
}
