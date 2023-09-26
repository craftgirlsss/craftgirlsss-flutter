import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/buttons/elevatedbuttons.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/textfields/emailtextinput.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailC = TextEditingController();
  final passwordC1 = TextEditingController();
  final passwordC2 = TextEditingController();
  bool invisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffcb9),
      appBar: kAppBar(context, isTitle: false),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: Center(
              child: Text(
                "Craftgirlsss",
                style: title(fontSize: 46, color: Colors.black),
              ),
            ),
          ),
          Text(
            "Buat Akun",
            style: title(fontSize: 32, color: Colors.black),
          ),
          const SizedBox(height: 10),
          kTextField(controller: emailC),
          const SizedBox(height: 18),
          TextField(
            controller: passwordC1,
            style: title(fontSize: 20, color: Colors.black),
            obscureText: invisible,
            keyboardType: TextInputType.emailAddress,
            obscuringCharacter: "*",
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              suffix: IconButton(
                onPressed: () {
                  setState(
                    () {
                      invisible = !invisible;
                    },
                  );
                },
                icon: Icon(
                  invisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black,
                ),
              ),
              filled: true, //<-- SEE HERE
              labelStyle: title(color: Colors.black, fontSize: 20),
              labelText: "Kata sandi",
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          TextField(
            controller: passwordC2,
            style: title(fontSize: 20, color: Colors.black),
            obscureText: invisible,
            keyboardType: TextInputType.emailAddress,
            obscuringCharacter: "*",
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              suffix: IconButton(
                onPressed: () {
                  setState(
                    () {
                      invisible = !invisible;
                    },
                  );
                },
                icon: Icon(
                  invisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black,
                ),
              ),
              filled: true, //<-- SEE HERE
              labelStyle: title(color: Colors.black, fontSize: 20),
              labelText: "Ulangi kata sandi",
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: kButtons(context,
                backgroundColor: Colors.green.shade500,
                fonSize: 19,
                label: "Daftar",
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
