import 'package:flutter/material.dart';
import 'package:techn_app/features/repair/presentation/widget/cell_repair.dart';
import 'package:techn_app/navigator.dart';

class RepairPage extends StatefulWidget {
  const RepairPage({Key? key}) : super(key: key);

  @override
  _RepairPageState createState() => _RepairPageState();
}

class _RepairPageState extends State<RepairPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 246, 248, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(64, 108, 108, 1.0),
        leading: IconButton(
          onPressed: () => AppNavigator.pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CellRepair()));
              },
              child: Container(
                width: double.infinity,
                height: 100,
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
                child: const Center(
                  child: Text(
                    'Reparción de celular',
                    style: TextStyle(
                      color: Color.fromRGBO(64, 108, 108, 1.0),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 100,
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
                child: const Center(
                  child: Text(
                    'Reparción de computadores',
                    style: TextStyle(
                      color: Color.fromRGBO(64, 108, 108, 1.0),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
