import 'package:flutter/material.dart';
import 'package:student_manager_app/models/student.dart';
import 'package:student_manager_app/routes/app_routes.dart';
import 'package:student_manager_app/screens/student_form_screen.dart';
import 'package:student_manager_app/widgets/student_tile.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({Key? key}) : super(key: key);

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen>{
  final List<Student> _students = [
    Student(id: '1', name: 'Nguyen Van A', age: 20),
    Student(id: '2', name: 'Tran Thi B', age: 22),
    Student(id: '3', name: 'Le Van C', age: 21),
  ];

  void _goToDetail (Student student){
    Navigator.pushNamed(context, AppRoutes.studentDetail, arguments: student);
  }

  Future<void> _goToForm() async {
    final result = await Navigator.push<Student?>(context, 
    MaterialPageRoute(builder: (ctx) => const StudentFormScreen()));

    if(result == null) return;

    setState(() {
      _students.add(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách sinh viên'),
      ),
      body: ListView.builder(
        itemCount: _students.length,
        itemBuilder: (context, index){
          final student = _students[index];
          return StudentTile(
            student: student,
            onTap: () => _goToDetail(student),
          );
        }),

        floatingActionButton: FloatingActionButton(
          onPressed: _goToForm,
          child: const Icon(Icons.add),
        ),
    );
  }
}