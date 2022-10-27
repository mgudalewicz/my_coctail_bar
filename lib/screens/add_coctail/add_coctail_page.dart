import 'package:flutter/material.dart';
import 'package:my_coctail_bar/widget/widget_text_form_field.dart';

class AddCoctail extends StatelessWidget {
  const AddCoctail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            WidgetTextFormField(
              labelText: 'Nazwa koktajlu',
            )
          ],
        ),
      ),
    );
  }
}
