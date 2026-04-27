# Lesson 01: Variables in Dart (C + Flutter Perspective)

In this lesson, we review variables from a C developer's perspective: what is similar, what is different, and how each concept is used in Flutter.

---

## 1) Declaring Variables with Explicit Types

Like C, you can declare variables with explicit types:

```dart
int age = 25;
double price = 49.99;
String username = 'ali_dev';
bool isActive = true;
```

### Difference from C

- `String` and `bool` are first-class built-in types in Dart.
- In Dart, everything is an object (including `int` and `double`).

### Flutter Use Case

```dart
String title = 'Profile';
bool isLoading = true;
```

- `title` can be shown in an `AppBar`.
- `isLoading` can control showing/hiding a `CircularProgressIndicator`.

---

## 2) `var` and Type Inference

In Dart, you can use `var` instead of writing the type explicitly:

```dart
var count = 0;        // int
var message = 'Hi';   // String
```

The compiler infers the type from the initial value.

### Difference from C

- In C, you usually declare the type explicitly.
- In Dart, `var` makes code shorter, but the inferred type still stays fixed.

```dart
var x = 10;
x = 20;       // valid
// x = 'ten'; // error: x was inferred as int
```

### Flutter Use Case

```dart
var items = ['Apple', 'Banana', 'Orange'];
var selectedIndex = 0;
```

- Common in simple state and list-driven UI logic.

---

## 3) `dynamic` for Runtime-Typed Values

```dart
dynamic value = 10;
value = 'ten';
value = true;
```

### Difference from C

- In C, variable types are fixed at compile time.
- `dynamic` in Dart is flexible, but reduces type safety.

### Flutter Use Case

You may see this when handling raw JSON:

```dart
dynamic rawResponse = {'name': 'Ali', 'age': 25};
```

> Practical advice: prefer typed models whenever possible and keep `dynamic` usage limited.

---

## 4) `final` and `const`

### `final`

- Assigned once.
- Value can be known at runtime.

```dart
final createdAt = DateTime.now();
```

### `const`

- Must be a compile-time constant.

```dart
const appName = 'dart-for-c-programmers';
const spacing = 16.0;
```

### Difference from C

- C has `const`, but Dart clearly separates runtime immutability (`final`) from compile-time constants (`const`).

### Flutter Use Case

`const` is important in Flutter because it can reduce unnecessary rebuild work:

```dart
const Text('Hello');
const SizedBox(height: 16);
```

For runtime values:

```dart
final userId = DateTime.now().millisecondsSinceEpoch;
```

---

## 5) Null Safety and `?`

In modern Dart, non-null variables must have a valid value:

```dart
int count = 1;      // non-null
int? maybeCount;    // nullable
```

### Difference from C

- In C, uninitialized locals can cause undefined behavior.
- In Dart, null safety prevents many common null-related bugs.

### Flutter Use Case

```dart
String? errorText;
```

- Very common in forms and optional UI state.

---

## Combined Flutter Example

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

In this example:

- `final` is used for widget inputs
- `const` is used for fixed values
- `var` is used for inferred local values
- `String?` is used for optional data

---

## Common Mistakes

- Overusing `dynamic`
- Mixing up `final` and `const`
- Ignoring null safety and using `!` without clear guarantees

---

## Practice

1. Create a `UserBadge` widget that takes `name` and `age` as `final`.
2. Add an optional `String? status`.
3. Inside `build`, use one `const` value and one `var` computed value.
4. Render `status` only when it is not null.

---

## Lesson Summary

- Dart is strongly typed like C, but more expressive with `var`.
- Use `dynamic` carefully and intentionally.
- `final` and `const` are key for clean Dart and Flutter code.
- Null safety improves reliability and reduces runtime bugs.
