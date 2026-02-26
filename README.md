# Spring Boot Learning Project

## 📌 Giới thiệu
Đây là project **Spring Boot** được xây dựng nhằm mục đích học tập và thực hành:
- Java & OOP
- Spring Boot
- Spring MVC
- Spring Data JPA
- Xây dựng hệ thống thi trắc nghiệm online

Project phục vụ cho việc học trên lớp và làm bài tập / bài cuối kỳ.

---

## ⚙️ Công nghệ sử dụng
- **Java** (JDK 21)
- **Spring Boot**
- **Spring MVC**
- **Spring Data JPA**
- **Maven**
- **MySQL / H2**
- **AJAX**
- **Lombok**

---

## 🎯 Chức năng chính

### 👨‍🏫 Giảng viên
- Quản lý **bộ câu hỏi trắc nghiệm** (thêm / sửa / xóa)
- Quản lý **câu hỏi** trong bộ câu hỏi
- Quản lý **loại câu hỏi**
- Tạo và quản lý **mã đề thi**
- Import câu hỏi từ **file (Word / Excel / Radio file)**

### 👨‍🎓 Sinh viên
- Tham gia làm **bài thi trắc nghiệm**
- Xem kết quả và điểm số sau khi làm bài
- Ghi chú câu hỏi
- Hỏi đáp với **AI hỗ trợ học tập**

### 👨‍💼 Admin
- Quản lý **loại câu hỏi**
- Quản lý tài khoản (**giảng viên / sinh viên**)
- Phân quyền hệ thống
- Theo dõi thống kê hệ thống

---

## 📂 Cấu trúc Project

```text
project-root/
│
├── .mvn/
│
├── src/
│   ├── main/
│   │   ├── java/com/example/
│   │   │   ├── config/
│   │   │   ├── controller/
│   │   │   ├── entity/
│   │   │   ├── repository/
│   │   │   ├── service/
│   │   │   ├── BaiCuoiKyApplication.java
│   │   │   └── ServletInitializer.java
│   │   │
│   │   └── resources/
│   │       ├── META-INF/resources/WEB-INF/
│   │       ├── components/
│   │       ├── jsp/
│   │       ├── static/
│   │       └── application.properties
│   │
│   └── test/java/com/example/demo/
│
├── uploads/
│   ├── mp3/
│   └── test/
│
├── .gitattributes
├── .gitignore
├── README.md
├── mvnw
├── mvnw.cmd
└── pom.xml
