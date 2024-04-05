## Features

A simple numeric keypad that allows for easy design modifications.

## How to use

### Installation

```yaml
dependencies:
  simple_numpad: ^1.0.2
```

### Import

```dart
import 'package:simple_numpad/simple_numpad.dart';
```

## Example

### Basic

<img src="https://i.esdrop.com/d/f/UV8fTFnM83/W0LZuxliC0.gif" width="100%"/>

```dart
SimpleNumpad(
    buttonWidth: 80,
    buttonHeight: 60,
    onPressed: (str) {
        print(str);
    },
);
```

<br/>

### Circular

<img src="https://i.esdrop.com/d/f/UV8fTFnM83/thpN9jfxFU.gif"  width="100%"/>

```dart
SimpleNumpad(
    buttonWidth: 60,
    buttonHeight: 60,
    gridSpacing: 10,
    buttonBorderRadius: 30,
    onPressed: (str) {
        print(str);
    },
);
```

<br/>

### Bordered

<img src="https://i.esdrop.com/d/f/UV8fTFnM83/GcIwa9VEgk.gif"  width="100%"/>

```dart
SimpleNumpad(
    buttonWidth: 60,
    buttonHeight: 60,
    gridSpacing: 10,
    buttonBorderRadius: 30,
    buttonBorderSide: const BorderSide(
        color: Colors.black,
        width: 1,
    ),
    onPressed: (str) {
        print(str);
    },
);
```

<br/>

### Backspace & Option

<img src="https://i.esdrop.com/d/f/UV8fTFnM83/MxV6JQQWTB.gif"  width="100%"/>

```dart
SimpleNumpad(
    buttonWidth: 60,
    buttonHeight: 60,
    gridSpacing: 10,
    buttonBorderRadius: 30,
    buttonBorderSide: const BorderSide(
        color: Colors.black,
        width: 1,
    ),
    useBackspace: true,
    optionText: 'clear',
    onPressed: (str) {
        print(str);
    },
);
```

<br/>

### Custom1

<img src="https://i.esdrop.com/d/f/UV8fTFnM83/6Z4JkK1uL8.gif"  width="100%"/>

```dart
SimpleNumpad(
    buttonWidth: 80,
    buttonHeight: 60,
    gridSpacing: 5,
    buttonBorderRadius: 8,
    foregroundColor: Colors.white,
    backgroundColor: Colors.black.withAlpha(200),
    textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w400,
    ),
    useBackspace: true,
    optionText: 'clear',
    onPressed: (str) {
        print(str);
    };
```

<br/>

### Custom2

<img src="https://i.esdrop.com/d/f/UV8fTFnM83/gEdgXw5H32.gif"  width="100%"/>

```dart
SimpleNumpad(
    buttonWidth: 60,
    buttonHeight: 60,
    gridSpacing: 5,
    buttonBorderRadius: 30,
    foregroundColor: Colors.white,
    backgroundColor: Colors.black.withAlpha(200),
    textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w400,
    ),
    useBackspace: false,
    removeBlankButton: true,
    onPressed: (str) {
        print(str);
    },
);
```

## onPressed function example

The onPressed function takes input for the string displayed on the Numpad.<br/>

Default:<br/>
'1', '2', '3', '4', '5', '6', '7', '8', '9', '0'

Optional:<br/>
'BACKSPACE', '${optionText}'

```dart
void onPressed(String str) {
    switch(str) {
        case 'BACKSPACE':
            // This case is accessible when you have set "useBackspace: true".
            removeLast();
            break;
        case 'clear':
            // This string is what you have injected into "optionText".
            removeAll();
            break;
        default:
            // '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'
            int value = int.parse(str);
            append(value);
            break;
    }
}
```
