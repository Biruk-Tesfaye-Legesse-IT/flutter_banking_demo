import 'package:final_demo/application/bloc/AuthBloc/auth_bloc.dart';
import 'package:final_demo/presentation/screens/client_pages/client_home.dart';
import 'package:final_demo/presentation/screens/client_pages/client_pages_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final inputFieldStyle = InputDecoration(
      border: OutlineInputBorder(),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: MediaQuery.of(context).size.height / 2.3,
                child: Image.asset('assets/images/bankingforLogin.jpg',
                    fit: BoxFit.contain),
              ),
              EmailField(emailTextController: emailTextController),
              SizedBox(height: 20.0),
              PasswordField(
                  passwordTextController: passwordTextController,
                  inputFieldStyle: inputFieldStyle),
              SizedBox(height: 30.0),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (ctx, authState) {
                  if (authState is LoggedIn) {
                    Navigator.of(context).pushNamed('/userhome');
                  }
                },
                builder: (ctx, authState) {
                  Widget buttonChild = Text("Login");

                  if (authState is LoginInprogress) {
                    buttonChild = SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }

                  if (authState is AuthFailed) {
                    buttonChild = Text(authState.errorMsg);
                  }

                  return ElevatedButton(
                    onPressed: () {
                      final authBloc = BlocProvider.of<AuthBloc>(context);

                      authBloc.add(
                        LoginEvent(
                          email: emailTextController.text,
                          password: passwordTextController.text,
                        ),
                      );
                    },
                    child: buttonChild,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({
    Key? key,
    required this.emailTextController,
  }) : super(key: key);

  final TextEditingController emailTextController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailTextController,
      decoration: InputDecoration(
        icon: Icon(Icons.email),
        hintText: "Email",
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
    required this.passwordTextController,
    required this.inputFieldStyle,
  }) : super(key: key);

  final TextEditingController passwordTextController;
  final InputDecoration inputFieldStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      controller: passwordTextController,
      decoration: InputDecoration(
        icon: Icon(Icons.security),
        hintText: "Password",
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:myapp/auth/bloc/auth_bloc.dart';
// import 'package:myapp/auth/bloc/auth_event.dart';
// import 'package:myapp/auth/bloc/auth_state.dart';
// import 'package:myapp/todo/screens/todo_list.dart';

// class LoginScreen extends StatelessWidget {
//   static const String routeName = '/login';

//   LoginScreen({Key? key}) : super(key: key);

//   final emailTextController = TextEditingController();
//   final passwordTextController = TextEditingController();
//   final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final inputFieldStyle = InputDecoration(
//       border: OutlineInputBorder(),
//     );

//     return Scaffold
//   }
// }

