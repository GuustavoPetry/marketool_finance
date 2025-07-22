import 'package:flutter/material.dart';
import 'package:marketool_financer/src/controllers/register_controller.dart';
import 'package:marketool_financer/src/widgets/custom_app_bar.dart';
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
  final PageController _pageController = PageController();
  DateTime _selectedDate = DateTime.now();
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: const Color(0xFF002B23),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 26, 24, 24),
          title: Text('Cadastro $currentPage/3', style: TextStyle(color: Colors.white),),
          iconTheme: IconThemeData(color: Colors.white),
          automaticallyImplyLeading: true
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(right: 25),
                child: Image.asset(
                  "assets/images/welcomePng.png",
                  width: 250,
                  height: 250,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: PageView(
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    _registerStep_01(),
                    _registerStep_02(),
                    _registerStep_03(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerStep_01() {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomFormField(
              text: "Nome Completo",
              icon: Icon(Icons.person),
              type: TextInputType.text,
              isObscure: false,
              inputController: _controller.nameController,
              inputValidator: _controller.validateName,
            ),
            SizedBox(height: 20),
            CustomDatePicker(
              selectedDate: _selectedDate,
              label: "Data de Nascimento",
              icon: Icon(Icons.calendar_today),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              onChanged: (newDate) {
                setState(() {
                  _selectedDate = newDate;
                });
              },
            ),
            SizedBox(height: 30),
            CustomButton(
              label: "Próximo",
              onPressed: () {
                setState(() {
                  ++currentPage;
                });
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/login");
              },
              child: Text(
                "Voltar",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerStep_02() {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomFormField(
              text: "E-mail",
              icon: Icon(Icons.email),
              type: TextInputType.emailAddress,
              isObscure: false,
              inputController: _controller.emailController,
              inputValidator: _controller.validateEmail,
            ),
            SizedBox(height: 20),
            CustomFormField(
              text: "Nº Celular",
              icon: Icon(Icons.phone),
              type: TextInputType.phone,
              isObscure: false,
              inputController: _controller.phoneController,
              inputValidator: _controller.validatePhone,
            ),
            SizedBox(height: 30),
            CustomButton(
              label: "Próximo",
              onPressed: () {
                setState(() {
                  ++currentPage;
                });
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                setState(() {
                  --currentPage;
                });
                _pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Text(
                "Voltar",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerStep_03() {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomFormField(
              text: "Escolha uma Senha",
              icon: Icon(Icons.password),
              type: TextInputType.text,
              isObscure: true,
              inputController: _controller.passwordController,
              inputValidator: _controller.validatePassword,
            ),
            SizedBox(height: 20),
            CustomFormField(
              text: "Confirme a Senha",
              icon: Icon(Icons.password),
              type: TextInputType.text,
              isObscure: true,
              inputController: _controller.passwordController,
              inputValidator: _controller.validateConfirmPassword,
            ),
            SizedBox(height: 30),
            CustomButton(
              label: "Finalizar",
              onPressed: () {
                /// Será implementado a inserção dos cadastro no banco de dados
              },
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                setState(() {
                  --currentPage;
                });
                _pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              //
              child: Text(
                "Voltar",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}