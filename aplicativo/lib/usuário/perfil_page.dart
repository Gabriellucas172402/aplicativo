import 'package:flutter/material.dart';

const Color roxo = Color(0xFF281F55);
const Color roxoEscuro = Color(0xFF100A35);
const Color ciano = Color(0xFF00BBD4);
const Color verde = Color(0xFF00B96B);
const Color azul = Color(0xFF4388E8);

class MenuDaPagina extends StatelessWidget {
  final String paginaAtual;
  const MenuDaPagina({super.key, required this.paginaAtual});

  @override
  Widget build(BuildContext context) {
    final opcoes = ['INÍCIO', 'CONVERSÃO', 'AGENDAMENTO', 'PONTOS TURÍSTICOS',
      'PERFIL', 'GUIA DE VIAGEM', 'SAIBA MAIS'];
    return Drawer(
      backgroundColor: roxoEscuro,
      width: 245,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: Colors.white),
                ),
              ),
              for (final item in opcoes)
                Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(
                          item == paginaAtual ? 'Você já está nesta página.' :
                          'Opção "$item" selecionada. Para abrir outra página, use o arquivo dela.',
                        )),
                      );
                    },
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [ciano, roxoEscuro]),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(item, style: const TextStyle(
                        color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold,
                      )),
                    ),
                  ),
                ),
              const Spacer(),
              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Opção de sair selecionada.')),
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.white70, size: 16),
                label: const Text('Sair', style: TextStyle(color: Colors.white70)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget topoDaPagina(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(38),
    child: Container(
      color: roxoEscuro,
      child: Row(
        children: [
          Builder(builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu, color: ciano, size: 25),
          )),
          const Spacer(),
          const Icon(Icons.public, color: ciano, size: 22),
          const SizedBox(width: 16),
        ],
      ),
    ),
  );
}

Widget etiqueta(String texto) => Container(
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
  decoration: BoxDecoration(
    color: roxoEscuro,
    border: Border.all(color: ciano.withOpacity(0.6)),
    borderRadius: BorderRadius.circular(18),
  ),
  child: Text(texto, style: const TextStyle(color: Colors.white, fontSize: 10)),
);

Widget rotulo(String texto) => Padding(
  padding: const EdgeInsets.only(bottom: 6),
  child: Text(texto, style: const TextStyle(color: ciano, fontSize: 10)),
);

Widget campo(TextEditingController controller, String dica, {
  TextInputType teclado = TextInputType.text,
  bool secreto = false,
}) => TextField(
  controller: controller,
  keyboardType: teclado,
  obscureText: secreto,
  style: const TextStyle(color: Colors.white, fontSize: 12),
  decoration: InputDecoration(
    hintText: dica,
    hintStyle: const TextStyle(color: Colors.white60, fontSize: 11),
    filled: true,
    fillColor: roxoEscuro,
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: azul, width: 0.7),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: ciano, width: 1.2),
    ),
  ),
);

Widget botaoGradiente(String texto, VoidCallback acao) => SizedBox(
  width: double.infinity,
  height: 43,
  child: DecoratedBox(
    decoration: BoxDecoration(
      gradient: const LinearGradient(colors: [ciano, Color(0xFF0875B9)]),
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextButton(
      onPressed: acao,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 14),
      ),
      child: Row(children: [
        Text(texto, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        const Spacer(),
        const Icon(Icons.arrow_forward, size: 16),
      ]),
    ),
  ),
);

Widget botaoSecundario(String texto, VoidCallback acao) => OutlinedButton(
  onPressed: acao,
  style: OutlinedButton.styleFrom(
    foregroundColor: Colors.white,
    side: const BorderSide(color: azul),
    minimumSize: const Size(double.infinity, 42),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ),
  child: Text(texto),
);

class OpcaoPerfil extends StatelessWidget {
  final IconData icone;
  final String texto;
  const OpcaoPerfil({super.key, required this.icone, required this.texto});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: roxoEscuro,
      border: Border.all(color: azul, width: 0.8),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: azul,
          child: Icon(icone, color: Colors.white, size: 16),
        ),
        const SizedBox(height: 8),
        Text(texto, style: const TextStyle(color: Colors.white, fontSize: 10)),
      ],
    ),
  );
}

void main() => runApp(const AppPerfil());

class AppPerfil extends StatelessWidget {
  const AppPerfil({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Perfil',
    theme: ThemeData(scaffoldBackgroundColor: roxo),
    home: const PerfilPage(),
  );
}

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: const MenuDaPagina(paginaAtual: 'PERFIL'),
    appBar: topoDaPagina(context),
    body: Container(
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: verde, width: 3))),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          etiqueta('Seu perfil'),
          const SizedBox(height: 18),
          const Row(children: [
            CircleAvatar(radius: 27, backgroundColor: Colors.white24,
              child: Icon(Icons.person, color: Colors.white, size: 32)),
            SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Erick Piacente', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17)),
              SizedBox(height: 4),
              Text('erick.piacente@gmail.com', style: TextStyle(color: Colors.white70, fontSize: 10)),
              SizedBox(height: 4),
              Text('Conta ativa • Último acesso hoje', style: TextStyle(color: ciano, fontSize: 10)),
            ])),
          ]),
          const SizedBox(height: 22),
          const Row(children: [
            Expanded(child: _DadoPerfil(titulo: 'Nível', valor: 'Prata')),
            Expanded(child: _DadoPerfil(titulo: 'Atividades', valor: '12 projetos')),
          ]),
          const SizedBox(height: 24),
          const Text('Opções essenciais', style: TextStyle(color: ciano, fontSize: 11)),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2, shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.65,
            children: const [
              OpcaoPerfil(icone: Icons.person, texto: 'Dados pessoais'),
              OpcaoPerfil(icone: Icons.shield, texto: 'Segurança'),
              OpcaoPerfil(icone: Icons.notifications, texto: 'Notificações'),
              OpcaoPerfil(icone: Icons.settings, texto: 'Preferências'),
            ],
          ),
          const SizedBox(height: 20),
          TextButton.icon(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Opção de sair selecionada.')),
            ),
            icon: const Icon(Icons.logout, color: Colors.white70, size: 16),
            label: const Text('Sair da conta', style: TextStyle(color: Colors.white70, fontSize: 12)),
          ),
          const SizedBox(height: 12),
          botaoSecundario('Editar perfil', () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('A edição do perfil pode ser adicionada depois.')),
            );
          }),
        ]),
      ),
    ),
  );
}

class _DadoPerfil extends StatelessWidget {
  final String titulo;
  final String valor;
  const _DadoPerfil({required this.titulo, required this.valor});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(titulo, style: const TextStyle(color: Colors.white70, fontSize: 10)),
      const SizedBox(height: 5),
      Text(valor, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
    ],
  );
}

