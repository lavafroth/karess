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

    // Switched the direction for natural scrolling
    function swipeLeft() {
        scrollRight.call()
    }

    function swipeRight() {
        scrollLeft.call()
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
}
