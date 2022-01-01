import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socailmedia/core/componants/default_button.dart';
import 'package:socailmedia/core/utils/dialog.dart';
import 'package:socailmedia/core/componants/text_feild.dart';
import 'package:socailmedia/core/utils/color_manager.dart';
import 'package:socailmedia/features/auth/persintation/manager/login_manager/cubit/login_cubit.dart';
import 'package:socailmedia/features/auth/persintation/manager/login_manager/cubit/login_state.dart';
import 'package:socailmedia/features/auth/persintation/pages/register/register_screen.dart';
import 'package:socailmedia/features/home/presintation/pages/home_screen.dart';

class LoginBody extends StatelessWidget {
  LoginBody({Key? key}) : super(key: key);

  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final ShowDialog _showDialog = ShowDialog();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginStateLoading) {
          _showDialog.show(context);
        } else {
          _showDialog.hide();
        }
        if (state is LoginStateError) {
          ShowDialog.showToast(message: state.failure.message);
        }
        if (state is LoginStateSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Login for new account, enter your email and get started.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ConfigColor.kgreyColor,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      DefaultTextField(
                        controller: _userNameController,
                        hintText: "Username",
                        keyType: TextInputType.name,
                        valid: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Some Text";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultTextField(
                        controller: _passwordController,
                        hintText: "Password",
                        isPass: true,
                        iconSuffix: Icons.visibility,
                        isShowPassword: LoginCubit.of(context).isShowPass,
                        onClickSuffix: () {
                          LoginCubit.of(context).changeStatePass();
                        },
                        keyType: TextInputType.visiblePassword,
                        valid: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Password";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultButton(
                        onClick: () {
                          if (_formKey.currentState!.validate()) {
                            LoginCubit.of(context).login(
                              _userNameController.text,
                              _passwordController.text,
                            );
                          }
                        },
                        text: 'Login',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "If you are new /",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const RegisterScreen(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: const Text("Create Now"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
