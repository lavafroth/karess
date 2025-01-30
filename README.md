# Karousel Touch
KWin Effect to enable touchpad gestures with [Karousel](https://github.com/peterfajdiga/karousel)

## Installation

- Clone this repo
- Enter the project directory

```
kpackagetool6 --type KWin/Effect --install ./src
```

## Usage

We default to natural scrolling (scrolling the view, not the contents)
but this behavior can be changed in the effect's settings.

- Three finger swipe left to focus on the window to the right
- Three finger swipe right to focus on the window to the left

The following pinch / zoom gestures can also be disabled in the settings:
- Zoom with three fingers to cycle window widths
- Pinch with three fingers to cycle window widths in reverse

## Acknowledgements

Thank you to @diredocks for the Gesture Evolution KWin Effect and
@zeroxoneafour for pointing out the scarcely documented DBusCall for QML.
