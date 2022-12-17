import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techn_app/core/bloc/global_bloc.dart';
import 'package:techn_app/features/home/presentation/pages/home_page.dart';
import 'package:techn_app/features/login/presentation/pages/login_pages.dart';

class OnbordingPage extends StatefulWidget {
  const OnbordingPage({Key? key}) : super(key: key);

  @override
  _OnbordingPageState createState() => _OnbordingPageState();
}

class _OnbordingPageState extends State<OnbordingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            context
                .read<GlobalBloc>()
                .add(UserEvent(idUser: snapshot.data!.uid));
            return HomePage();
          } else {
            return LoginPages();
          }
        }),
      ),
    );
  }
}
