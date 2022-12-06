import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:techn_app/features/repair/data/model/repair_model.dart';

class ProcessPage extends StatefulWidget {
  const ProcessPage({Key? key}) : super(key: key);

  @override
  _ProcessPageState createState() => _ProcessPageState();
}

class _ProcessPageState extends State<ProcessPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedPage = 0;

  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: selectedPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(245, 246, 248, 1.0),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(64, 108, 108, 1.0),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: TabBar(
                  controller: tabController,
                  physics: const BouncingScrollPhysics(),
                  indicator: BoxDecoration(
                    color: Color.fromRGBO(64, 108, 108, 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  unselectedLabelColor: Color.fromRGBO(64, 108, 108, 1.0),
                  labelColor: Colors.white,
                  tabs: [
                    Text('Tu proceso'),
                    Text('Reparaciones finalizada'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: StreamBuilder(
                              stream: readUser(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Container(
                                    width: double.infinity,
                                    height: 500,
                                    child: ListView.builder(
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: double.infinity,
                                          height: 300,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: const Color.fromRGBO(
                                                245, 246, 248, 1.0),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color(0xFF4056C6)
                                                    .withOpacity(.15),
                                                blurRadius: 15,
                                                offset: const Offset(0, 5),
                                              )
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${snapshot.data![index].brand}',
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          64, 108, 108, 1.0),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${snapshot.data![index].model}',
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          64, 108, 108, 1.0),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '${snapshot.data![index].description}',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      64, 108, 108, 1.0),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                '${snapshot.data![index].proceso!.espera}',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      64, 108, 108, 1.0),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
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
                    ),
                    Column(
                      children: [],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  /* Stream<List<RepairModel>> readUser() => FirebaseFirestore.instance
      .collection('repair')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((e) => RepairModel.fromJson(e.data())).toList());*/

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
