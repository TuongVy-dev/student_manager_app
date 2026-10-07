import 'package:flutter/material.dart';
import 'package:student_manager_app/models/student.dart';

class StudentFormScreen extends StatefulWidget {
  const  StudentFormScreen({Key? key}) : super(key: key);

  @override
  State<StudentFormScreen> createState() => _StudentFormScreenState();
}

class _StudentFormScreenState extends State<StudentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _saveStudent(){
    if(_formKey.currentState?.validate() != true){
      return;
    }

    final id = _idController.text.trim();
    final name = _nameController.text.trim();
    final age = int.tryParse(_ageController.text.trim()) ?? 0;

    final newStudent = Student(id: id, name: name, age: age);

    Navigator.pop(context, newStudent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text("Thêm sinh viên"),
      ),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _idController,
                decoration: const InputDecoration(
                  labelText: "Mã sinh viên"
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty){
                    return "Vui lòng nhập mã sinh viên";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12,),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  label: Text("Họ Tên")
                ),
                validator: (value) {
                  if(value == null || value.trim().isEmpty){
                    return "Vui lòng nhập họ và tên";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12,),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  label: Text("Tuổi")
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  final text = value?.trim() ?? '';
                  final age = int.tryParse(text);
                  if(value == null || value.trim().isEmpty){
                    return "Vui lòng nhập tuổi";
                  }
                  if(age == null || age <= 0){
                    return "Tuổi không hợp lệ";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: _saveStudent, child: const Text("Lưu")),
                  OutlinedButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: const Text("Huỷ"))
                ],
              ),

            ],
          )),
        ),
    );
  }
}