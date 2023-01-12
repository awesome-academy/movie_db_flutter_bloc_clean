<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

This ez_local_storage package provides some easy ready-to-use functions which are using local Hive database.

## Features
- Easy Read, Write local data from the app
- Generate object adapters for storing all types of objects by using build runner script
- High performance and fast database

## Usage
Do the following steps:
1. Create your classes with hive annotations
```dart
    import 'package:ez_cache/ez_cache.dart';

    part 'person.g.dart';

    @HiveType(typeId: 1)
    class Person {
    Person({
    required this.name,
    required this.age,
    required this.friends,
    })

    @HiveField(0)
    String name;

    @HiveField(1)
    int age;

    @HiveField(2)
    List<Person> friends;
    }
```
2. run the generate script in the project's terminal: flutter packages pub run build_runner build
3. Init HiveCache before the app starts:
ex:
```dart     
    import 'package:ez_cache/ez_cache.dart';
    
    _hiveCache = HiveCache();

    return _hiveCache.initialize(
      registerAdapters: () {
        Hive.registerAdapter(PersonAdapter()); // this adapter class is auto-generated in your person.g.dart file
      },
    );
```
4. now you can read and write to the hive database:
ex: 

* write the data to the database example:

```dart
    final hiveCache = HiveCache();

    final user = await hiveCache.put('user', Person(name: 'name', age: 12, friends: []));
```

* read the data from database example:

```dart
    final hiveCache = HiveCache();

    final user = await hiveCache.get<Person?>('user');
```


## Additional information
- references: https://pub.dev/packages/hive
