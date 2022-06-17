import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'detalhes_page.dart';

class ProfissionalPage extends StatefulWidget {
  ProfissionalPage({Key? key}) : super(key: key);

  @override
  State<ProfissionalPage> createState() => _ProfissionalPageState();
}

class _ProfissionalPageState extends State<ProfissionalPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _addTask(
      String profissional, double consulta, double secao) async {
    await _firestore.collection('profissionais').add({
      'nome': profissional,
      'consulta': consulta,
      'secao': secao,
    });
  }

  Stream<QuerySnapshot> _getList() {
    return _firestore.collection('profissionais').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
            leading: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _addTask('Ruan', 100, 60);
              },
            )),
        body: Container(
          child: StreamBuilder<QuerySnapshot>(
            stream: _getList(),
            builder: (_, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.active:
                case ConnectionState.done:
                  if (snapshot.data!.docs.isEmpty) {
                    return Center(
                        child: Container(
                      child: Text(' Não possui dados'),
                    ));
                  }
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (_, index) {
                        final DocumentSnapshot doc = snapshot.data!.docs[index];
                        return Card(
                          shadowColor: Colors.black87,
                          color: Color.fromARGB(255, 240, 240, 240),
                          margin: const EdgeInsets.only(top: 12),
                          elevation: 2,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetalhesPage(nome: doc['nome'], consulta : doc['consulta'], secao: doc['secao']); 
                              }));
                            },
                            radius: 100,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, bottom: 20, left: 20),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Text(
                                              doc['nome'],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Text(
                                                "Consulta: R\$${doc['consulta']}"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Text(
                                                "Sessão: R\$${doc['secao']}"),
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
                      });
              }
            },
          ),
        ),
      ),
    );
  }
}
