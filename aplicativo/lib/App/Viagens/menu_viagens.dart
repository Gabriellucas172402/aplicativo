import 'package:flutter/material.dart';

class MenuViagensPage extends StatefulWidget {
  const MenuViagensPage({super.key});

  @override
  State<MenuViagensPage> createState() => _MenuViagensPageState();
}

class _MenuViagensPageState extends State<MenuViagensPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List> _paises = [
    {'nome': 'Estados Unidos', 'bandeira': '🇺🇸'},
    {'nome': 'Europa', 'bandeira': '🇪🇺'},
    {'nome': 'Japão', 'bandeira': '🇯🇵'},
    {'nome': 'China', 'bandeira': '🇨🇳'},
    {'nome': 'Suíça', 'bandeira': '🇨🇭'},
    {'nome': 'Austrália', 'bandeira': '🇦🇺'},
    {'nome': 'Canadá', 'bandeira': '🇨🇦'},
    {'nome': 'Nova Zelândia', 'bandeira': '🇳🇿'},
    {'nome': 'Brazil', 'bandeira': '🇧🇷'},
    {'nome': 'Arábia Saudita', 'bandeira': '🇸🇦'},
    {'nome': 'Emirados Árabes Unido', 'bandeira': '🇦🇪'},
    {'nome': 'Egito', 'bandeira': '🇪🇬'},
    {'nome': 'Argentina', 'bandeira': '🇦🇷'},
    {'nome': 'África', 'bandeira': '🇿🇦'},
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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTagSuperior(),
                    const SizedBox(height: 12),
                    const Text(
                      'Escolha sua Viagem.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Veja alguns dos pontos turísticos mais famosos de algumas nações, e agende sua melhor viagem.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildBotaoViagens(),
                    const SizedBox(height: 16),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _paises.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final pais = _paises[index];
                        return _buildItemPais(pais['nome']!, pais['bandeira']!);
                      },
                    ),
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
            'Guia de Viagem',
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

  Widget _buildBotaoViagens() {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF00E5FF),
              Color(0xFF007791),
              Color(0xFF060422),
            ],
            stops: [0.0, 0.6, 1.0],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00E5FF).withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Viagens',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemPais(String nome, String bandeira) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFF060422),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: const Color(0xFF14114A),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Text(
              bandeira,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(width: 14),
            Text(
              nome,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuLateral() {
    final List<String> opcoesMenu = [
      'INÍCIO',
      'CONVERSÃO',
      'AGENDAMENTO',
      'PONTOS TURÍSTICOS',
      'PERFIL',
      'GUIA DE VIAGEM',
      'SAIBA MAIS',
    ];

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.65,
      backgroundColor: const Color(0xFF090736),
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
                      child: const Icon(
                        Icons.close,
                        color: Color(0xFF090736),
                        size: 18,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.public,
                    color: Color(0xFF00B8D4),
                    size: 26,
                  ),
                ],
              ),
              const SizedBox(height: 28),
              ...opcoesMenu.map(
                (titulo) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF00E5FF),
                            Color(0xFF00607A),
                            Color(0xFF090736),
                          ],
                          stops: [0.0, 0.55, 1.0],
                        ),
                      ),
                      child: Text(
                        titulo,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Sair',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                        size: 18,
                      ),
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
