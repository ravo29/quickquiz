import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/custom_input_field.dart';

class AddQuestionScreen extends StatefulWidget {
  const AddQuestionScreen({super.key});

  @override
  State<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _questionController = TextEditingController();
  final _option1Controller = TextEditingController();
  final _option2Controller = TextEditingController();
  final _option3Controller = TextEditingController();
  final _correctIndexController = TextEditingController();

  @override
  void dispose() {
    _questionController.dispose();
    _option1Controller.dispose();
    _option2Controller.dispose();
    _option3Controller.dispose();
    _correctIndexController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Question validée et enregistrée avec succès !'),
          backgroundColor: Colors.green,
        ),
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouvelle Question'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomInputField(
                label: 'Intitulé de la question',
                hint: 'Ex: Quelle est la capitale de l\'Italie ?',
                controller: _questionController,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Veuillez saisir l\'intitulé de la question.';
                  }
                  if (val.trim().length < 8) {
                    return 'La question doit comporter au moins 8 caractères.';
                  }
                  if (!val.trim().endsWith('?')) {
                    return 'La question doit se terminer par un point d\'interrogation (?).';
                  }
                  return null;
                },
              ),
              CustomInputField(
                label: 'Option 1 (Index 0)',
                hint: 'Ex: Rome',
                controller: _option1Controller,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'L\'option 1 ne peut pas être vide.';
                  }
                  return null;
                },
              ),
              CustomInputField(
                label: 'Option 2 (Index 1)',
                hint: 'Ex: Milan',
                controller: _option2Controller,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'L\'option 2 ne peut pas être vide.';
                  }
                  return null;
                },
              ),
              CustomInputField(
                label: 'Option 3 (Index 2)',
                hint: 'Ex: Naples',
                controller: _option3Controller,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'L\'option 3 ne peut pas être vide.';
                  }
                  return null;
                },
              ),
              CustomInputField(
                label: 'Index de la bonne réponse (0, 1 ou 2)',
                hint: 'Saisissez 0, 1 ou 2',
                controller: _correctIndexController,
                keyboardType: TextInputType.number,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Veuillez indiquer l\'index de la réponse correcte.';
                  }
                  final parsed = int.tryParse(val.trim());
                  if (parsed == null || parsed < 0 || parsed > 2) {
                    return 'L\'index doit être strictement égal à 0, 1 ou 2.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1877F2),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: _submitForm,
                child: const Text('Enregistrer la Question', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}