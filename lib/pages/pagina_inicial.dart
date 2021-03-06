import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wund/carrosel/slide_tile.dart';
import 'package:wund/models/user_repository.dart';
import 'package:wund/widgets/drawer_construtor.dart';

class PaginaInicial extends StatefulWidget {
  PaginaInicial({Key? key}) : super(key: key);

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  final PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 0.8);
  int _currentPage = 1;

  var _listSlide = [
    {'id': 0, 'image': 'assets/imagens/img1.jpg'},
    {'id': 1, 'image': 'assets/imagens/img2.jpg'},
    {'id': 2, 'image': 'assets/imagens/img3.png'}
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Chewy',
        primaryColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      home: WillPopScope(
        onWillPop: ()  async {
          return false;
        },
        child: Scaffold(
          drawer: DrawerConstrutor(),
          appBar: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(19, 233, 222, 100),
                  Color.fromRGBO(13, 168, 219, 100),
                  Color.fromRGBO(5, 92, 215, 100),
                ]),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/imagens/fundo.png'),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _listSlide.length,
                      itemBuilder: (_, int index) {
                        bool activePage = index == _currentPage;
                        return SlideTile(
                          activePage: activePage,
                          image: _listSlide[index]['image'].toString(),
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'DEPRESS??O',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      '   A depress??o ?? um dist??rbio afetivo que  acompanha a humanidade ao longo de sua hist??ria. No sentido patol??gico, h?? presen??a de tristeza, pessimismo, baixa  auto-estima, que aparecem com frequ??ncia e podem combinar-se  entre si.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'POSS??VEIS CAUSAS',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      '   Hist??rico familiar; Transtornos psiqui??tricos correlatos; Estresse cr??nico; Ansiedade cr??nica; Disfun????es hormonais; Excesso de peso; Sedentarismo e dieta desregrada; V??cios (cigarro, ??lcool e drogas il??citas); Uso excessivo de internet e redes sociais; Traumas f??sicos ou psicol??gicos; Pancadas na cabe??a; Problemas card??acos; Separa????o conjugal; Enxaqueca cr??nica',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'PRINCIPAIS SINTOMAS',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      '   Desinteresse, falta de motiva????o e apatia; falta de vontade e indecis??o; sentimentos de medo, inseguran??a, desesperan??a, desespero, desamparo e vazio; pessimismo, ideias freq??entes e desproporcionais de culpa, baixa auto-estima, sensa????o de falta de sentido na vida, inutilidade, ru??na, fracasso, doen??a ou morte.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'POSS??VEIS TRATAMENTOS',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      '    Na maioria das vezes, o tratamento para depress??o ?? feito combinando psiquiatra e psicoterapia, por meio de psic??logos. Existem tamb??m medicamentos antidepressivos, que ajudam a regular a qu??mica cerebral e ?? aplicado conforme cada caso, de acordo com cada paciente.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'DIFEREN??A ENTRE TRISTEZA \n E DEPRESS??O',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      ' Tristeza tem motivo. A pessoa sabe que est?? triste. A depress??o ?? uma tristeza profunda e muitas vezes sem conte??do, sem motivo aparente. Mesmo se algo maravilhoso acontecer ou estiver acontecendo, a pessoa continuar?? triste. A pessoa triste pode ter sintomas no corpo, como sentir aperto no peito, taquicardia, chorar. A pessoa deprimida tem pensamentos suicidas. Quem est?? triste costuma ter pensamentos repetitivos sobre a raz??o da tristeza.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'O QUE A DEPRESS??O \n PODE  CAUSAR AO CORPO.',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      ' A depress??o pode causar ainda dores de cabe??a, dores corporais cr??nicas e dores que podem n??o responder ?? medica????o. ??s vezes, tamb??m ?? um efeito de certas doen??as neurol??gicas, como Alzheimer, epilepsia e esclerose m??ltipla.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'O QUE A DEPRESS??O \n PODE CAUSAR AO C??REBRO',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      ' Como a rede de neur??nios do c??rebro n??o est?? funcionando como deveria, o indiv??duo n??o consegue desengajar o humor de aspectos negativos, sentindo-se triste, melanc??lico, ap??tico e sem vontade de fazer as coisas, por exemplo.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'ANSIEDADE',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      ' A ansiedade e os transtornos de ansiedade s??o um conjunto de doen??as psiqui??tricas marcadas pela preocupa????o excessiva ou constante de que algo negativo vai acontecer. Em especial durante as crises de  ansiedade, as pessoas n??o conseguem se ater ao presente e sentem uma grande tens??o, ??s vezes sem um motivo aparente.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'POSS??VEIS CAUSAS',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      ' Gen??tica; Evento traum??tico; Situa????es estressantes geradas por expectativa; Doen??as f??sicas; Dist??rbios hormonais; Traumas de inf??ncia; Abuso de subst??ncias;  ',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'PRINCIPAIS SINTOMAS',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      ' Preocupa????o excessiva; Ins??nia; Medo irracional; Tens??o muscular; Problemas digestivos; Medo de eventos sociais; Sensa????o de constrangimento; Crises de p??nico; Flashbacks; Perfeccionismo; Comportamento compulsivo; Ataques de d??vida; Suor excessivo; Fortes palpita????es; Sensa????o de irrealidade; Tremores; Taquicardia.  ',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'POSS??VEIS TRATAMENTOS',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      ' O tratamento para ansiedade ?? feito de acordo com a intensidade dos sintomas e as necessidades de cada pessoa, podendo envolver a realiza????o de psicoterapia e uso de medicamentos prescritos pelo m??dico, como antidepressivos ou ansiol??ticos, que atuam a n??vel cerebral para reduzir os sintomas.  ',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'O QUE A ANSIEDADE \n PODE CAUSAR NO CORPO',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      ' A ansiedade pode provocar v??rios sintomas f??sicos como arritmia / taquicardia (altera????o no ritmo card??aco ou do cora????o), vertigens ou tonturas, boca seca, dificuldade respirat??ria (falta de ar), entre outros. ',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'O QUE A ANSIEDADE \n PODE CAUSAR NO C??REBRO',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      ' Preocupa????es e medos excessivos. Vis??o irreal de problemas. Inquieta????o ou sensa????o de estar sempre ???nervoso??? Irritabilidade ',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
