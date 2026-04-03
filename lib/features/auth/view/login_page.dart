import 'package:flutter/material.dart';
import 'package:projeto02/app/routes/app_routes.dart';
import 'package:projeto02/features/auth/viewmodel/login_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //String _texto = "DDM";

  //void clicar() {
  //setState(() {
  //_texto = "DDM - Aula 1.5x";
  //});
  //print("[LOG] => Botão => Ir para Cadastro");
  //}

  late final LoginViewmodel viewmodel;

  @override
  void initState() {
    super.initState();
    viewmodel = LoginViewmodel();
  }

  @override
  void dispose() {
    viewmodel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewmodel,
      builder: (_, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Login"),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Form(
                key: viewmodel.formKey,
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
                      "Bem-vindo!",
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
                      "Faça login para continuar:",
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
                      controller: viewmodel.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      validator: viewmodel.emailValidator,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: viewmodel.passwordController,
                      obscureText: viewmodel.obscurePassword,
                      validator: viewmodel.passwordValidator,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          onPressed: viewmodel.togglePasswordVisibility,
                          icon: Icon(
                            viewmodel.obscurePassword
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
                        onPressed: viewmodel.isLoading
                            ? null
                            : () => viewmodel.onLoginPressed(context),
                        child: viewmodel.isLoading
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
