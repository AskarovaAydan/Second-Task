<<<<<<< HEAD
# task2

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
=======
# Second-Task
DevJoint Second Task
---

## 📝 Notes & Project Explanation

### 1. Data Model & Local Storage Setup
* **Hive Database:** Layihədə məlumatların lokal olaraq saxlanılması üçün sürətli NoSQL verilənlər bazası olan `Hive` istifadə olunub.
* **Type Adapters:** `Expense` data modeli üçün `@HiveType` və `@HiveField` annotasiyaları təyin olunub və `build_runner` vasitəsilə `expense.g.dart` faylı generasiya edilib.

### 2. CRUD Operations
* **Create:** İstifadəçi yeni xərc əlavə etdikdə məlumat Hive Box-a unikal `id` ilə yazılır.
* **Read:** Baza açıldıqda bütün xərclər siyahı şəklində oxunur.
* **Update:** Mövcud xərc redaktə olunduqda Hive üzərində yenilənir (`save()`).
* **Delete:** Xərc id-sinə əsasən bazadan silinir (`delete(id)`).

### 3. State Management (Provider)
* Tətbiq daxilində lazımsız `setState` çağırışlarının qarşısını almaq üçün **Provider** arxitekturası tətbiq olunub.
* `ExpenseProvider` klassı `ChangeNotifier`-dən miras alır və bazada hər hansı dəyişiklik olduqda `notifyListeners()` vasitəsilə UI-ı avtomatik yeniləyir.

### 4. Filtering & Sorting
* **Filtering:** İstifadəçi kateqoriyalar (`Food`, `Transport`, `Shopping`, `Bills` və s.) üzrə xərcləri anlıq olaraq filtrləyə bilir.
* **Sorting:** Xərclər həm **Tarixə görə** (ən son əlavə olunanlar üstə), həm də **Məbləğə görə** (böyükdən kiçiyə) sıralana bilir.

### 5. Form Validation
* Yeni xərc əlavə edərkən və ya düzəliş edərkən `Form` və `GlobalKey<FormState>` istifadə olunub.
* Boş başlıq daxil edilməsi, məbləğ sahəsinin boş qalması və ya mənfi/qeyri-rəqəm daxil edilməsi hallarının qarşısı `validator`lar ilə alınıb.

### 6. User Experience (Empty State & Confirmation Dialog)
* **Empty State:** Siyahıda heç bir xərc olmadıqda istifadəçiyə vizual ikon və izahedici mətndən ibarət səliqəli interfeys gösterilir.
* **Delete Confirmation:** Təsadüfi silinmələrin qarşısını almaq üçün xərc silinməzdən əvvəl `AlertDialog` vasitəsilə təsdiq pəncərəsi açılır.
