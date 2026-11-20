import 'package:flutter/material.dart';

class SelecaoMoedaPage extends StatefulWidget {
  const SelecaoMoedaPage({super.key});

  @override
  State<SelecaoMoedaPage> createState() => _SelecaoMoedaPageState();
}

class _SelecaoMoedaPageState extends State<SelecaoMoedaPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _filtroAberto = false;
  String? _continenteSelecionado;

  final List<String> _continentes = [
    'América Do Norte',
    'Europa',
    'Ásia',
    'Oceania',
    'América Do Sul',
    'África',
  ];

  final List> _moedas = [
    {
      'nome': 'Dólar Americano\n(US\$)',
      'codigo': 'USD',
      'bandeira': '🇺🇸',
      'continente': 'América Do Norte',
    },
    {
      'nome': 'Euro\n(€)',
      'codigo': 'EUR',
      'bandeira': '🇪🇺',
      'continente': 'Europa',
    },
    {
      'nome': 'Iene\n(JPY - ¥)',
      'codigo': 'JPY',
      'bandeira': '🇯🇵',
      'continente': 'Ásia',
    },
    {
      'nome': 'Yuan Renminbi\n(CNY - ¥)',
      'codigo': 'CNY',
      'bandeira': '🇨🇳',
      'continente': 'Ásia',
    },
    {
      'nome': 'Franco Suíço\n(CHF)',
      'codigo': 'CHF',
      'bandeira': '🇨🇭',
      'continente': 'Europa',
    },
    {
      'nome': 'Dólar Neozelandês\n(NZD)',
      'codigo': 'NZD',
      'bandeira': '🇳🇿',
      'continente': 'Oceania',
    },
    {
      'nome': 'Dólar Canadense\n(CAD)',
      'codigo': 'CAD',
      'bandeira': '🇨🇦',
      'continente': 'América Do Norte',
    },
    {
      'nome': 'Dólar Australiano\n(AUD)',
      'codigo': 'AUD',
      'bandeira': '🇦🇺',
      'continente': 'Oceania',
    },
    {
      'nome': 'Real\n(BRL - R\$)',
      'codigo': 'BRL',
      'bandeira': '🇧🇷',
      'continente': 'América Do Sul',
    },
    {
      'nome': 'Rial Saudita\n(SAR)',
      'codigo': 'SAR',
      'bandeira': '🇸🇦',
      'continente': 'Ásia',
    },
    {
      'nome': 'Dirham\n(AED)',
      'codigo': 'AED',
      'bandeira': '🇦🇪',
      'continente': 'Ásia',
    },
    {
      'nome': 'Libra Egípcia\n(EGP)',
      'codigo': 'EGP',
      'bandeira': '🇪🇬',
      'continente': 'África',
    },
    {
      'nome': 'Peso Argentino\n(ARS)',
      'codigo': 'ARS',
      'bandeira': '🇦🇷',
      'continente': 'América Do Sul',
    },
    {
      'nome': 'Rand Sul-Africano\n(ZAR)',
      'codigo': 'ZAR',
      'bandeira': '🇿🇦',
      'continente': 'África',
    },
  ];

  List> get _moedasFiltradas {
    if (_continenteSelecionado == null) {
      return _moedas;
    }
    return _moedas
        .where((m) => m['continente'] == _continenteSelecionado)
        .toList();
  }

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
            const SizedBox(height: 12),
            _buildBarraSeletorOuFiltro(),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                itemCount: _moedasFiltradas.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final moeda = _moedasFiltradas[index];
                  return _buildItemMoeda(moeda);
                },
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
          GestureDetector(
            onTap: () {
              setState(() {
                _filtroAberto = !_filtroAberto;
                if (!_filtroAberto) {
                  _continenteSelecionado = null; 
                }
              });
            },
            child: _filtroAberto
                ? Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF00E5FF),
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Color(0xFF00E5FF),
                      size: 20,
                    ),
                  )
                : const Icon(
                    Icons.filter_alt_outlined,
                    color: Color(0xFF00E5FF),
                    size: 28,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarraSeletorOuFiltro() {
    if (_filtroAberto) {
      return SizedBox(
        height: 36,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemCount: _continentes.length,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (context, index) {
            final continente = _continentes[index];
            final selecionado = _continenteSelecionado == continente;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _continenteSelecionado = selecionado ? null : continente;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selecionado
                      ? const Color(0xFF00E5FF)
                      : const Color(0xFF00B8D4),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: selecionado ? Colors.white : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                child: Text(
                  continente,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            );
          },
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 34,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF002B49), width: 1.5),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF00E5FF),
                    Color(0xFF007791),
                    Color(0xFF08062B),
                  ],
                  stops: [0.0, 0.45, 1.0],
                ),
              ),
              child: const Text(
                'Seletor',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  shadows: [
                    Shadow(color: Colors.black54, blurRadius: 4),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Icon(
            Icons.public,
            color: Color(0xFF00B8D4),
            size: 28,
          ),
        ],
      ),
    );
  }

  Widget _buildItemMoeda(Map<String, String> moeda) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: () {
        Navigator.pop(context, moeda);
      },
      child: Container(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              moeda['nome']!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
            Container(
              width: 42,
              height: 28,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                moeda['bandeira']!,
                style: const TextStyle(fontSize: 22),
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
                    onTap: () {
                      Navigator.pop(context);
                    },
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
                onTap: () {
                  Navigator.pop(context);
                },
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
