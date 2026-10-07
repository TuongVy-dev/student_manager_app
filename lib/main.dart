import 'package:flutter/material.dart';
import 'package:student_manager_app/routes/app_routes.dart';
import 'package:student_manager_app/screens/home_screen.dart';
import 'package:student_manager_app/screens/student_detail_screen.dart';
import 'package:student_manager_app/screens/student_form_screen.dart';
import 'package:student_manager_app/screens/student_list_screen.dart';

void main() {
  runApp(const StudentManagerApp());
}

class StudentManagerApp extends StatelessWidget {
  const StudentManagerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Student Mangement",
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      // home: const HomeScreen(),
      // Định nghĩa routes tĩnh
      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.studentList: (context) => const StudentListScreen(),
        AppRoutes.studentDetail: (context) => const StudentDetailScreen(),
        // Form screen đang dùng push(MaterialPageRoute) nên không cần khai báo ở đây
      },
      // onGenerateRoute: chuẩn bị cho các trường hợp route không có trong routes map
      onGenerateRoute: (settings) {
        // Ví dụ: sau này xử lý deep link /students/detail?id=S001 ở đây
        // Ở bài này ta chỉ log cho sinh viên thấy flow
        debugPrint('onGenerateRoute được gọi với: ${settings.name}');
        return null; // Trả null để MaterialApp dùng tiếp onUnknownRoute (nếucó)
      },
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
