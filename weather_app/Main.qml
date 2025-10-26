// Hello, Thanks for using Weather Fetcher. Hope you find it useful
// It may confuse cities with same name in different locations
// You may contact me for any chnage or update
// It uses free api from https://openweathermap.org
//
// Author:
// Kazi MD. Sayed Hossain
// kazimdsayedhossain@outlook.com





import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    id: firstWindow
    visible: true
    width: 350
    height: 500
    title: qsTr("Weather")

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color:"#4facfe" }
            GradientStop { position: 1.0; color:"#00f2fe" }
        }
    }

    Rectangle {
        id: cityInput_box
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        width: 200
        height: 25
        radius: 10
        color: "transparent"
        border.color: "#2E86C1"
        border.width: 2



        TextField {
            id: cityInput
            anchors.centerIn: cityInput_box
            anchors.margins: 5
            placeholderText: "Enter city"
            font.pixelSize: 16
            color: "white"

            background: Rectangle {
                color: "transparent"
                border.color: "transparent"
            }
        }
    }

    Button {
        text: "Get Weather"
        anchors.top: cityInput_box.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        background: Rectangle
        {
            radius:8
            color:"transparent"
            border.color:"#2E86C1"
        }

        onClicked: {
            if (cityInput.text.length > 0) {
                weatherFetcher.make_request(cityInput.text)
            } else {
                console.log("Please enter a city name.")
            }
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 20

        Image {
            id: middle_icon
            width: 200
            height: 200
            source: ""
            anchors.horizontalCenter: parent.horizontalCenter

            Connections {
                target: weatherFetcher
                onWeatherChanged: {    // <- capital W
                    middle_icon.source = weatherFetcher.weather_condition_image()
                }
            }

        }

        Rectangle {
            id: date_time_box
            width: 160
            height: 30
            color: "#ffffff"
            radius: 12
            border.color: "#2E86C1"
            border.width: 2
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: date_time
                anchors.centerIn: parent
                font.pixelSize: 20
                font.bold: true
                font.family: "Arial"
                color: "#2E86C1"
            }

            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: {
                    var now = new Date()
                    var days = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
                    var dayName = days[now.getDay()]
                    var hours = now.getHours().toString().padStart(2,'0')
                    var minutes = now.getMinutes().toString().padStart(2,'0')
                    date_time.text = dayName + ", " + hours + ":" + minutes
                }
            }
        }

        Column {
            spacing: 5
            anchors.horizontalCenter: date_time_box.horizontalCenter

            Text {
                text: weatherFetcher.temperature
                font.pixelSize: 18
                color: "white"
                font.bold: true
            }
            Text {
                text: weatherFetcher.humidity
                font.pixelSize: 18
                color: "white"
            }
            Text {
                text: weatherFetcher.condition
                font.pixelSize: 18
                color: "white"
            }
        }

    }
}
