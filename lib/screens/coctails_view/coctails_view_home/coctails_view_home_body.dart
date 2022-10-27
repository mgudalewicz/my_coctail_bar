import 'package:flutter/material.dart';
import 'package:my_coctail_bar/models/coctail/coctail.dart';
import 'package:my_coctail_bar/screens/coctails_view/coctails_view_home/cubit/coctails_view_home_cubit.dart';

class CoctailViewHomeBody extends StatefulWidget {
  const CoctailViewHomeBody({
    super.key,
    required this.state,
  });

  final CoctailViewHomeInfoState state;

  @override
  State<CoctailViewHomeBody> createState() => _CoctailViewHomeBodyState();
}

class _CoctailViewHomeBodyState extends State<CoctailViewHomeBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _coctailsList(context, widget.state.coctails),
        ],
      ),
    );
  }

  Widget _coctailsList(BuildContext context, List<Coctail> coctails) {
    return Expanded(
      child: ListView(
        children: [
          for (final coctail in coctails) ...[
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: 63,
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  const SizedBox(height: 5),
                  Text(
                    coctail.name,
                    style: const TextStyle(fontSize: 20.0),
                    maxLines: 1,
                  ),
                  Text(
                    _strength(coctail.strength),
                    style: const TextStyle(fontSize: 16.0),
                    maxLines: 1,
                  ),
                  const Divider(color: Colors.grey),
                ]),
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _strength(int strenght) {
    if (strenght == 0) {
      return 'bezalkoholowy';
    } else if (strenght < 10) {
      return 'słaby';
    } else if (strenght < 20) {
      return 'średni';
    } else {
      return 'mocny';
    }
  }
}
