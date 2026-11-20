import 'package:flutter/material.dart';

class SelecaoViagensPage extends StatefulWidget {
  const SelecaoViagensPage({super.key});

  @override
  State<SelecaoViagensPage> createState() => _SelecaoViagensPageState();
}

class _SelecaoViagensPageState extends State<SelecaoViagensPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List> _destinos = [
    {
      'pais': 'China',
      'descricaoPais':
          'Explore dinastias imperiais, relíquias sagradas e as maiores muralhas da humanidade.',
      'pontos': [
        {
          'titulo': 'Grande Muralha da China',
          'cidade': 'Huairou',
          'descricao':
              'A colossal fortaleza de pedra que serpenteia as montanhas, defendendo o antigo império.',
          'imagem':
              'https://images.unsplash.com/photo-1508804185872-d7badad00f7d?auto=format&fit=crop&w=800&q=80',
        },
        {
          'titulo': 'Cidade Proibida',
          'cidade': 'Pequim',
          'descricao':
              'O majestoso palácio imperial que serviu como o coração cerimonial e político por séculos.',
          'imagem':
              'https://images.unsplash.com/photo-1584464491033-06628f3a6b7b?auto=format&fit=crop&w=800&q=80',
        },
      ],
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFF0A083A), 
      drawer: _buildMenuLateral(),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTagSuperior(),
                    const SizedBox(height: 12),

                    _buildCardCabecalho(),
                    const SizedBox(height: 18),

                    ..._destinos.map((destino) => _buildCardPais(destino)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            icon: const Icon(
              Icons.menu_rounded,
              color: Color(0xFF00E5FF),
              size: 32,
            ),
          ),
          const Column(
            children: [
              Icon(
                Icons.public,
                color: Color(0xFF00E5FF),
                size: 28,
              ),
              Text(
                'DEVISE',
                style: TextStyle(
                  color: Color(
