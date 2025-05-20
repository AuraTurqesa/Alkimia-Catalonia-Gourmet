import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'form_viewmodel.dart';

class FormulariContacte extends StatelessWidget {
  const FormulariContacte({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FormViewModel(),
      child: const _FormulariView(),
    );
  }
}

class _FormulariView extends StatelessWidget {
  const _FormulariView();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<FormViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Formulari de contacte')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Nom'),
              onChanged: (value) => model.nom = value,
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(labelText: 'Telèfon (opcional)'),
              keyboardType: TextInputType.phone,
              onChanged: (value) => model.telefon = value,
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(labelText: 'Correu electrònic'),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => model.email = value,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: model.paisSeleccionat,
              decoration: const InputDecoration(labelText: 'País'),
              items: model.paisos
                  .map((pais) => DropdownMenuItem(value: pais, child: Text(pais)))
                  .toList(),
              onChanged: model.setPais,
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: model.ciutatSeleccionada,
              decoration: const InputDecoration(labelText: 'Ciutat'),
              items: model.ciutatsDisponibles
                  .map((ciutat) => DropdownMenuItem(value: ciutat, child: Text(ciutat)))
                  .toList(),
              onChanged: model.setCiutat,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: model.origen,
              decoration: const InputDecoration(labelText: 'Com ens has conegut?'),
              items: model.comEnsHasConegut
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: model.setOrigen,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Aquí pots afegir validacions o enviar el formulari
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Formulari enviat!')),
                );
              },
              child: const Text('Enviar'),
            )
          ],
        ),
      ),
    );
  }
}
