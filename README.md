# Karousel Touch
KWin Effect to enable touchpad gestures with [Karousel](https://github.com/peterfajdiga/karousel)

## Installation

- Clone this repo
- Enter the project directory

```
kpackagetool6 --type KWin/Effect --install ./src
```

If the effect is already installed, run

```
kpackagetool6 --type KWin/Effect --upgrade ./src
```

## Usage

We default to natural scrolling (scrolling the view, not the contents)
but this behavior can be changed in the effect's settings.

Scroll with three fingers left or right to scroll the view.

The following pinch / zoom gestures can also be disabled in the settings:
- Zoom with three fingers to cycle window widths
- Pinch with three fingers to cycle window widths in reverse

## Acknowledgements

Thank you
- @diredocks for the Gesture Evolution KWin Effect
- @zeroxoneafour and @krake for pointing out the scarcely documented DBusCall for QML
- @peterfajdiga for making Karousel
