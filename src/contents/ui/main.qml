import QtQuick
import org.kde.kwin

SceneEffect {
    id: effect

    DBusCall {
        id: scrollLeft
        // dbusInterface: "org.kde.kglobalaccel.Component"

        service: "org.kde.kglobalaccel"
        path: "/component/kwin"
        method: "invokeShortcut"
        arguments: ["karousel-focus-left"]
    }

    DBusCall {
        id: scrollRight

        service: "org.kde.kglobalaccel"
        path: "/component/kwin"
        method: "invokeShortcut"
        arguments: ["karousel-focus-right"]
    }

    DBusCall {
        id: cycleWidths

        service: "org.kde.kglobalaccel"
        path: "/component/kwin"
        method: "invokeShortcut"
        arguments: ["karousel-cycle-preset-widths"]
    }

    DBusCall {
        id: cycleWidthsReverse

        service: "org.kde.kglobalaccel"
        path: "/component/kwin"
        method: "invokeShortcut"
        arguments: ["karousel-cycle-preset-widths-reverse"]
    }

    // Switched the direction for natural scrolling
    function swipeLeft() {
        if (effect.configuration.NaturalScrolling) {
            scrollRight.call()
        } else {
            scrollLeft.call()
        }
    }

    function swipeRight() {
        if (effect.configuration.NaturalScrolling) {
            scrollLeft.call()
        } else {
            scrollRight.call()
        }
    }

    function pinchCycleWidth() {
        cycleWidths.call()
    }

    function pinchCycleWidthReverse() {
        cycleWidthsReverse.call()
    }

    SwipeGestureHandler {
        direction: SwipeGestureHandler.Direction.Left
        fingerCount: 3
        onActivated: swipeLeft()
    }

    SwipeGestureHandler {
        direction: SwipeGestureHandler.Direction.Right
        fingerCount: 3
        onActivated: swipeRight()
    }

    PinchGestureHandler {
        direction: PinchGestureHandler.Direction.Contracting
        fingerCount: 3
        onActivated: pinchCycleWidthReverse()
    }

    PinchGestureHandler {
        direction: PinchGestureHandler.Direction.Expanding
        fingerCount: 3
        onActivated: pinchCycleWidth()
    }
}
