import 'package:flutter/material.dart';
import '../services/mock_quiz_data.dart';
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
  final _correctAnswerController = TextEditingController();

  String? _selectedCategoryId;

  @override
  void dispose() {
    _questionController.dispose();
    _option1Controller.dispose();
    _option2Controller.dispose();
    _correctAnswerController.dispose();
    super.dispose();
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Ce champ est obligatoire.';
    }
    if (value.trim().length < 3) {
      return 'Minimum 3 caractères.';
    }
    return null;
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (_selectedCategoryId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez sélectionner un thème.')),
      );
      return;
    }
    if (!isValid) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Question ajoutée avec succès !')),
    );

    _formKey.currentState?.reset();
    _questionController.clear();
    _option1Controller.clear();
    _option2Controller.clear();
    _correctAnswerController.clear();
    setState(() => _selectedCategoryId = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter une question')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Thème',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                initialValue: _selectedCategoryId,
                decoration: const InputDecoration(
                  hintText: 'Sélectionner un thème',
                ),
                items: MockQuizData.categories
                    .map((c) => DropdownMenuItem(
                          value: c.id,
                          child: Text(c.title),
                        ))
                    .toList(),
                onChanged: (value) =>
                    setState(() => _selectedCategoryId = value),
              ),
              const SizedBox(height: 16),
              CustomInputField(
                label: 'Question',
                hint: 'Ex : Quelle est la capitale du Japon ?',
                controller: _questionController,
                validator: _requiredValidator,
                maxLines: 2,
              ),
              CustomInputField(
                label: 'Option 1',
                hint: 'Ex : Tokyo',
                controller: _option1Controller,
                validator: _requiredValidator,
              ),
              CustomInputField(
                label: 'Option 2',
                hint: 'Ex : Osaka',
                controller: _option2Controller,
                validator: _requiredValidator,
              ),
              CustomInputField(
                label: 'Réponse correcte',
                hint: 'Doit correspondre à une des options ci-dessus',
                controller: _correctAnswerController,
                validator: _requiredValidator,
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save_outlined),
                  label: const Text('Enregistrer'),
                  onPressed: _submit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}