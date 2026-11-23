import 'package:flutter/material.dart';
import 'rotas.dart'

const Color roxo = Color(0xFF1E1B38);
const Color roxoEscuro = Color(0xFF0A083A);
const Color ciano = Color(0xFF00E5FF);
const Color azul = Color(0xFF4388E8);
const Color verde = Color(0xFF00B96B);

class MenuDaPagina extends StatelessWidget {
  final String paginaAtual;
  const MenuDaPagina({super.key, required this.paginaAtual});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> opcoes = {
      'INÍCIO': RotasApp.inicio,
      'CONVERSÃO': RotasApp.menuViagens, 
      'AGENDAMENTO': RotasApp.menuViagens,
      'PONTOS TURÍSTICOS': RotasApp.menuViagens,
      'PERFIL': RotasApp.perfil,
      'GUIA DE VIAGEM': RotasApp.menuViagens,
      'SAIBA MAIS': RotasApp.saibaMais,
    };

    return Drawer(
      backgroundColor: const Color(0xFF090736),
      width: MediaQuery.of(context).size.width * 0.65,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.close, color: Color(0xFF090736), size: 18),
                    ),
                  ),
                  const Icon(Icons.public, color: ciano, size: 26),
                ],
              ),
              const SizedBox(height: 28),
              Expanded(
                child: ListView(
                  children: opcoes.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          Navigator.pop(context);
                          if (entry.key != paginaAtual) {
                            Navigator.pushNamed(context, entry.value);
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              colors: [ciano, Color(0xFF00607A), Color(0xFF090736)],
                              stops: [0.0, 0.55, 1.0],
                            ),
                          ),
                          child: Text(
                            entry.key,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, RotasApp.login);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Sair', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
                      SizedBox(width: 8),
                      Icon(Icons.logout, color: Colors.white, size: 18),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
