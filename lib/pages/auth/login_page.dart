import 'package:bls/customs/input_decoration/input_decoration.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> resetForm = GlobalKey<FormBuilderState>();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Authenticate"),
      ),
      body: FormBuilder(
        key: formKey,
        onChanged: () {
          formKey.currentState!.validate();
        },
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                "Login",
                textScaleFactor: 2.5,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 30,
            ),
            FormBuilderTextField(
                name: "email",
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
                keyboardType: TextInputType.emailAddress,
                decoration: inputDecoration(
                    hintText: "Email",
                    isRequired: true,
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.blue,
                      size: 25,
                    ))),
            const SizedBox(
              height: 20,
            ),
            FormBuilderTextField(
              name: "password",
              keyboardType: TextInputType.text,
              obscureText: obscureText,
              decoration: inputDecoration(
                  hintText: "Password",
                  isRequired: true,
                  suffix: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                        splashRadius: 30,
                        onPressed: () {
                          obscureText = !obscureText;
                          setState(() {});
                        },
                        icon: Icon(
                          obscureText ? Icons.visibility : Icons.visibility_off,
                          size: 30,
                        )),
                  ),
                  prefixIcon: Icon(
                    Icons.lock_rounded,
                    size: 25,
                    color: Colors.orange.shade700,
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            FloatingActionButton.extended(
                heroTag: "submit",
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    // Map<String, dynamic> data = formKey.currentState!.fields;
                    // Map newData =
                    //     data.map((key, value) => MapEntry(key, value.value));
                  }
                },
                icon: const Icon(Icons.login),
                label: const Text("Submit")),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Get.dialog(AlertDialog(
                    scrollable: true,
                    title: const Text(
                      "Reset",
                      textScaleFactor: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    content: FormBuilder(
                      key: resetForm,
                      child: FormBuilderTextField(
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                        name: "email",
                        decoration: inputDecoration(
                            hintText: "Email", isRequired: true),
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Get.back(closeOverlays: true);
                          },
                          child: const Text("Cancel")),
                      ElevatedButton(
                          onPressed: () {
                            if (resetForm.currentState!.validate()) {
                              // String email = resetForm
                              //     .currentState!.fields['email']!.value;
                            }
                          },
                          child: const Text("Send Reset Mail"))
                    ],
                  ));
                },
                child: const Text("Reset Password"))
          ],
        ),
      ),
    );
  }
}
