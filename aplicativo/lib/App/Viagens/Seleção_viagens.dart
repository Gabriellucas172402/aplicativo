import 'package:flutter/material.dart';
import '../componentes_comuns.dart';

class SelecaoViagensPage extends StatefulWidget {
  final String? paisSelecionado;

  const SelecaoViagensPage({super.key, this.paisSelecionado});

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
    {
      'pais': 'Japão',
      'descricaoPais':
          'Tradições milenares, templos sagrados e metrópoles futuristas iluminadas por neon.',
      'pontos': [
        {
          'titulo': 'Monte Fuji',
          'cidade': 'Honshu',
          'descricao':
              'O pico mais alto do Japão e um dos símbolos culturais e espirituais mais icônicos do país.',
          'imagem':
              'https://images.unsplash.com/photo-1490806843957-31f4c9a91c65?auto=format&fit=crop&w=800&q=80',
        },
        {
          'titulo': 'Templo Senso-ji',
          'cidade': 'Tóquio',
          'descricao':
              'O templo budista mais antigo de Tóquio, famoso por sua imensa lanterna vermelha.',
          'imagem':
              'https://images.unsplash.com/photo-1545569341-9eb8b30979d9?auto=format&fit=crop&w=800&q=80',
        },
      ],
    },
    {
      'pais': 'Estados Unidos',
      'descricaoPais':
          'Metrópoles vibrantes, parques nacionais grandiosos e marcos mundialmente famosos.',
      'pontos': [
        {
          'titulo': 'Estátua da Liberdade',
          'cidade': 'Nova York',
          'descricao':
              'O monumento histórico que simboliza liberdade e democracia na entrada do porto de Nova York.',
          'imagem':
              'https://images.unsplash.com/photo-1605130284535-11dd9eedc58a?auto=format&fit=crop&w=800&q=80',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final destinosExibidos = widget.paisSelecionado == null
        ? _destinos
        : _destinos
            .where((d) =>
                d['pais'].toString().toLowerCase() ==
                widget.paisSelecionado!.toLowerCase())
            .toList();

    final listaFinal =
        destinosExibidos.isEmpty ? _destinos : destinosExibidos;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFF0A083A),
      drawer: const MenuDaPagina(paginaAtual: 'PONTOS TURÍSTICOS'),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTagSuperior(),
                    const SizedBox(height: 12),
                    _buildCardCabecalho(),
                    const SizedBox(height: 18),
                    ...listaFinal.map((destino) => _buildCardPais(destino)),
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
                  color: Color(0xFF00E5FF),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTagSuperior() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF060422),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF00B8D4), width: 1),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.circle,
            color: Color(0xFF00E5FF),
            size: 8,
          ),
          SizedBox(width: 6),
          Text(
            'Pontos Turísticos',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardCabecalho() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF060422),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF1D2B64), width: 1.2),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Escolha sua Viagem.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Veja alguns dos pontos turísticos mais famosos de algumas nações.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 13,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardPais(Map<String, dynamic> destino) {
    final List> pontos =
        List>.from(destino['pontos']);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF06042
