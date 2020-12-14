<h1 align="center">
  MovieApp - TheMovieDB
</h1>

# :rocket: Como rodar o app?

1. Certifique-se de ter o Flutter instalado: https://flutter.dev/

2. Faça o clone do projeto e vá para a pasta raiz.

3. Execute o comando `flutter pub get` para baixar as dependências.

4. Certifique-se de ter um emulador iniciado ou um celular plugado com as Ferramentas de Desenvolver ativadas.

5. Pronto. Para rodar em modo debug, execute o comando `flutter run` ou em modo release `flutter run --release`. Para gerar o apk, execute `flutter build apk`.

# :computer: Implementação

## Tecnologias utilizadas

1. Flutter Modular [https://github.com/Flutterando/modular] para Injeção de Dependências.
2. Mobx [https://pub.dev/packages/mobx] para state management.
3. Slidy [https://github.com/Flutterando/slidy] como ferramenta. 
4. Dio [https://pub.dev/packages/dio] para requisições HTTP.

Gosto muito da estruturação abordada no Modular (inspirado no Angular) e da simplicidade ao lidar com reatividade com o Mobx. Slidy não faz parte da implementação, mas é uma ferramente que agiliza bastante o processo de criação de Pages, Modules, etc.. A comunidade do Flutterando tem feito um ótimo trabalho na manutenção dessas ferramentas.

## Arquitetura
Tenho estudado cada vez mais organização e estruturação de projeto de forma que seja mantível e escalável. O Clean Architecture promove a implementação independente de cada camada da aplicação facilitando a manutenção do projeto.  

Referências:
1. Flutter, TDD, Clean Architecture, SOLID e Design Patterns
 [https://www.udemy.com/course/flutter-com-mango/]
2. Flutter TDD Clean Architecture Course [https://www.youtube.com/watch?v=KjE2IDphA_U&list=PLB6lc7nQ1n4iYGE_khpXRdJkJEp9WOech]
3. Clean Dart [https://github.com/Flutterando/Clean-Dart]

## Estrutura de arquivos:
```
├── lib
│   ├── app
|   |   ├── shared
│   │   └── modules
│   ├── core
│   ├── data
│   │   ├── repositories
│   │   ├── models
│   │   └── http
│   ├── domain
│   │   ├── entities
│   │   ├── helpers
│   │   ├── repositories
│   │   └── usecases
│   ├── infra
│   │   └── dio
│   └── shared

```

## Abstração:
<img src="https://github.com/Flutterando/Clean-Dart/raw/master/imgs/img1.png" />

Obs.: Optei por chamar de `data` o que na imagem é chamado de `infra` e de `infra` o que é chamado de `external`.


## :mailbox_with_mail: Licença

Este projeto foi criado para estudo, sinta-se a vontade para testá-lo e utilizá-lo.
