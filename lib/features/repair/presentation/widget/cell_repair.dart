import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:techn_app/core/util/constants.dart';
import 'package:techn_app/features/repair/data/model/repair_model.dart';
import 'package:techn_app/features/repair/presentation/widget/add_phone.dart';
import 'package:techn_app/navigator.dart';

class CellRepair extends StatefulWidget {
  const CellRepair({Key? key}) : super(key: key);

  @override
  _CellRepairState createState() => _CellRepairState();
}

class _CellRepairState extends State<CellRepair> {
  TextEditingController controllerMarca = TextEditingController();
  TextEditingController controllerCell = TextEditingController();
  TextEditingController controllerDescripcion = TextEditingController();
  TextEditingController controllerCedula = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late ImagePicker? picker = ImagePicker();
  XFile? pickedFile;
  bool isPicker = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 246, 248, 1.0),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[300],
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF4056C6).withOpacity(.15),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          )
                        ],
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 280,
                            child: pickedFile != null
                                ? Image.file(
                                    File.fromUri(Uri(path: pickedFile!.path)),
                                    fit: BoxFit.cover)
                                : null,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, top: 24),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: IconButton(
                                    onPressed: () {
                                      AppNavigator.pop();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: Color.fromRGBO(64, 108, 108, 1.0),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) => AddPhone(
                                        onTapCamare: () async {
                                          pickedFile = await picker!.pickImage(
                                              source: ImageSource.camera);

                                          if (pickedFile == null) {
                                            print('no selecciono nada');
                                            return;
                                          }
                                          Navigator.pop(context);
                                        },
                                        onTapGallery: () async {
                                          setState(() {});
                                          final XFile? pickedFile =
                                              await picker!.pickImage(
                                                  source: ImageSource.gallery);
                                          if (pickedFile == null) {
                                            print('no selecciono nada');
                                            return;
                                          }
                                          Navigator.pop(context);
                                        },
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.camera_alt,
                                    color: Color.fromRGBO(64, 108, 108, 1.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controllerMarca,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    isDense: true,
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Marca de celular',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controllerCell,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    isDense: true,
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Modelo del celular',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  //controller: controllerSurname,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    isDense: true,
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Ubicacion',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controllerDescripcion,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    isDense: true,
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Descripción del daño',
                  ),
                  maxLength: 250,
                  maxLines: 3,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text(
                  'Por favor dar la cedula para poder registrar su a nombre la reparacion',
                  style: TextStyle(
                    color: Color.fromRGBO(64, 108, 108, 1.0),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controllerCedula,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    isDense: true,
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Cedula',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(64, 108, 108, 1.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () async {
                        setState(() {});
                        print(pickedFile!.path);
                        final docUser = firestore.collection('repair').doc();
                        final data = RepairModel(
                          brand: controllerMarca.text,
                          model: controllerCell.text,
                          description: controllerDescripcion.text,
                          userId: controllerCedula.text,
                          location: 'robledo',
                          phoneProduct: pickedFile?.path,
                          proceso: Proceso(
                            estadoDispositivo: deviceStates["espera"],
                            descripcion: "",
                          ),
                          feedback: '',
                        );

                        await docUser.set(data.toJson());
                        AppNavigator.pop();
                        AppNavigator.pop();
                      },
                      child: const Text("Solicitar la reparacion")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
