import 'package:flutter/material.dart';
import 'usuario/perfil_page.dart';
import 'usuario/conta_bancaria.dart';
import 'Sobre nós/saiba_mais.dart';
import 'Sobre nós/contato.dart';
import 'Cadastros/login.dart';
import 'Viagens/menu_viagens.dart';
import 'Viagens/agendamentos_page.dart';
import 'inicio.dart';

class RotasApp {
  static const String inicio = '/inicio';
  static const String perfil = '/perfil';
  static const String contaBancaria = '/conta-bancaria';
  static const String saibaMais = '/saiba-mais';
  static const String contato = '/contato';
  static const String login = '/login';
  static const String menuViagens = '/menu-viagens';
  static const String agendamentos = '/agendamentos';

  static Route<dynamic> gerarRotas(RouteSettings settings) {
    switch (settings.name) {
      case inicio:
        return MaterialPageRoute(builder: (_) => const InicioPage());
      case perfil:
        return MaterialPageRoute(builder: (_) => const PerfilPage());
      case contaBancaria:
        return MaterialPageRoute(builder: (_) => const ContaBancariaPage());
      case saibaMais:
        return MaterialPageRoute(builder: (_) => const SaibaMaisPage());
      case contato:
        return MaterialPageRoute(builder: (_) => const ContatoPage());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case menuViagens:
        return MaterialPageRoute(builder: (_) => const MenuViagensPage());
      case agendamentos:
        return MaterialPageRoute(builder: (_) => const AgendamentosPage());
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
