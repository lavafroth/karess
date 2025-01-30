# Karousel Touch
KWin Effect to enable touchpad gestures with [Karousel](https://github.com/peterfajdiga/karousel)

## Installation

- Clone this repo
- Enter the project directory

```
kpackagetool6 --type KWin/Effect --install ./src
```

## Usage

I perfer natural scrolling and there are no configuration options yet.
The following are the hardcoded gestures:

- Three finger swipe left to focus on the window to the right
- Three finger swipe right to focus on the window to the left

Check out the `pinch-cycle-widths` branch for these additional gestures:
- Pinch with 3 fingers outwards (I guess that's called a zoom) to cycle window widths
- Pinch with 3 fingers inwards to cycle window widths in reverse

## Acknowledgements

Thank you to @diredocks for the Gesture Evolution KWin Effect and
@zeroxoneafour for pointing out the scarcely documented DBusCall for QML.
