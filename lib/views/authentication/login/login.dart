import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_hrm/controllers/login_controller.dart';
import '../../../helpers/form_helpers.dart';
import '../../../res/global_widgets/custom_button.dart';
import '../../../res/style/themes.dart';
import '../../getstarted/get_started_screen.dart';

class LoginScreen extends StatelessWidget {
  final String company;
//  final int selectedIndex;
  LoginScreen({
    super.key,
    required this.company,
    // required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final formkey = GlobalKey<FormState>();

    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: Center(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () async {
                          SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                          await prefs.remove("baseUrl");
                          await prefs.remove("key");
                          await prefs.remove("company");
                          // customToast(msg: 'Clear cached');
                          Get.offAll(()=> GetStartedScreen());
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => GetStartedScreen()),
                          // );
                        },
                        icon: Icon(
                          Icons.cached,
                          size: 35,
                        )),
                    Column(
                      children: [
                        // Image.asset(ImageManager.logo),
                        TextFormat.bold(text: 'Welcome Back!'),
                        TextFormat.bold(
                          text: '${company.toString()}',
                          textColor: Colors.black.withOpacity(.7),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        // Login Form
                        Form(
                          key: formkey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          // key: controller.globalKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                labelText: 'Email',
                                hintText: 'Enter your email',
                                controller: controller.email.value,
                                prefixIcon: Icons.email_outlined,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'The email filed is required';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomTextField(
                                labelText: 'Password',
                                keyboardType: TextInputType.visiblePassword,
                                controller: controller.password.value,
                                hintText: 'Enter account password',
                                suffixIcon: Icon(Icons.visibility),
                                prefixIcon: Icons.lock_outline_rounded,
                                isSecured: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'The password filed is required';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // Continue Button
                        CustomButton(
                          // isLoading: controller.isLoading.value,
                          buttonTitle: 'Continue',
                          onTap: ()  {
                           if (formkey.currentState!.validate()) {
                                controller.login(company);
                              }
                          }
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
