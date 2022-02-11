import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    id:main_window
    width: 540
    height: 940
    visible: true
    title: qsTr("Know-it-all")
    property int score_points: 0
    //    property int best_score_points: 0
    property int state_answer: 0

    // Основное меню

    FocusScope {
        id: mainView

        width: parent.width; height: parent.height
        focus: true
        property bool check_click_yes: false

        Rectangle
        {
            id: small_line_menu
            width: 540
            height: 25
            x: 0
            y: 0

            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right

            color: "#312d66"
        }

        Rectangle
        {
            id: large_line_menu
            width: 540
            height: 75
            x: 0
            y: 0
            anchors.top: small_line_menu.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            color: "#3b3685"

            Text {
                id: score_text
                text: qsTr("Score: " + score_points)
                font.family: "Helvetica"
                color: "#ffffff"
                font.weight: Font.DemiBold
                fontSizeMode: Text.Fit
                minimumPixelSize: 10
                font.pixelSize: 45

                anchors.top: large_line_menu.top
                anchors.topMargin: 10
                anchors.right: large_line_menu.right
                anchors.rightMargin: 30
                anchors.bottom: large_line_menu.bottom
                anchors.bottomMargin: 10
            }
        }

        Rectangle
        {
            id: burger_icon
            width: 80
            x: 0
            y: 0
            anchors.top: large_line_menu.top
            anchors.bottom: large_line_menu.bottom
            anchors.left: large_line_menu.left
            anchors.leftMargin: 20

            property color main_color: "#3b3685"
            property color hoverColor: "#4f48b0"
            property color pressColor: "#675fd4"

            color: main_color

            Rectangle {
                anchors.top: parent.top
                anchors.topMargin: 15
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.right: burger_icon.right
                anchors.rightMargin: 15
                width: 30
                height: 8
                radius: 2
                color: "#e6efff"
            }

            Rectangle {
                anchors.top: parent.top
                anchors.topMargin: 32
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.right: burger_icon.right
                anchors.rightMargin: 15
                width: 30
                height: 8
                radius: 2
                color: "#e6efff"
            }

            Rectangle {
                anchors.top: parent.top
                anchors.topMargin: 49
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.right: burger_icon.right
                anchors.rightMargin: 15
                width: 30
                height: 8
                radius: 2
                color: "#e6efff"
            }

            MouseArea {
                id: burger_click
                anchors.fill: parent
                hoverEnabled: true

                onEntered: { burger_icon.state = "Hovering"}
                onExited: { burger_icon.state = ''}
                onPressed: { burger_icon.state = "Pressed" }
                onReleased: {
                    if (containsMouse)
                        burger_icon.state= "Hovering";
                    else
                        burger_icon.state="";
                }

                onClicked:
                {
                    mainView.focus = false
                    edgeMenu.focus = true
                }
            }

            states: [
                State {
                    name: "Hovering"
                    PropertyChanges {
                        target: burger_icon
                        color: hoverColor
                    }
                },
                State {
                    name: "Pressed"
                    PropertyChanges {
                        target: burger_icon
                        color: pressColor
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

        Rectangle
        {
            id: main_body_gray
            width: 540
            height: 840
            x: 0
            y: 100

            anchors.top: large_line_menu.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            color: "#d9d9de"
        }

        Rectangle
        {
            id: main_body_white
            width: 500
            height: 550
            radius: 10

            anchors.top: large_line_menu.bottom
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 150

            color: "#f2f2f7"

            QuestionGeneration
            {
                id:question_block
                anchors.fill: parent
                anchors.margins: 20

            }
        }

        Rectangle
        {
            id: bottom_body_white
            width: 500
            height: 100
            radius: 10

            anchors.top: main_body_white.bottom
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20

            color: "#f2f2f7"


        }

        Rectangle
        {
            id: left_button
            width: bottom_body_white.width / 2 - 50
            height: 100
            radius: 8

            property color main_color: "#5e64ab"
            property color hoverColor: "#3e4273"
            property color pressColor: "#2c305c"

            anchors.top: bottom_body_white.top
            anchors.topMargin: 20
            anchors.left: bottom_body_white.left
            anchors.leftMargin: 25
            anchors.bottom: bottom_body_white.bottom
            anchors.bottomMargin: 20

            color: main_color

            MouseArea {
                id: left_button_yes
                anchors.fill: parent
                hoverEnabled: true

                onEntered: { left_button.state = "Hovering"}
                onExited: { left_button.state = ''}
                onPressed: { left_button.state = "Pressed" }
                onReleased: {
                    if (containsMouse)
                        left_button.state= "Hovering";
                    else
                        left_button.state="";
                }

                onClicked: {
                    if(question_block.curr_question < 10)
                    {
                        if(question_block.answers[question_block.curr_question])
                        {
                            score_points++
                        }
                        else
                        {
                            score_points--
                        }

                        score_text.text = "Score: " + score_points.toString()

                        question_block.curr_question++
                    }

                    if(question_block.curr_question == 10)
                    {
                        right_button.visible = false
                        left_button.visible = false
                        return_button.visible = true
                    }
                }
            }

            Text {
                id: text_yes
                text: qsTr("Yes")
                font.family: "Helvetica"
                color: "#ffffff"
                font.weight: Font.DemiBold
                fontSizeMode: Text.Fit
                minimumPixelSize: 10
                font.pixelSize: 45

                anchors.horizontalCenter: left_button.horizontalCenter
                anchors.verticalCenter: left_button.verticalCenter
            }

            states: [
                State {
                    name: "Hovering"
                    PropertyChanges {
                        target: left_button
                        color: hoverColor
                    }
                },
                State {
                    name: "Pressed"
                    PropertyChanges {
                        target: left_button
                        color: pressColor
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

        Rectangle
        {
            id: right_button
            width: bottom_body_white.width / 2 - 50
            height: 100
            radius: 8

            property color main_color: "#5e64ab"
            property color hoverColor: "#3e4273"
            property color pressColor: "#2c305c"

            anchors.top: bottom_body_white.top
            anchors.topMargin: 20
            anchors.left: bottom_body_white.left
            anchors.leftMargin: 75 + left_button.width
            anchors.right: bottom_body_white.right
            anchors.rightMargin: 25
            anchors.bottom: bottom_body_white.bottom
            anchors.bottomMargin: 20

            color: main_color

            MouseArea {
                id: right_button_no
                anchors.fill: parent
                hoverEnabled: true

                onEntered: { right_button.state = "Hovering"}
                onExited: { right_button.state = ''}
                onPressed: { right_button.state = "Pressed" }
                onReleased: {
                    if (containsMouse)
                        right_button.state = "Hovering";
                    else
                        right_button.state = "";
                }

                onClicked: {
                    if(question_block.curr_question < 10)
                    {
                        if(!question_block.answers[question_block.curr_question])
                        {
                            score_points++
                        }
                        else
                        {
                            score_points--
                        }

                        score_text.text = "Score: " + score_points.toString()

                        question_block.curr_question++
                    }

                    if(question_block.curr_question == 10)
                    {
                        right_button.visible = false
                        left_button.visible = false
                        return_button.visible = true
                    }
                }
            }

            Text {
                id: text_no
                text: qsTr("No")
                font.family: "Helvetica"
                color: "#ffffff"
                font.weight: Font.DemiBold
                fontSizeMode: Text.Fit
                minimumPixelSize: 10
                font.pixelSize: 45

                anchors.horizontalCenter: right_button.horizontalCenter
                anchors.verticalCenter: right_button.verticalCenter
            }

            states: [
                State {
                    name: "Hovering"
                    PropertyChanges {
                        target: right_button
                        color: hoverColor
                    }
                },
                State {
                    name: "Pressed"
                    PropertyChanges {
                        target: right_button
                        color: pressColor
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

        Rectangle
        {
            id: return_button
            radius: 8
            visible: false

            property color main_color: "#5e64ab"
            property color hoverColor: "#3e4273"
            property color pressColor: "#2c305c"

            anchors.top: bottom_body_white.top
            anchors.topMargin: 20
            anchors.left: bottom_body_white.left
            anchors.leftMargin: 25
            anchors.right: bottom_body_white.right
            anchors.rightMargin: 25
            anchors.bottom: bottom_body_white.bottom
            anchors.bottomMargin: 20

            color: main_color

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onEntered: { return_button.state = "Hovering"}
                onExited: { return_button.state = ''}
                onPressed: { return_button.state = "Pressed" }
                onReleased: {
                    if (containsMouse)
                        return_button.state = "Hovering";
                    else
                        return_button.state = "";
                }

                onClicked: {
                    right_button.visible = true
                    left_button.visible = true
                    return_button.visible = false
                    question_block.curr_question = 0
                    if(score_points > edgeMenu.best_score_points)
                    {
                        edgeMenu.best_score_points = score_points

                    }

                    score_points = 0
                    score_text.text = "Score: " + score_points.toString()
                }
            }

            Text {
                id: text_return
                text: qsTr("START AGAIN")
                font.family: "Helvetica"
                color: "#ffffff"
                font.weight: Font.DemiBold
                fontSizeMode: Text.Fit
                minimumPixelSize: 10
                font.pixelSize: 45

                anchors.horizontalCenter: return_button.horizontalCenter
                anchors.verticalCenter: return_button.verticalCenter
            }

            states: [
                State {
                    name: "Hovering"
                    PropertyChanges {
                        target: return_button
                        color: hoverColor
                    }
                },
                State {
                    name: "Pressed"
                    PropertyChanges {
                        target: return_button
                        color: pressColor
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

        Rectangle
        {
            id: shade
            x: 0
            y: 0
            width: main_window.width
            height: main_window.height
            color: "black"
            opacity: 0
            visible: false

            MouseArea {
                id: shade_click
                anchors.fill: parent
                onClicked:
                {
                    mainView.focus = true
                    edgeMenu.focus = false
                }
            }
        }

        EdgeMenu {
            id: edgeMenu
            x: -(main_window.width / 2 + 50)
            y: 0
            width: main_window.width / 2 + 50
            height: main_window.height
        }

        states:
            [
            State {
                name: "moved"; when: !mainView.activeFocus
                PropertyChanges { target: edgeMenu; x: 0; open: true}
                PropertyChanges { target: shade; x: main_window.width / 2 + 50; visible: true; opacity: 0.25; }
            }
        ]

        transitions: Transition {
            NumberAnimation { properties: "x, opacity"; duration: 800; easing.type: Easing.OutQuint }
        }
    }
}


