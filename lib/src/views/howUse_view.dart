import 'package:flutter/material.dart';
import 'package:marketool_financer/src/widgets/custom_button.dart';

class HowUsePage extends StatefulWidget {
  const HowUsePage({super.key});

  @override
  State<HowUsePage> createState() => _HowUsePageState();
}

class _HowUsePageState extends State<HowUsePage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Como usar o app?',
          style: TextStyle(fontFamily: "RobotoMono", color: Color(0xFFF8F9F7)),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF2E7D32),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xFF2E7D32),
        width: double.infinity,
        height: 50,
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _registerStep_01(),
          _registerStep_02(),
          _registerStep_03(),
        ],
      ),
    );
  }

  Widget _registerStep_01() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(45),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Aliquam commodo fermentum lorem ut porttitor. '
                'Curabitur sagittis purus sed erat malesuada, nec posuere elit tincidunt.'
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Aliquam commodo fermentum lorem ut porttitor. '
                'Curabitur sagittis purus sed erat malesuada, nec posuere elit tincidunt.'                ,
                style: TextStyle(fontSize: 16, fontFamily: 'RobotoMono'),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 25),
              CustomButton(
                label: "Próximo",
                onPressed: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

 Widget _registerStep_02() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 280,
              height: 150,
              color: Colors.black,
            ),

            const SizedBox(height: 20),
            Container(
              width: 280,
              height: 150,
              color: Colors.black,
            ),

            const SizedBox(height: 40),

            CustomButton(
              label: "Próximo",
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}


  Widget _registerStep_03() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'At vero eos et accusamus et iusto odio dignissimos ducimus '
                'qui blanditiis praesentium voluptatum deleniti atque corrupti.'
                'At vero eos et accusamus et iusto odio dignissimos ducimus '
                'qui blanditiis praesentium voluptatum deleniti atque corrupti.'                
                'qui blanditiis praesentium voluptatum deleniti atque corrupti.'                
                'qui blanditiis praesentium voluptatum deleniti atque corrupti.'                
                'qui blanditiis praesentium voluptatum deleniti atque corrupti.',
                style: TextStyle(fontSize: 16, fontFamily: 'RobotoMono'),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 40),
              CustomButton(
                label: "Finalizar",
                onPressed: () {
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
