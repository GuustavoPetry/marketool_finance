import 'package:flutter/material.dart';

class UserCardModel extends InheritedWidget {
  final String username;
  const UserCardModel({super.key, 
    required this.username,
    required super.child, // widget filho que herda o nome
  }); // passa o filho para o construtor pai

  /// Este método estático pode ser chamado independente de termos instanciado o
  /// objeto ou não.
  ///
  /// Definimos um método estático chamado 'of'
  /// Isso significa que você pode chamar UserData.of(context) sem precisar de
  /// uma instância de UserData.
  ///
  /// Quem chamar vai receber um BuildContext, ou seja, o contexto onde o widget
  /// está na árvore.
  static UserCardModel of(BuildContext context) {
    /// este método procura o widget mais próximo do tipo UserData acima do
    /// widget atual
    final result = context.dependOnInheritedWidgetOfExactType<UserCardModel>();
    return result!;
  }

  @override
  bool updateShouldNotify(UserCardModel oldWidget) {
    return oldWidget.username != username;
  }
}