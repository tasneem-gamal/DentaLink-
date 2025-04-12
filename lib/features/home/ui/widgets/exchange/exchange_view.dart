import 'package:dentalink/core/widgets/general_custom_app_bar.dart';
import 'package:dentalink/features/home/ui/widgets/exchange/exchange_view_body.dart';
import 'package:flutter/material.dart';

class ExchangeView extends StatelessWidget {
  const ExchangeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GeneralCustomAppBar(title: 'Exchange'),
      body: ExchangeViewBody(),
    );
  }
}