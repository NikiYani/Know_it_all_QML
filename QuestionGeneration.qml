import QtQuick 2.0

Rectangle
{
    id: text_container
    color: "#00ffffff"

    property var questions: [
        "Вопрос № 1. \n\nСамое сухое место на Земле – пустыня Сахара?",
        "Вопрос № 2. \n\nПолярные медведи закрывают черный нос лапами, когда пытаются спрятаться в снегу?",
        "Вопрос № 3. \n\nЧеловеческий мозг – розового цвета?",
        "Вопрос № 4. \n\nКобру можно загипнотизировать музыкой?",
        "Вопрос № 5. \n\nВеликую Китайскую стену видно с Луны?",
        "Вопрос № 6. \n\nНу это совсем просто! В ракушке мы слышим море?",
        "Вопрос № 7. \n\nЭлектрон больше, чем атом?",
        "Вопрос № 8. \n\nГлаз страуса больше, чем его мозг?",
        "Вопрос № 9. \n\nЗвуковые волны относятся к поперечному виду волн?",
        "Вопрос № 10. \n\nБольше всего часовых поясов – во Франции?"
    ]

    property var answers: [
        false,
        false,
        true,
        false,
        false,
        false,
        false,
        true,
        false,
        true
    ]

    property int curr_question: 0

    Text {
        id: text_field
        anchors.top: parent.top
        anchors.left: parent.left
        height: parent.height
        width: parent.width
        text: parent.questions[curr_question]
        wrapMode: Text.WordWrap

        font.family: "Helvetica"
        color: "#281f47"
        font.weight: Font.DemiBold
        fontSizeMode: Text.Fit
        minimumPixelSize: 10
        font.pixelSize: 30

        Component.onCompleted: {
            if (text_field.paintedWidth > text_container.width) {
                width = text_container.width
            } else {
                width = text_field.paintedWidth
            }
        }
    }
}

