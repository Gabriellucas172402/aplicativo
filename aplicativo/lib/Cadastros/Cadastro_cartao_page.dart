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

void main() => runApp(const AppCadastroCartao());

class AppCadastroCartao extends StatelessWidget {
  const AppCadastroCartao({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Cadastro do cartão',
    theme: ThemeData(scaffoldBackgroundColor: roxo),
    home: const CadastroCartaoPage(),
  );
}

class CadastroCartaoPage extends StatefulWidget {
  const CadastroCartaoPage({super.key});
  @override
  State<CadastroCartaoPage> createState() => _CadastroCartaoPageState();
}

class _CadastroCartaoPageState extends State<CadastroCartaoPage> {
  final numero = TextEditingController();
  final nome = TextEditingController();
  final validade = TextEditingController();
  final cvv = TextEditingController();

  @override
  void dispose() {
    numero.dispose(); nome.dispose(); validade.dispose(); cvv.dispose();
    super.dispose();
  }

  void mensagem(String texto) => ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(texto)));

  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: const MenuDaPagina(paginaAtual: 'INÍCIO'),
    appBar: topoDaPagina(context),
    body: Container(
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: verde, width: 3))),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          etiqueta('Cadastro do cartão'),
          const SizedBox(height: 12),
          const Text('Adicione seu cartão', style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold,
          )),
          const SizedBox(height: 8),
          const Text('Preencha os dados abaixo para salvar seu cartão e continuar com segurança.',
            style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.5)),
          const SizedBox(height: 18),
          botaoGradiente('Salvar cartão', () {
            if (numero.text.isEmpty || nome.text.isEmpty ||
                validade.text.isEmpty || cvv.text.isEmpty) {
              mensagem('Preencha todos os campos.');
            } else {
              mensagem('Dados preenchidos! Este exemplo ainda não salva em banco de dados.');
            }
          }),
          const SizedBox(height: 20),
          rotulo('Número do cartão'),
          campo(numero, '0000 0000 0000 0000', teclado: TextInputType.number),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(flex: 3, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              rotulo('Nome no cartão'), campo(nome, 'Nome completo'),
            ])),
            const SizedBox(width: 8),
            Expanded(flex: 2, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              rotulo('Vencimento'), campo(validade, 'MM/AA'),
            ])),
          ]),
          const SizedBox(height: 12),
          SizedBox(width: 120, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            rotulo('CVV'), campo(cvv, '000', teclado: TextInputType.number, secreto: true),
          ])),
        ]),
      ),
    ),
  );
}

