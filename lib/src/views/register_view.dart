import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marketool_financer/src/controllers/register_controller.dart';
import 'package:marketool_financer/src/models/register_model.dart';
import 'package:marketool_financer/src/widgets/custom_button.dart';
import 'package:marketool_financer/src/widgets/custom_date_picker.dart';
import 'package:marketool_financer/src/widgets/custom_form_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final RegisterController _controller = RegisterController();
  final _nameController = TextEditingController();
  final _cpfController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKeyStep1 = GlobalKey<FormState>();
  final _formKeyStep2 = GlobalKey<FormState>();
  final _formKeyStep3 = GlobalKey<FormState>();
  DateTime? birthDate;
  String? birthDateError;
  DateTime _selectedDate = DateTime.now();
  int currentPage = 1;
  bool isLoading = false;

  void _handleRegister() async {
    final registration = RegisterModel(
      fullName: _nameController.text,
      cpf: _cpfController.text,
      birthDate: _selectedDate,
      email: _emailController.text,
      password: _controller.passwordController.text,
    );

    final register = await _controller.register(registration);

    if (!mounted) return;

    if (register) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: Duration(milliseconds: 1800),
          backgroundColor: Colors.green,
          content: Text("Cadastro Realizado com Sucesso"),
        ),
      );
      await Future.delayed(Duration(seconds: 2));
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, "/login");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          content: Text("Falha ao Cadastrar. Tente Novamente!"),
        ),
      );
    }
  }

  void _textButtonAction() {
    switch (currentPage) {
      case 1:
        Navigator.pushReplacementNamed(context, "/login");
        break;

      case 2:
        setState(() {
          --currentPage;
        });

      case 3:
        setState(() {
          --currentPage;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF001F1A), Color(0xFF0E1E1B)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Cadastro - $currentPage/3',
            style: TextStyle(
              fontFamily: "RobotoMono",
              color: Color(0xFFF8F9F7),
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xFF2E7D32),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(right: 25),
                child: Image.asset(
                  "assets/images/welcomePng.png",
                  width: 200,
                  height: 240,
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 100),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
                child: Container(
                  key: ValueKey<int>(currentPage),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white10),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: _getCurrentStepWidget(),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: _textButtonAction,
                child: Text(
                  "Voltar",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getCurrentStepWidget() {
    switch (currentPage) {
      case 1:
        return _registerStep_01();
      case 2:
        return _registerStep_02();
      case 3:
        return _registerStep_03();
      default:
        return _registerStep_01();
    }
  }

  Widget _registerStep_01() {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Form(
          key: _formKeyStep1,
          child: Column(
            children: [
              CustomFormField(
                text: "Nome Completo",
                icon: Icon(Icons.person, color: Colors.white70),
                type: TextInputType.text,
                isObscure: false,
                inputController: _nameController,
                inputValidator: _controller.validateName,
              ),
              SizedBox(height: 15),
              CustomDatePicker(
                controller: _birthDateController,
                selectedDate: _selectedDate,
                label: "Data de Nascimento",
                initialDate: _selectedDate,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                icon: Icon(Icons.calendar_today, color: Colors.white70),
                onChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                  final formatter = DateFormat('dd/MM/yyyy');
                  _birthDateController.text = formatter.format(_selectedDate);
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                label: "Próximo",
                onPressed: () {
                  if (_formKeyStep1.currentState!.validate()) {
                    setState(() {
                      ++currentPage;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerStep_02() {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Form(
          key: _formKeyStep2,
          child: Column(
            children: [
              CustomFormField(
                text: "E-mail",
                icon: Icon(Icons.email, color: Colors.white70),
                type: TextInputType.emailAddress,
                isObscure: false,
                inputController: _emailController,
                inputValidator: _controller.validateEmail,
              ),
              SizedBox(height: 15),
              CustomFormField(
                text: "Nº Celular",
                icon: Icon(Icons.phone, color: Colors.white70),
                type: TextInputType.phone,
                isObscure: false,
                inputController: _phoneController,
                inputValidator: _controller.validatePhone,
              ),
              SizedBox(height: 20),
              CustomButton(
                label: "Próximo",
                onPressed: () {
                  if (_formKeyStep2.currentState!.validate()) {
                    setState(() {
                      ++currentPage;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerStep_03() {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Form(
          key: _formKeyStep3,
          child: Column(
            children: [
              CustomFormField(
                text: "Escolha uma Senha",
                icon: Icon(Icons.password, color: Colors.white70),
                type: TextInputType.text,
                isObscure: true,
                inputController: _controller.passwordController,
                inputValidator: _controller.validatePassword,
              ),
              SizedBox(height: 15),
              CustomFormField(
                text: "Confirme a Senha",
                icon: Icon(Icons.password, color: Colors.white70),
                type: TextInputType.text,
                isObscure: true,
                inputController: _confirmPasswordController,
                inputValidator: _controller.validateConfirmPassword,
              ),
              SizedBox(height: 20),
              CustomButton(
                label: "Finalizar",
                onPressed: () {
                  /// Será implementado a inserção dos cadastro no banco de dados
                  if (_formKeyStep3.currentState!.validate()) {
                    _handleRegister();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
