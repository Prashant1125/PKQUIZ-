import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pkquiz/profile.dart';

import 'forget.dart';
import 'login.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var firebaseAuth = FirebaseAuth.instance;

  var namController = TextEditingController();
  var emailController = TextEditingController();
  var pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Color.fromARGB(255, 4, 93, 7), width: 5)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://i.pinimg.com/564x/15/c8/2f/15c82fa8cc0198c588ca11cf43048619.jpg'),
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(child: CircularProgressIndicator());
                          },
                          errorBuilder: (context, Object, stackTrace) {
                            return Container(
                              child: Icon(
                                Icons.error_outline,
                                color: Colors.red,
                              ),
                            );
                          }),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Column(
                  children: [
                    CustomTextField(
                      controller: namController,
                      labelText: 'Your Name',
                      hintText: 'Enter your name',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: emailController,
                      labelText: 'Email',
                      hintText: 'Enter Email Id',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // CustomTextField(
                    //   controller: pwdController,
                    //   labelText: 'Password',
                    //   hintText: 'Reset Password',
                    // ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Forget(),
                              ),
                            );
                          },
                          child: const Text(
                            'Reset Password',
                            style: TextStyle(fontSize: 18, color: Colors.blue),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    'Update Profile',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () async {
                    await firebaseAuth.currentUser!
                        .updateEmail(emailController.text)
                        .then((value) => firebaseAuth.currentUser!
                            .updateDisplayName(namController.text)
                            .then((value) =>
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const ProfileView(),
                                  ),
                                )));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
