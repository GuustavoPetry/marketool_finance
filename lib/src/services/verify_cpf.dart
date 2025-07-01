class VerifyCPF {
  
  // Verifica se o documento informado está no comprimento correto
  bool verifyLength(String documentNumber) {
    if(documentNumber.length == 11) {
      return true;
    }
    return false;
  }

  // Faz a formatação da String informada, retirando possíveis caracteres especiais
  String formatDocument(String documentNumber) {
    return documentNumber
    .split('')
    .where((char) => int.tryParse(char) != null)
    .join();
  }

  // Realiza o cálculo do verificador 1
  int calculateChecker1(String documentNumber) {
    int checker1;
    int sum = 0;

    int multiplier = 10;
    for(int i = 0; i < 9; i++) {
      sum += int.parse(documentNumber[i]) * multiplier;
      multiplier--;
    }

    if(sum % 11 == 0 || sum % 11 == 1) {
      checker1 = 0;
    } else {
      checker1 = 11 - (sum % 11);
    }

    return checker1;
  }

  // Realiza o cálculo do verificador 2
  int calculateChecker2(String documentNumber) {
    int checker2;
    int sum = 0;

    int multiplier = 10;
    for(int i = 1; i < 10; i++) {
      sum += int.parse(documentNumber[i]) * multiplier;
      multiplier--;
    }

    if(sum % 11 == 0 || sum % 11 == 1) {
      checker2 = 0;
    } else {
      checker2 = 11 - (sum % 11);
    }

    return checker2;
  }

  // Verifica se todos os carácteres informados são iguais
  bool allEqual(String documentNumber) {
    bool allEqual = true;

    for(int i = 1; i < documentNumber.length; i++) {
      if(documentNumber[i] == documentNumber[i-1]) {
        continue;
      } else {
        allEqual = false;
        break;
      }
    }

    return allEqual;
  }
  
  // Faz a verificação do documento
  bool isValid(String documentNumber) {
    documentNumber = formatDocument(documentNumber);

    if(!verifyLength(documentNumber)) {
      return false;
    }
    
    if(int.parse(documentNumber[9]) == calculateChecker1(documentNumber) && 
      int.parse(documentNumber[10]) == calculateChecker2(documentNumber) &&
      !allEqual(documentNumber)) {
      return true;
    }

    return false;
  }
}

