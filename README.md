# Karess
KWin Effect to enable touchpad gestures with [Karousel](https://github.com/peterfajdiga/karousel)

> [!NOTE]
> KDE touchpad gestures are only supported on Wayland.

## Installation

### From a release

- Download the [latest release](https://github.com/lavafroth/karess/releases/latest) zip file
- Extract its contents to *~/.local/share/kwin/effects*

### From source

- Clone this repo
- Enter the project directory

```
kpackagetool6 --type KWin/Effect --install ./src || \
kpackagetool6 --type KWin/Effect --upgrade ./src
```

## Usage

Enable the effect under the "Desktop effects" section in Plasma settings.

Scroll with three fingers left or right to scroll the content (natural scrolling).
You may reverse the scrolling direction in the settings.

The following pinch / zoom gestures can also be disabled in the settings:
- Zoom with three fingers to cycle window widths
- Pinch with three fingers to cycle window widths in reverse

## Acknowledgements

Thank you
- @diredocks for the Gesture Evolution KWin Effect
- @zeroxoneafour and @krake for pointing out the scarcely documented DBusCall for QML
- @peterfajdiga for making Karousel
