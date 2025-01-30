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
    property var threshold: 0.1;

    function left(progress) {
        rightPrevProgress = 0;
        // print("[left]", progress)
        if (progress - leftPrevProgress < threshold) {
            return
        }

        if (effect.configuration.NaturalScrolling) {
            scrollRight.call()
        } else {
            scrollLeft.call()
        }
        leftPrevProgress = progress
    }

    function right(progress) {
        leftPrevProgress = 0;
        // print("[right]", progress)
        if (progress - rightPrevProgress < threshold) {
            return
        }

        if (effect.configuration.NaturalScrolling) {
            scrollLeft.call()
        } else {
            scrollRight.call()
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
