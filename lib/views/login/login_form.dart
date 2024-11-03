import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:skyclient/global/form.dart';
import 'package:skyclient/global/nav/nav_controller.dart';
import 'package:skyclient/global/styles.dart';
import 'package:skyclient/main.dart';
import 'package:skyclient/views/login/login_controller.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    fToast.init(context);

    return SizedBox(
      width: 400,
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Visibility(visible: false, child: RegisterForm()),
            Visibility(visible: true, child: Login()),
            Visibility(visible: false, child: ProgressForm()),
          ])),
    );
  }
}

class Login extends GetView<LoginController> {
  final formKey = GlobalKey<FormState>();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Container(
          width: 400,
          child: Column(children: [
            const Text(
              'Login',
              style: formTitleStyle,
            ),
            const SizedBox(height: 12),
            InputField(
              labelText: "Username",
              initialValue: "",
              valueSetter: (val) {
                controller.username = val;
              },
            ),
            const SizedBox(height: 12),
            PasswordField(
              labelText: "Password",
              initialValue: "",
              valueSetter: (val) {
                controller.password = val;
              },
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: buttonStyle,
                  onPressed: () {
                    formKey.currentState!.save();
                    // if (clientId.isEmpty) {
                    //   showWarningToast(fToast, "This client is not registered");
                    //   return;
                    // }

                    // loginController.login(clientId).then((res) {

                    // });
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),
          ]),
        ));
  }
}

class RegisterForm extends GetView<LoginController> {
  final formKey = GlobalKey<FormState>();

  RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Register',
            style: formTitleStyle,
          ),
          const SizedBox(height: 12),
          InputField(
            labelText: "Registration Code",
            initialValue: "",
            valueSetter: (val) {
              controller.regCode = val;
            },
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              formKey.currentState!.save();

              // loginController.sendRegistrationCode();
            },
            child: const Text("Submit"),
          ),
          const SizedBox(height: 12),
          // Text(
          //   "Connected to ${Api.webalmond}",
          //   style: const TextStyle(fontStyle: FontStyle.italic),
          // )
        ],
      ),
    );
  }
}

class ProgressForm extends GetView<LoginController> {
  final formKey = GlobalKey<FormState>();

  ProgressForm({super.key});

  @override
  Widget build(BuildContext context) {
    final double progress = 0;

    return SizedBox(
      width: 100,
      height: 100,
      child: CircularProgressIndicator(
        value: progress,
        backgroundColor: Colors.amber,
        strokeWidth: 10,
        strokeCap: StrokeCap.square,
      ),
    );
  }
}
