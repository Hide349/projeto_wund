import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wund/services/auth_services.dart';

import '../models/user_repository.dart';
import '../pages/config.dart';
import '../pages/sobre.dart';
import '../pages/suporte.dart';
import 'header_widget.dart';

class DrawerConstrutor extends StatefulWidget {
  DrawerConstrutor({Key? key}) : super(key: key);

  @override
  State<DrawerConstrutor> createState() => _DrawerState();
}

class _DrawerState extends State<DrawerConstrutor> {
  final email = TextEditingController();
  final senha = TextEditingController();
  var nome = '';

  @override
  initState() {
    context.read<UserRepository>().readName();
    super.initState();
  }

  listTileConstrutor(IconData icon, String title, Rota) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return Rota;
        }));
      },
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 17, color: Colors.white),
      ),
      horizontalTitleGap: -10,
    );
  }

  buttonLogout() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: OutlinedButton(
          onPressed: () {
            context.read<AuthService>().logout();
          },
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.red),
            primary: Colors.red,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(18),
                child: Text(
                  'Sair do app',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          )),
    );
  }

  iconeSenha(esconderSenha) {
    if (!esconderSenha) {
      return Icon(
        FontAwesomeIcons.solidEye,
        size: 17,
      );
    } else {
      return Icon(
        FontAwesomeIcons.solidEyeSlash,
        size: 17,
      );
    }
  }

  textSenha(esconderSenha) {
    if (esconderSenha) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    nome = context.read<UserRepository>().nome;
    return Drawer(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(19, 233, 222, 80),
            Color.fromRGBO(5, 92, 215, 80),
          ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  headerWidget(nome),
                  const Divider(thickness: 1, height: 40, color: Colors.cyan),
                  listTileConstrutor(Icons.support_agent, 'Suporte', Suporte()),
                  listTileConstrutor(Icons.info_outlined, 'Sobre', Sobre()),
                  listTileConstrutor(
                      Icons.settings, 'Configurações', Configuracoes())
                ],
              ),
              buttonLogout(),
              Container(
                margin: EdgeInsets.only(top: 240),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Wund',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Chewy'),
                    ),
                    Icon(
                      Icons.copyright,
                      color: Colors.white,
                      size: 12,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
