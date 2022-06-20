import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(19, 233, 222, 100),
            Color.fromRGBO(13, 168, 219, 100),
            Color.fromRGBO(5, 92, 215, 100),
          ])),
        ),
        title: Text('Sobre',
            style: TextStyle(
                fontSize: 25, fontFamily: 'Chewy', color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Wund',
                    style: TextStyle(
                        letterSpacing: 2,
                        decorationThickness: 0.8,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                        decorationStyle: TextDecorationStyle.dotted,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontFamily: 'Chewy'),
                  ),
                  Icon(
                    Icons.copyright,
                    color: Colors.blue,
                    size: 30,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  '   Nós somos uma equipe independente que possui apenas um intuito de ajudar todos ao nosso alcance. Para esta missão, desenvolvemos o Wund, um aplicativo que fornecerá diversas ferramentas preparadas exclusivamente para você.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  '   Nossa empresa facilita a busca de profissionais da saúde mental por meio do ambiente caloroso do app e além disso forncemos funções para auxiliar na auto-ajuda. Tais funções são: ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Agendamento',
                style: TextStyle(
                    fontSize: 30, fontFamily: 'Chewy', letterSpacing: 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  ' Através do aplicativo, será possível agendar diretamente com um profissional local, com informações de valor, data e hora. Sendo possível também receber algumas dicas gratuitas do próprio profissional.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Home-Área inicial',
                style: TextStyle(
                    fontSize: 30, fontFamily: 'Chewy', letterSpacing: 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  'O local onde as mais diversas coisas serão encontradas, vídeos, textos motivacionais e de auto-ajuda, músicas e muito mais.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
