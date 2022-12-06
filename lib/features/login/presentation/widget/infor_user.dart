import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techn_app/features/home/presentation/pages/home_page.dart';

class InforUser extends StatefulWidget {
  final String credential;
  final String numberPhone;

  const InforUser({
    Key? key,
    required this.credential,
    required this.numberPhone,
  }) : super(key: key);

  @override
  _InforUserState createState() => _InforUserState();
}

class _InforUserState extends State<InforUser> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerSurname = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controllerName,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              isDense: true,
              fillColor: Colors.white,
              filled: true,
              hintText: 'Nombre',
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: controllerSurname,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              isDense: true,
              fillColor: Colors.white,
              filled: true,
              hintText: 'apellido',
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(64, 108, 108, 1.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () async {
                  setState(() {});
                  final docUser =
                      firestore.collection('user').doc(widget.credential);
                  final data = {
                    'id': widget.credential,
                    "name": controllerName.text,
                    'surName': controllerSurname.text,
                    'phoneNumber': widget.numberPhone,
                  };
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                numberPhone: widget.numberPhone,
                              )));
                  await docUser.set(data);
                },
                child: const Text("Ingresar")),
          ),
        ],
      ),
    );
  }
}
