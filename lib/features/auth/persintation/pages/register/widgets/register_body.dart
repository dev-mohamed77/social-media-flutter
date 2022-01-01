import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socailmedia/core/componants/default_button.dart';
import 'package:socailmedia/core/componants/text_feild.dart';
import 'package:socailmedia/core/utils/color_manager.dart';
import 'package:socailmedia/core/utils/dialog.dart';
import 'package:socailmedia/features/auth/persintation/manager/register_manager/cubit/register_cubit.dart';
import 'package:socailmedia/features/auth/persintation/manager/register_manager/cubit/register_state.dart';
import 'package:socailmedia/features/auth/persintation/pages/login/login_screen.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ShowDialog _showDialog = ShowDialog();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterStateLoading) {
          _showDialog.show(context);
        } else {
          _showDialog.hide();
        }
        if (state is RegisterStateError) {
          ShowDialog.showToast(message: state.failure.message);
        }
        if (state is RegisterStateSuccess) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const LoginScreen()));
          ShowDialog.showToast(message: state.registerModel.message!);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Register via your company email to connect with the people of your company.",
                  style: TextStyle(
                    fontSize: 14,
                    color: ConfigColor.kgreyColor,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      DefaultTextField(
                        hintText: "Username",
                        controller: _usernameController,
                        valid: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Some Text";
                          }
                          return null;
                        },
                        keyType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultTextField(
                        hintText: "Email",
                        controller: _emailController,
                        valid: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Email";
                          }
                          return null;
                        },
                        keyType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultTextField(
                        hintText: "Phone",
                        controller: _phoneController,
                        valid: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Phone";
                          }
                          return null;
                        },
                        keyType: TextInputType.phone,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultTextField(
                        hintText: "Password",
                        controller: _passwordController,
                        valid: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Password";
                          }
                          return null;
                        },
                        keyType: TextInputType.visiblePassword,
                        iconSuffix: RegisterCubit.of(context).isShowPassRegister
                            ? Icons.visibility
                            : Icons.visibility_off,
                        isPass: true,
                        isShowPassword:
                            RegisterCubit.of(context).isShowPassRegister,
                        onClickSuffix: () {
                          RegisterCubit.of(context).changeShowPassRegister();
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultButton(
                        text: "Register",
                        onClick: () {
                          if (_formKey.currentState!.validate()) {
                            RegisterCubit.of(context).register(
                              _usernameController.text,
                              _passwordController.text,
                              _emailController.text,
                              _phoneController.text,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
