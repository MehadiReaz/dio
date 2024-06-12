import 'package:flutter/material.dart';

class CustomAttachmentButton extends StatelessWidget {
  const CustomAttachmentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 1, color: Colors.black)),
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.attach_file_rounded, color: Colors.blue,),
            SizedBox(width: 5,),
            Text('Attachment',style: TextStyle(color: Colors.blue),)
          ],
        ),
      ),
    );
  }
}
