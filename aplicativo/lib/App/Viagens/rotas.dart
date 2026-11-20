import 'package:flutter/material.dart';
import 'usuario/perfil_page.dart';
import 'Sobre nós/saiba_mais.dart';
import 'Cadastros/login.dart';
import 'Viagens/menu_viagens.dart';
import 'inicio.dart';

class RotasApp {
  static const String inicio = '/inicio';
  static const String perfil = '/perfil';
  static const String saibaMais = '/saiba-mais';
  static const String login = '/login';
  static const String menuViagens = '/menu-viagens';

  static Route<dynamic> gerarRotas(RouteSettings settings) {
    switch (settings.name) {
      case inicio:
        return MaterialPageRoute(builder: (_) => const InicioPage());
      case perfil:
        return MaterialPageRoute(builder: (_) => const PerfilPage());
      case saibaMais:
        return MaterialPageRoute(builder: (_) => const SaibaMaisPage());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case menuViagens:
        return MaterialPageRoute(builder: (_) => const MenuViagensPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Rota ${settings.name} não encontrada!'),
            ),
          ),
        );
    }
  }
}
