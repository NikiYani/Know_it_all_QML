import QtQuick 2.1
import QtQuick.Window 2.12

FocusScope {
    id: container
    property bool open: false
    property int best_score_points: 0

    readonly property int dpi: Screen.pixelDensity * 25.4
    function dp(x){ return (dpi < 120) ? x : x*(dpi/160); }

    Item {
        anchors.fill: parent

        Rectangle {
            anchors.fill: parent
            color: "#d9d9de"
            focus: true
            Keys.onRightPressed: container.keyRightTarget.focus = true

            Rectangle{
                id: first_button
                x: dp(-20)
                y: dp(50)
                width: parent.width
                height: dp(80)
                radius: 5

                Rectangle
                {
                    id: first_button_inside
                    anchors.fill: parent
                    anchors.margins: 10

                    property color main_color: "#5e64ab"

                    color: main_color

                    radius: 5

                    Text {
                        id: best_score_button
                        text: qsTr("BEST SCORE: " + best_score_points.toString())
                        font.family: "Helvetica"
                        color: "#ffffff"
                        font.weight: Font.DemiBold
                        fontSizeMode: Text.Fit
                        minimumPixelSize: 10
                        font.pixelSize: 30

                        anchors.horizontalCenter: first_button_inside.horizontalCenter
                        anchors.verticalCenter: first_button_inside.verticalCenter
                    }
                }
            }

            Rectangle{
                id: second_button
                x: dp(-20)
                y: first_button.y + dp(120)
                width: parent.width
                height: dp(80)
                radius: 5

                Rectangle
                {
                    id: second_button_inside
                    anchors.fill: parent
                    anchors.margins: 10

                    property color main_color: "#5e64ab"
                    property color hoverColor: "#505591"
                    property color pressColor: "#3e4270"

                    color: main_color
                    radius: 5

                    Text {
                        id: about
                        text: qsTr("ABOUT")
                        font.family: "Helvetica"
                        color: "#ffffff"
                        font.weight: Font.DemiBold
                        fontSizeMode: Text.Fit
                        minimumPixelSize: 10
                        font.pixelSize: 30

                        anchors.horizontalCenter: second_button_inside.horizontalCenter
                        anchors.verticalCenter: second_button_inside.verticalCenter
                    }
                }

                MouseArea
                {
                    anchors.fill: second_button_inside
                    hoverEnabled: true

                    onEntered: { second_button.state = "Hovering"}
                    onExited: { second_button.state = ''}
                    onPressed: { second_button.state = "Pressed" }
                    onReleased: {
                        if (containsMouse)
                            second_button.state= "Hovering";
                        else
                            second_button.state="";
                    }

                    onClicked: Qt.openUrlExternally("https://nikiyani.github.io/my_resume");
                }

                states: [
                    State {
                        name: "Hovering"
                        PropertyChanges {
                            target: second_button_inside
                            color: second_button_inside.hoverColor
                        }
                    },
                    State {
                        name: "Pressed"
                        PropertyChanges {
                            target: second_button_inside
                            color: second_button_inside.pressColor
                        }
                    }
                ]

                transitions: [
                    Transition {
                        from: ""; to: "Hovering"
                        ColorAnimation { duration: 200 }
                    },
                    Transition {
                        from: "*"; to: "Pressed"
                        ColorAnimation { duration: 10 }
                    }
                ]
            }

            Rectangle{
                id: third_button
                x: dp(-20)
                y: second_button.y + dp(120)
                width: parent.width
                height: dp(80)
                radius: 5

                Rectangle
                {
                    id: third_button_inside
                    anchors.fill: parent
                    anchors.margins: 10

                    property color main_color: "#5e64ab"
                    property color hoverColor: "#505591"
                    property color pressColor: "#3e4270"

                    color: main_color

                    radius: 5

                    Text {
                        id: exit
                        text: qsTr("EXIT")
                        font.family: "Helvetica"
                        color: "#ffffff"
                        font.weight: Font.DemiBold
                        fontSizeMode: Text.Fit
                        minimumPixelSize: 10
                        font.pixelSize: 30

                        anchors.horizontalCenter: third_button_inside.horizontalCenter
                        anchors.verticalCenter: third_button_inside.verticalCenter
                    }

                    MouseArea
                    {
                        anchors.fill: third_button_inside
                        hoverEnabled: true

                        onEntered: { third_button.state = "Hovering"}
                        onExited: { third_button.state = ''}
                        onPressed: { third_button.state = "Pressed" }
                        onReleased: {
                            if (containsMouse)
                                third_button.state= "Hovering";
                            else
                                third_button.state="";
                        }

                        onClicked: Qt.quit()
                    }
                }

                states: [
                    State {
                        name: "Hovering"
                        PropertyChanges {
                            target: third_button_inside
                            color: third_button_inside.hoverColor
                        }
                    },
                    State {
                        name: "Pressed"
                        PropertyChanges {
                            target: third_button_inside
                            color: third_button_inside.pressColor
                        }
                    }
                ]

                transitions: [
                    Transition {
                        from: ""; to: "Hovering"
                        ColorAnimation { duration: 200 }
                    },
                    Transition {
                        from: "*"; to: "Pressed"
                        ColorAnimation { duration: 10 }
                    }
                ]
            }
        }
    }
}

