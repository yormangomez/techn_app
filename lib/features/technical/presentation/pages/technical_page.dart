import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:techn_app/features/repair/data/model/repair_model.dart';

class TechnicalPage extends StatefulWidget {
  const TechnicalPage({Key? key}) : super(key: key);

  @override
  _TechnicalPageState createState() => _TechnicalPageState();
}

class _TechnicalPageState extends State<TechnicalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 246, 248, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(64, 108, 108, 1.0),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 690,
            child: StreamBuilder(
              stream: readUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      final data = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color.fromRGBO(245, 246, 248, 1.0),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF4056C6).withOpacity(.15),
                                blurRadius: 15,
                                offset: const Offset(0, 5),
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 8),
                              const Center(
                                child: Text(
                                  'Reparción de computadores',
                                  style: TextStyle(
                                    color: Color.fromRGBO(64, 108, 108, 1.0),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${data.brand}',
                                    style: const TextStyle(
                                      color: Color.fromRGBO(64, 108, 108, 1.0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '${data.model}',
                                    style: const TextStyle(
                                      color: Color.fromRGBO(64, 108, 108, 1.0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'descripcion del daño: ',
                                    style: TextStyle(
                                      color: Color.fromRGBO(64, 108, 108, 1.0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '${data.description}',
                                    style: const TextStyle(
                                      color: Color.fromRGBO(64, 108, 108, 1.0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Ubicacion: ',
                                    style: TextStyle(
                                      color: Color.fromRGBO(64, 108, 108, 1.0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '${data.location}',
                                    style: const TextStyle(
                                      color: Color.fromRGBO(64, 108, 108, 1.0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 45,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(64, 108, 108, 1.0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    onPressed: () async {
                                      final test = FirebaseFirestore.instance
                                          .collection('repair');
                                      final datas = FirebaseFirestore.instance
                                          .collection('repair')
                                          .get();
                                      datas.then(
                                        (value) {
                                          final update = test.doc(
                                              value.docChanges[index].doc.id);
                                          update.update({
                                            'proceso': {
                                              "espera": false,
                                              "procesoReparacion": true,
                                              "finalizado": false,
                                              "rechazadoEspera": false,
                                              "rechazadoCotizacion": false,
                                            }
                                          });
                                        },
                                      );
                                    },
                                    child: const Text("Aceptar Reparacion"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                }
                if (snapshot.hasError) {
                  return Text('error de datos');
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Stream<List<RepairModel>> readUser() => FirebaseFirestore.instance
          .collection('repair')
          .snapshots()
          .map((snapshot) {
        final data =
            snapshot.docs.map((e) => RepairModel.fromJson(e.data())).toList();
        return data
            .where((element) => element.proceso!.espera == true)
            .toList();
      });
}
