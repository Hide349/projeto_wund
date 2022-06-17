import 'package:flutter/material.dart';

class DetalhesPage extends StatefulWidget {
  String nome;
  double consulta;
  double secao;

  DetalhesPage(
      {Key? key,
      required this.nome,
      required this.consulta,
      required this.secao})
      : super(key: key);

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(19, 233, 222, 100),
                  Color.fromRGBO(13, 168, 219, 100),
                  Color.fromRGBO(5, 92, 215, 100),
                ]),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          iconSize: 40,
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back_sharp,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 70,
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(6),
                              child: Text(
                                widget.nome,
                                style: TextStyle(
                                    fontFamily: 'Chewy',
                                    fontSize: 20,
                                    color: Colors.white,
                                    letterSpacing: 1),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.home,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    'Rua Amâncio leito centro de milagres-ce vizinho a hospital.',
                                    style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Arial'),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                'Consulta: R\$${widget.consulta.toInt()}',
                                style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.black87),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text('Sessão: R\$${ widget.secao.toInt()} ',
                                  style: TextStyle(
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                      color: Colors.black87)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Agendar',
                                  style: TextStyle(
                                      fontSize: 17,
                                      letterSpacing: 1,
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.w500),
                                ),
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all(
                                      const Size(150, 50)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.cyan),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ])
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
