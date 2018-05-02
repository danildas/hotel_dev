import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.4
import QtQml.Models 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2

Item {
    id:idRoot
    width: parent.width
    height: parent.height

    FontLoader {
          id: idFontThin
          source: "qrc:/aileron/Aileron-Thin.otf"
      }

TitleBar{
    id:idTitleBar
    width: idRoot.width
    height: idRoot.height/12
}

StatusBar {
    id:idStatusBar
    width: idRoot.width
    height: idRoot.height/100
    anchors.bottom: idRoot.bottom
}

Rectangle {
    id:idRectangle1
    width: idRoot.width
    height: idRoot.height/1.5
    border.color: "#E3E8EC"
    border.width: 2
    radius: 5
    anchors {
        top: idTitleBar.bottom
        left: idRoot.left
        right: idRoot.right
        bottom: idStatusBar.top
        bottomMargin: 10
        topMargin: 10
        leftMargin: 10
        rightMargin: 10
    }

        Text {
            id: idtxtPrinterName
            width: idRectangle1.width/2
            height: idRectangle1.height/12
            text: qsTr("Printer Code")
            font.family: "Courier"
            font.pixelSize: 15
            anchors{
                top:idRectangle1.top
                left: idRectangle1.left
                topMargin: 20
                leftMargin: 50
                 }
             }
         TextField{
            id:idTxtFieldPrinterName
            width: idRectangle1.width/2
            height: idRectangle1.height/12
            font.family: "Courier"
            placeholderText: "Printer Code"
            anchors{
                 top: idRectangle1.top
                 left: idtxtPrinterName.right
                 right: idRectangle1.right
                 topMargin: 20
                 rightMargin: 50
                 }
        }

        Text {
            id: idtxtPrinterType
            width: idRectangle1.width/2
            height: idRectangle1.height/12
            text: qsTr("Type of Printer")
            font.family: "Courier"
            font.pixelSize: 15
            anchors{
                top:idtxtPrinterName.bottom
                left: idRectangle1.left
                topMargin: 8
                leftMargin: 50
                 }
             }

        ComboBox {
            id: idComboBoxPrinterList
            width: idRectangle1.width/2
            height: idRectangle1.height/12
            model: ListModel{
                id: idcomboModel
                ListElement{Text:"Ethernet"}
                ListElement{Text:"Serial port"}
            }
            anchors{
                 top: idTxtFieldPrinterName.bottom
                 left: idtxtPrinterType.right
                 right: idRectangle1.right
                 topMargin: 8
                 rightMargin: 50
                 }
            onCurrentTextChanged: {
                if(idComboBoxPrinterList.currentText=="Serial port")
                {
                    console.log("Serial port");
                    idtxtBauderate.enabled  =true
                    idTxtFieldBauderate.enabled  =true
                    idtxtIp.enabled =false
                    idTxtFieldIp.enabled =false
                }
                else
                {
                    console.log("Ethernet");
                    idtxtIp.enabled  =true
                    idTxtFieldIp.enabled  =true
                    idtxtBauderate.enabled  =false
                    idTxtFieldBauderate.enabled  =false
                }
            }
        }

        Text {
            id: idtxtIp
            width: idRectangle1.width/2
            height: idRectangle1.height/12
            text: qsTr("IP")
            font.family: "Courier"
            font.pixelSize: 15
            anchors{
                top:idtxtPrinterType.bottom
                left: idRectangle1.left
                topMargin: 5
                leftMargin: 50
            }
        }

        TextField{
            id:idTxtFieldIp
            width: idRectangle1.width/2
            height: idRectangle1.height/12
            font.family: "Courier"
            placeholderText: "Port Number"
            anchors{
                 top: idComboBoxPrinterList.bottom
                 left: idtxtIp.right
                 right: idRectangle1.right
                 topMargin: 5
                 rightMargin: 50
                 }
        }
        Text {
            id: idtxtPortnumber
            width: idRectangle1.width/2
            height: idRectangle1.height/12
            text: qsTr("Port Number")
            font.family: "Courier"
            font.pixelSize: 15
            anchors{
                top:idtxtIp.bottom
                left: idRectangle1.left
                topMargin: 5
                leftMargin: 50
            }
        }

        TextField{
            id:idTxtFieldPortNumber
            width: idRectangle1.width/2
            height: idRectangle1.height/12
            font.family: "Courier"
            placeholderText: "Port Number"
            anchors{
                 top: idTxtFieldIp.bottom
                 left: idtxtPortnumber.right
                 right: idRectangle1.right
                 topMargin: 5
                 rightMargin: 50
                 }
        }

        Text {
            id: idtxtBauderate
            width: idRectangle1.width/2
            height: idRectangle1.height/12
            text: qsTr("Baud rate")
            font.family: "Courier"
            font.pixelSize: 15
            anchors{
                top:idtxtPortnumber.bottom
                left: idRectangle1.left
                topMargin: 5
                leftMargin: 50
            }
        }

        TextField{
            id:idTxtFieldBauderate
            width: idRectangle1.width/2
            height: idRectangle1.height/12
            font.family: "Courier"
            placeholderText: "Baud rate"
            anchors{
                 top: idTxtFieldPortNumber.bottom
                 left: idtxtBauderate.right
                 right: idRectangle1.right
                 topMargin: 5
                 rightMargin: 50
                 }
        }

        Rectangle {
            id: idRectangleInside
            width: idRectangle1.width
            height: idRectangle1.height/3
            color: "#E3E8EC"
            radius: 5
            anchors {
               bottom: idRectangle1.bottom
               left: idRectangle1.left
               right: idRectangle1.right
               leftMargin: 5
               rightMargin: 5
               bottomMargin: 5
            }
            Button {
                id: idPrevButton
                anchors{
                    top: idRectangleInside.top
                    left: idRectangleInside.left
                    topMargin: idRectangleInside.height/6
                    leftMargin: idRectangleInside.width/45
                }
                background: POS_FunctionButton {
                    text: "Prev"
                    width: idRectangleInside.width/8
                    height: idRectangleInside.height/3
                    onClicked: {
                        console.log("Prev");
                        _groupMaster.previous();
                        idTxtFieldPrinterName.text =_groupMaster.Code
                        idComboBoxPrinterList.currentIndex = (_groupMaster.PrinterType === "Ethernet")? 0 : 1
                        idTxtFieldIp.text = _groupMaster.Ip
                        idTxtFieldPortNumber.text = _groupMaster.Port
                        idTxtFieldBauderate.text = _groupMaster.BaudRate

                        idTxtFieldPrinterName.readOnly = true
                        idTxtFieldBauderate.readOnly = true
                        idTxtFieldIp.readOnly = true
                        idTxtFieldPortNumber.readOnly = true
                        if( _groupMaster.PrinterType=="Ethernet")
                        {
                            idTxtFieldBauderate.enabled=false
                            idTxtFieldIp.enabled=true
                        }
                        else
                        {
                            idTxtFieldBauderate.enabled=true
                            idTxtFieldIp.enabled=false
                        }
                }
                }
            }
            Button {
                id: idNextButton
                anchors{
                    top: idRectangleInside.top
                    left: idPrevButton.right
                    topMargin: idRectangleInside.height/6
                    leftMargin: idRectangleInside.width/8.5
                }
                background: POS_FunctionButton {
                    text: "Next"
                    width: idRectangleInside.width/8
                    height: idRectangleInside.height/3
                    onClicked: {
                        console.log("Next", _groupMaster.PrinterType);
                        _groupMaster.next();

                        idTxtFieldPrinterName.text =_groupMaster.Code
                        idComboBoxPrinterList.currentIndex = (_groupMaster.PrinterType === "Ethernet")? 0 : 1
                        idTxtFieldIp.text = _groupMaster.Ip
                        idTxtFieldPortNumber.text = _groupMaster.Port
                        idTxtFieldBauderate.text = _groupMaster.BaudRate

                        if( _groupMaster.PrinterType=="Ethernet")
                        {
                            idTxtFieldBauderate.enabled=false
                            idTxtFieldIp.enabled=true
                        }
                        else
                        {
                            idTxtFieldBauderate.enabled=true
                            idTxtFieldIp.enabled=false
                        }

                        idTxtFieldPrinterName.readOnly = true
                        idTxtFieldBauderate.readOnly = true
                        idTxtFieldIp.readOnly = true
                        idTxtFieldPortNumber.readOnly = true
                }
                }
            }
            Button {
                id: idNewButton
                anchors{
                    top: idRectangleInside.top
                    //left: idNextButton.right
                    right: idEditButton.left
                    topMargin: idRectangleInside.height/6
                    rightMargin: idRectangleInside.width/8.5

                }
                background: POS_FunctionButton {
                    text: "New"
                    width: idRectangleInside.width/8
                    height: idRectangleInside.height/3
                    onClicked: {
                        idComboBoxPrinterList.currentIndex = (_groupMaster.PrinterType === "Ethernet")? 0 : 1

                        if( _groupMaster.PrinterType=="Ethernet")
                        {
                           console.log("1")
                           idTxtFieldBauderate.enabled=false
                           idTxtFieldBauderate.readOnly = true
                            idTxtFieldIp.text =""
                            idTxtFieldIp.enabled=true
                            idTxtFieldPrinterName.text = ""
                            idTxtFieldPortNumber.text = ""
                            idTxtFieldPrinterName.readOnly = false
                            //idTxtFieldBauderate.readOnly = false
                            idTxtFieldIp.readOnly = false
                            idTxtFieldPortNumber.readOnly = false
                            idComboBoxPrinterList.enabled=true
                        }
                        else
                        {
                            console.log("2")
                            idTxtFieldPrinterName.text = ""
                            idTxtFieldPrinterName.readOnly = false
                            idTxtFieldBauderate.text=""
                            idTxtFieldBauderate.enabled=true
                            idTxtFieldBauderate.readOnly = false
                            idTxtFieldPortNumber.text = ""
                            idTxtFieldPortNumber.readOnly = false
                        }
                    }
                }
            }
            Button {
                id: idEditButton
                anchors{
                    top: idRectangleInside.top
                    right: idDeleteButton.left
                    topMargin: idRectangleInside.height/6
                   rightMargin: idRectangleInside.width/8.5
                }
                background: POS_FunctionButton {
                    text: "Edit"
                    width: idRectangleInside.width/8
                    height: idRectangleInside.height/3
                    onClicked: {
                        idUpdateButton.visible= true
                        idSaveButton.visible= false
                        idTxtFieldBauderate.readOnly = false
                        idTxtFieldIp.readOnly = false
                        idTxtFieldPortNumber.readOnly = false
                        idComboBoxPrinterList.enabled  = false
                    }
                }
            }
            Button {
                id: idDeleteButton
                anchors{
                    top: idRectangleInside.top
                    right: idRectangleInside.right
                    rightMargin: idRectangleInside.width/8
                    topMargin: idRectangleInside.height/6
                }
                background: POS_FunctionButton {
                    text: "Delete"
                    width: idRectangleInside.width/8
                    height: idRectangleInside.height/3
                    onClicked:{ _groupMaster.deletePrinter()
                    }
                }
            }
            Button {
                id: idClearButton
                anchors{
                    top: idEditButton.bottom
                    right: idSaveButton.left
                    topMargin: idRectangleInside.height/4.5
                    rightMargin: idRectangleInside.width/8.5
                }
                background: POS_FunctionButton {
                    text: "Clear"
                    width: idRectangleInside.width/8
                    height: idRectangleInside.height/3
                    onClicked: {
                        idComboBoxPrinterList.currentIndex = (_groupMaster.PrinterType === "Ethernet")? 0 : 1

                        if( _groupMaster.PrinterType=="Ethernet")
                        {
                           console.log("1")
                           idTxtFieldBauderate.enabled=false
                           idTxtFieldBauderate.readOnly = true
                            idTxtFieldIp.text =""
                            idTxtFieldIp.enabled=true
                            idTxtFieldPrinterName.text = ""
                            idTxtFieldPortNumber.text = ""
                            idTxtFieldPrinterName.readOnly = false
                            idTxtFieldIp.readOnly = false
                            idTxtFieldPortNumber.readOnly = false
                            idComboBoxPrinterList.enabled=true
                        }
                        else
                        {
                            console.log("2")
                            idTxtFieldPrinterName.text = ""
                            idTxtFieldPrinterName.readOnly = false
                            idTxtFieldBauderate.text=""
                            idTxtFieldBauderate.enabled=true
                            idTxtFieldBauderate.readOnly = false
                            idTxtFieldPortNumber.text = ""
                            idTxtFieldPortNumber.readOnly = false
                        }
                    }
                }
            }
            Button {
                id: idSaveButton
                anchors{
                    top: idDeleteButton.bottom
                    right: idRectangleInside.right
                    topMargin: idRectangleInside.height/4.5
                    rightMargin: idRectangleInside.width/8
                }
                background: POS_FunctionButton {
                    text: "Save"
                    width: idRectangleInside.width/8
                    height: idRectangleInside.height/3
                    onClicked: {
                        _groupMaster.savePrinter(idTxtFieldPrinterName.text,idComboBoxPrinterList.currentText,idTxtFieldIp.text,idTxtFieldPortNumber.text,idTxtFieldBauderate.text)
                        idTxtFieldPrinterName.text=""
                        idTxtFieldPortNumber.text=""
                        idTxtFieldIp.text=""
                        idTxtFieldBauderate.text=""
                    }
                }
            }
            Button {
                id: idUpdateButton
                anchors{
                    top: idDeleteButton.bottom
                    right: idRectangleInside.right
                    topMargin: idRectangleInside.height/4
                    rightMargin: idRectangleInside.width/8
                }
                visible: false
                background: POS_FunctionButton {
                    text: "Update"
                    width: idRectangleInside.width/8
                    height: idRectangleInside.height/3
                    onClicked: {
                        _groupMaster.edit(idTxtFieldIp.text,idTxtFieldPortNumber.text,idTxtFieldBauderate.text)
                        idSaveButton.visible=true
                        idUpdateButton.visible=false
                        idComboBoxPrinterList.enabled=true
                    }
                }
            }
        }
}
}

