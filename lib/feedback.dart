import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FeedbackDialog extends StatefulWidget {
  const FeedbackDialog({Key? key}) : super(key: key);

  @override
  State<FeedbackDialog> createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  var firebaseDb = FirebaseFirestore.instance;
  var firebaseAuth = FirebaseAuth.instance;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintText: 'Enter your feedback here',
            filled: true,
          ),
          maxLines: 5,
          maxLength: 4096,
          textInputAction: TextInputAction.done,
          validator: (String? text) {
            if (text == null || text.isEmpty) {
              return 'Please enter a value';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
            child: const Text('Send'),
            onPressed: () async {
              firebaseDb.collection("feedbacks").add({
                "id": 0,
                "userName": firebaseAuth.currentUser?.displayName,
                "userId": firebaseAuth.currentUser?.uid,
                "useEmail": firebaseAuth.currentUser?.email,
                "usePhotoUrl": firebaseAuth.currentUser?.photoURL,
                "feedback": _controller.text,
                "date": DateTime.now(),
              }).then((value) {
                Fluttertoast.showToast(msg: "Feedback submitted successfully");
                Navigator.pop(context);
              }).onError((error, stackTrace) {
                Fluttertoast.showToast(msg: error.toString());
                Navigator.pop(context);
              });
            })
      ],
    );
  }
}
