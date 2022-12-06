import 'package:flutter/material.dart';

class AddPhone extends StatelessWidget {
  const AddPhone({Key? key, this.onTapCamare, this.onTapGallery}) : super(key: key);
  final Function()? onTapCamare;
  final Function()? onTapGallery;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ListTile(
          leading: const Icon(Icons.camera_alt),
          title: const Text('Cámara'),
          onTap: onTapCamare,
        ),
        ListTile(
          leading: const Icon(Icons.photo_album),
          title: const Text('Galería'),
          onTap: onTapGallery,
        ),
      ],
    );
  }
}
