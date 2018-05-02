TEMPLATE = app

QT += qml quick sql widgets
CONFIG += c++11

SOURCES += main.cpp \
    groupmaster.cpp \
    rolemaster.cpp \
    usermaster.cpp

RESOURCES += qml.qrc \
    fonts.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += connection.h \
    usermaster.h
 HEADERS +=   groupmaster.h
 HEADERS +=   rolemaster.h

DISTFILES +=
