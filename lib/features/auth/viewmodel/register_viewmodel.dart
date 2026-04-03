import 'package:flutter/material.dart';
import 'package:projeto02/features/auth/model/user_model.dart';
import 'package:validatorless/validatorless.dart';

class RegisterViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;

  String? emailValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required("Email é obrigatório!"),
      Validatorless.email("Digite um email válido!"),
    ])(value);
  }

  String? passwordValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required("Senha é obrigatória!"),
      Validatorless.min(6, "A senha deve ter pelo menos 6 caracteres!"),
    ])(value);
  }

  String? confirmPasswordValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required("Senha é obrigatória!"),
      Validatorless.min(6, "A senha deve ter pelo menos 6 caracteres!"),
    ])(value);
  }

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<void> onRegisterPressed(BuildContext context) async {
    final formValid = formKey.currentState?.validate() ?? false;

    if (!formValid) {
      return;
    }

    isLoading = true;
    notifyListeners();

    await Future.delayed(
      Duration(seconds: 2),
    );

    final user = UserModel(
      name: "Tester",
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    isLoading = false;
    notifyListeners();

    debugPrint(
      "Usuário cadastrado: ${user.name} / ${user.email} / ${user.password}",
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Cadastro realizado com sucesso para ${user.name}"),
      ),
    );

    Navigator.pop(context);
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }
}
