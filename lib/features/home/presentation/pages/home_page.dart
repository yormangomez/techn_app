import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techn_app/core/bloc/global_bloc.dart';
import 'package:techn_app/features/home/data/models/home_item_model.dart';
import 'package:techn_app/navigator.dart';

class HomePage extends StatefulWidget {
  final String? numberPhone;
  const HomePage({
    Key? key,
    this.numberPhone,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<HomeItemModel> listButton = [
    HomeItemModel(
      title: 'Solicitad tu reparacion',
      iconData: Icons.home,
      onPressed: () {
        AppNavigator.push(Routes.REPAIR);
      },
    ),
    HomeItemModel(
      title: 'Proceso de reparacion',
      iconData: Icons.help_outline_outlined,
      onPressed: () {
        AppNavigator.push(Routes.PROCESS);
      },
    ),
    HomeItemModel(
      title: 'sin informacion',
      iconData: Icons.room_service,
      onPressed: () {
        AppNavigator.push(Routes.TECHNICAL);
      },
    ),
    HomeItemModel(
      title: 'agregar',
      iconData: Icons.add,
      onPressed: () {},
    ),
  ];

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(245, 246, 248, 1.0),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              color: Color.fromRGBO(64, 108, 108, 1.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    icon: Icon(
                      Icons.logout_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.22),
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color.fromRGBO(245, 246, 248, 1.0),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor:
                                    Color.fromRGBO(64, 108, 108, 1.0),
                                backgroundImage: NetworkImage(
                                    "https://gravatar.com/avatar/be640562c459aef01642f3165abb33f8?s=400&d=robohash&r=x"),
                                radius: 30,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              BlocBuilder<GlobalBloc, GlobalState>(
                                builder: (context, state) {
                                  return Text(
                                    'Hola, ${state.user!.name} ${state.user!.surName}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 16,
                          thickness: 1.5,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Servicios Tecnicos',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GridView.builder(
                        padding: const EdgeInsets.all(0),
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: listButton.length,
                        itemBuilder: ((context, index) {
                          final data = listButton[index];
                          return InkWell(
                            onTap: data.onPressed,
                            child: Container(
                              width: 60,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color.fromRGBO(245, 246, 248, 1.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF4056C6).withOpacity(.15),
                                    blurRadius: 15,
                                    offset: Offset(0, 5),
                                  )
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    data.iconData,
                                    color: Color.fromRGBO(64, 108, 108, 1.0),
                                    size: 32,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    data.title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
