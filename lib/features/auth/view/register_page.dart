import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../viewmodel/register_viewmodel.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterViewModel registerViewmodel;

  @override
  void initState() {
    super.initState();
    registerViewmodel = RegisterViewModel();
  }

  @override
  void dispose() {
    registerViewmodel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: registerViewmodel,
      builder: (_, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Cadastro"),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Form(
                key: registerViewmodel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Icon(
                      Icons.lock_outline,
                      size: 80,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Criar conta!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "Preencha seus dados:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    TextFormField(
                      controller: registerViewmodel.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      validator: registerViewmodel.emailValidator,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: registerViewmodel.passwordController,
                      obscureText: registerViewmodel.obscurePassword,
                      validator: registerViewmodel.passwordValidator,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          onPressed: registerViewmodel.togglePasswordVisibility,
                          icon: Icon(
                            registerViewmodel.obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: registerViewmodel.isLoading
                            ? null
                            : () =>
                                  registerViewmodel.onRegisterPressed(context),
                        child: registerViewmodel.isLoading
                            ? const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Text("ENTRAR"),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Não tem conta?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.register,
                            );
                          },
                          child: Text("Cadastre-se"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
