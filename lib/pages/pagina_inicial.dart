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
                        'DEPRESSÃO',
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
                      '   A depressão é um distúrbio afetivo que  acompanha a humanidade ao longo de sua história. No sentido patológico, há presença de tristeza, pessimismo, baixa  auto-estima, que aparecem com frequência e podem combinar-se  entre si.',
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
                        'POSSÍVEIS CAUSAS',
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
                      '   Histórico familiar; Transtornos psiquiátricos correlatos; Estresse crônico; Ansiedade crônica; Disfunções hormonais; Excesso de peso; Sedentarismo e dieta desregrada; Vícios (cigarro, álcool e drogas ilícitas); Uso excessivo de internet e redes sociais; Traumas físicos ou psicológicos; Pancadas na cabeça; Problemas cardíacos; Separação conjugal; Enxaqueca crônica',
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
                      '   Desinteresse, falta de motivação e apatia; falta de vontade e indecisão; sentimentos de medo, insegurança, desesperança, desespero, desamparo e vazio; pessimismo, ideias freqüentes e desproporcionais de culpa, baixa auto-estima, sensação de falta de sentido na vida, inutilidade, ruína, fracasso, doença ou morte.',
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
                        'POSSÍVEIS TRATAMENTOS',
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
                      '    Na maioria das vezes, o tratamento para depressão é feito combinando psiquiatra e psicoterapia, por meio de psicólogos. Existem também medicamentos antidepressivos, que ajudam a regular a química cerebral e é aplicado conforme cada caso, de acordo com cada paciente.',
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
                        'DIFERENÇA ENTRE TRISTEZA \n E DEPRESSÃO',
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
                      ' Tristeza tem motivo. A pessoa sabe que está triste. A depressão é uma tristeza profunda e muitas vezes sem conteúdo, sem motivo aparente. Mesmo se algo maravilhoso acontecer ou estiver acontecendo, a pessoa continuará triste. A pessoa triste pode ter sintomas no corpo, como sentir aperto no peito, taquicardia, chorar. A pessoa deprimida tem pensamentos suicidas. Quem está triste costuma ter pensamentos repetitivos sobre a razão da tristeza.',
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
                        'O QUE A DEPRESSÃO \n PODE  CAUSAR AO CORPO.',
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
                      ' A depressão pode causar ainda dores de cabeça, dores corporais crônicas e dores que podem não responder à medicação. Às vezes, também é um efeito de certas doenças neurológicas, como Alzheimer, epilepsia e esclerose múltipla.',
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
                        'O QUE A DEPRESSÃO \n PODE CAUSAR AO CÉREBRO',
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
                      ' Como a rede de neurônios do cérebro não está funcionando como deveria, o indivíduo não consegue desengajar o humor de aspectos negativos, sentindo-se triste, melancólico, apático e sem vontade de fazer as coisas, por exemplo.',
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
                      ' A ansiedade e os transtornos de ansiedade são um conjunto de doenças psiquiátricas marcadas pela preocupação excessiva ou constante de que algo negativo vai acontecer. Em especial durante as crises de  ansiedade, as pessoas não conseguem se ater ao presente e sentem uma grande tensão, às vezes sem um motivo aparente.',
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
                        'POSSÍVEIS CAUSAS',
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
                      ' Genética; Evento traumático; Situações estressantes geradas por expectativa; Doenças físicas; Distúrbios hormonais; Traumas de infância; Abuso de substâncias;  ',
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
                      ' Preocupação excessiva; Insônia; Medo irracional; Tensão muscular; Problemas digestivos; Medo de eventos sociais; Sensação de constrangimento; Crises de pânico; Flashbacks; Perfeccionismo; Comportamento compulsivo; Ataques de dúvida; Suor excessivo; Fortes palpitações; Sensação de irrealidade; Tremores; Taquicardia.  ',
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
                        'POSSÍVEIS TRATAMENTOS',
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
                      ' O tratamento para ansiedade é feito de acordo com a intensidade dos sintomas e as necessidades de cada pessoa, podendo envolver a realização de psicoterapia e uso de medicamentos prescritos pelo médico, como antidepressivos ou ansiolíticos, que atuam a nível cerebral para reduzir os sintomas.  ',
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
                      ' A ansiedade pode provocar vários sintomas físicos como arritmia / taquicardia (alteração no ritmo cardíaco ou do coração), vertigens ou tonturas, boca seca, dificuldade respiratória (falta de ar), entre outros. ',
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
                        'O QUE A ANSIEDADE \n PODE CAUSAR NO CÉREBRO',
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
                      ' Preocupações e medos excessivos. Visão irreal de problemas. Inquietação ou sensação de estar sempre “nervoso” Irritabilidade ',
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
