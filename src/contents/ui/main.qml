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
        arguments: ["karousel-grid-scroll-left"]
    }

    DBusCall {
        id: scrollRight

        service: "org.kde.kglobalaccel"
        path: "/component/kwin"
        method: "invokeShortcut"
        arguments: ["karousel-grid-scroll-right"]
    }

    DBusCall {
        id: focusLeft
        // dbusInterface: "org.kde.kglobalaccel.Component"

        service: "org.kde.kglobalaccel"
        path: "/component/kwin"
        method: "invokeShortcut"
        arguments: ["karousel-focus-left"]
    }

    DBusCall {
        id: focusRight

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

    property var leftPrevProgress: 0;
    property var rightPrevProgress: 0;
    property var threshold: (70 - effect.configuration.ScrollThreshold) / 100 + 0.05;

    function left(progress) {
        clearRight()
        // print("[left]", progress)
        if (progress - leftPrevProgress < threshold) {
            return
        }

        if (effect.configuration.ScrollFocus) {
            if (effect.configuration.NaturalScrolling) {
                focusRight.call()
            } else {
                focusLeft.call()
            }
        } else {
            if (effect.configuration.NaturalScrolling) {
                scrollRight.call()
            } else {
                scrollLeft.call()
            }
        }
        leftPrevProgress = progress
    }

    function right(progress) {
        clearLeft()
        // print("[right]", progress)
        if (progress - rightPrevProgress < threshold) {
            return
        }

        if (effect.configuration.ScrollFocus) {
            if (effect.configuration.NaturalScrolling) {
                focusLeft.call()
            } else {
                focusRight.call()
            }
        } else {
            if (effect.configuration.NaturalScrolling) {
                scrollLeft.call()
            } else {
                scrollRight.call()
            }
        }
        rightPrevProgress = progress
    }

    function pinchCycleWidth() {
        if (effect.configuration.CycleWidths) {
            cycleWidths.call()
        }
    }

    function pinchCycleWidthReverse() {
        if (effect.configuration.CycleWidths) {
            cycleWidthsReverse.call()
        }
    }

    function clearLeft() {
        leftPrevProgress = 0;
    }

    function clearRight() {
        rightPrevProgress = 0;
    }

    SwipeGestureHandler {
        direction: SwipeGestureHandler.Direction.Left
        fingerCount: 3
        onActivated: clearLeft()
        onProgressChanged: left(progress)
    }

    SwipeGestureHandler {
        direction: SwipeGestureHandler.Direction.Right
        fingerCount: 3
        onActivated: clearRight()
        onProgressChanged: right(progress)
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
