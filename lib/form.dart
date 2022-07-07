import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormWidget extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  FormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (text) {
              final exp =
                  RegExp(r"^([\w\.-_]+)(@+)([\w]+)((\.+\w{2,3}){1,2})$");
              if (!exp.hasMatch(text ?? '')) {
                return 'Email invalido!';
              }

              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'CPF',
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: [
              MaskTextInputFormatter(
                  mask: '###.###.###-##',
                  filter: {"#": RegExp(r'[\dxX]')},
                  type: MaskAutoCompletionType.lazy)
            ],
            validator: (text) {
              final exp =
                  RegExp(r"(\d{3})+\.?(\d{3})+\.?(\d{3})+-?([\dxX]{1,2})+");
              if (!exp.hasMatch(text ?? '')) {
                return 'CPF invalido!';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              formKey.currentState!.validate();
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
