# درس 01: متغیرها در دارت (با نگاه C و Flutter)

در این درس، متغیرها را از دید یک برنامه نویس `C` بررسی می کنیم:
- چه چیزهایی شبیه هستند
- چه چیزهایی متفاوت هستند
- در `Flutter` چطور استفاده می شوند

---

## 1) تعریف متغیر با نوع صریح

مثل `C` می توانید نوع را واضح بنویسید:

```dart
int age = 25;
double price = 49.99;
String username = 'ali_dev';
bool isActive = true;
```

### تفاوت با C

- در زبان `Dart`، نوع های اصلی شامل `String` و `bool` هستند.
- در زبان `Dart`، همه چیز آبجکت است (حتی `int` و `double`).

### کاربرد در Flutter

```dart
String title = 'Profile';
bool isLoading = true;
```

- متغیر `title` می تواند در `AppBar` نمایش داده شود.
- متغیر `isLoading` برای نمایش یا مخفی کردن `CircularProgressIndicator` استفاده می شود.

---

## 2) متغیر `var` و استنتاج نوع

در `Dart` می توانید به جای نوشتن نوع، از `var` استفاده کنید:

```dart
var count = 0;        // int
var message = 'Hi';   // String
```

کامپایلر نوع را از مقدار اولیه تشخیص می دهد.

### تفاوت با C

- در زبان `C` باید نوع را صریح بنویسید.
- در زبان `Dart` با `var` کد کوتاه تر می شود اما نوع همچنان ثابت می ماند.

```dart
var x = 10;
x = 20;      // درست
// x = 'ten'; // خطا: نوع x از ابتدا int بوده
```

### کاربرد در Flutter

```dart
var items = ['Apple', 'Banana', 'Orange'];
var selectedIndex = 0;
```

- برای ساخت لیست آیتم ها و state ساده بسیار رایج است.

---

## 3) نوع پویا با `dynamic`

```dart
dynamic value = 10;
value = 'ten';
value = true;
```

### تفاوت با C

- در زبان `C` نوع متغیر در زمان کامپایل مشخص است.
- در زبان `Dart`، `dynamic` انعطاف بالا می دهد، ولی امنیت نوع را کم می کند.

### کاربرد در Flutter

در کار با JSON خام ممکن است ببینید:

```dart
dynamic rawResponse = {'name': 'Ali', 'age': 25};
```

> پیشنهاد عملی: تا حد ممکن از مدل های تایپ شده استفاده کنید و وابستگی به `dynamic` را کم نگه دارید.

---

## 4) کلیدواژه های `final` و `const`

### کلیدواژه `final`

- یک بار مقداردهی می شود.
- مقدار می تواند در زمان اجرا تعیین شود.

```dart
final createdAt = DateTime.now();
```

### کلیدواژه `const`

- مقدار باید در زمان کامپایل مشخص باشد.

```dart
const appName = 'dart-for-c-programmers';
const spacing = 16.0;
```

### تفاوت با C

- زبان `C` مفهوم `const` دارد، اما `Dart` بین ثابت زمان اجرا (`final`) و ثابت زمان کامپایل (`const`) تفکیک دقیق تری دارد.

### کاربرد در Flutter

در `Flutter`، `const` مهم است چون می تواند به بهینه شدن rebuild کمک کند:

```dart
const Text('Hello');
const SizedBox(height: 16);
```

و برای داده های زمان اجرا (`runtime`):

```dart
final userId = DateTime.now().millisecondsSinceEpoch;
```

---

## 5) ایمنی تهی (`Null Safety`) و `?`

در `Dart` مدرن، متغیر `non-null` باید مقدار معتبر داشته باشد:

```dart
int count = 1;    // non-null
int? maybeCount;  // nullable
```

### تفاوت با C

- در زبان `C` ممکن است متغیر محلی بدون مقدار اولیه تعریف شود و رفتار نامطمئن ایجاد کند.
- در زبان `Dart`، `Null Safety` جلوی بخش بزرگی از خطاهای رایج را می گیرد.

### کاربرد در Flutter

```dart
String? errorText;
```

- برای فرم ها و وضعیت های اختیاری (مثلا پیام خطا) بسیار رایج است.

---

## مثال ترکیبی در Flutter

```dart
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String? discountLabel;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    this.discountLabel,
  });

  @override
  Widget build(BuildContext context) {
    const currency = 'Toman';
    var displayPrice = '$price $currency';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        Text(displayPrice),
        if (discountLabel != null) Text(discountLabel!),
      ],
    );
  }
}
```

در این مثال:

- کلیدواژه `final` برای props ویجت
- کلیدواژه `const` برای مقدار ثابت
- کلیدواژه `var` برای مقدار محاسبه شده
- نوع `String?` برای داده اختیاری

### آیا این فیلدها در زمان اجرا تغییر می کنند؟

در این بخش از کد:

```dart
final String name;
final double price;
final String? discountLabel;
```

خود فیلدها بعد از مقداردهی اولیه دیگر قابل تغییر نیستند، چون با `final` تعریف شده اند.

- فیلد `name` فقط یک بار مقدار می گیرد.
- فیلد `price` فقط یک بار مقدار می گیرد.
- فیلد `discountLabel` هم فقط یک بار مقدار می گیرد (و می تواند `null` باشد چون nullable است).

نکته مهم:

- `final` یعنی «یک بار مقداردهی در زمان اجرا یا کامپایل».
- `const` یعنی «مقدار کاملا ثابت در زمان کامپایل».

پس در `ProductCard`، اگر مقدارها تغییر کنند، معمولا یک نمونه (instance) جدید از ویجت ساخته می شود؛ نه اینکه همان نمونه قبلی، فیلدهای `final` خودش را تغییر دهد.

---

## اشتباهات رایج

- استفاده زیاد از `dynamic` بدون نیاز
- قاطی کردن نقش `final` و `const`
- نادیده گرفتن Null Safety و استفاده بی دلیل از `!`

---

## خلاصه درس

- زبان `Dart` مثل `C` نوع دار است، اما با `var` خواناتر می شود.
- `dynamic` باید محدود و آگاهانه استفاده شود.
- `final` و `const` در `Dart` و `Flutter` کاربرد کلیدی دارند.
- `Null Safety` باعث پایداری بیشتر کد می شود.
