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
      home: Scaffold(
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
                      'DEPRESSÃO X ANSIEDADE',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      ' A depressão é um distúrbio afetivo que  acompanha a humanidade ao longo de sua história. No sentido patológico, há presença de tristeza, pessimismo, baixa  auto-estima, que aparecem com frequência e podem combinar-se  entre si.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: 170,
                    child: Text(
                      'A ansiedade e os transtornos de ansiedade são um conjunto de doenças psiquiátricas marcadas pela preocupação excessiva ou constante de que algo negativo vai acontecer.',
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'POSSÍVEIS CAUSAS',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      ' Histórico familiar; Transtornos psiquiátricos correlatos; Estresse crônico; Ansiedade crônica; Disfunções hormonais; Excesso de peso; Sedentarismo e dieta desregrada; Vícios (cigarro, álcool e drogas ilícitas); Uso excessivo de internet e redes sociais; Traumas físicos ou psicológicos; Pancadas na cabeça; Problemas cardíacos; Separação conjugal; Enxaqueca crônica',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: 175,
                    child: Text(
                      ' Histórico familiar; Transtornos psiquiátricos correlatos; Estresse crônico; Ansiedade crônica; Disfunções hormonais; Excesso de peso; Sedentarismo e dieta desregrada; Vícios (cigarro, álcool e drogas ilícitas); Uso excessivo de internet e redes sociais; Traumas físicos ou psicológicos; Pancadas na cabeça; Problemas cardíacos; Separação conjugal; Enxaqueca crônica',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
