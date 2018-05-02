#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "connection.h"
#include "groupmaster.h"
#include "rolemaster.h"
#include "usermaster.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    if (!createConnection())
    {
        qDebug() << Q_FUNC_INFO << "Unable to connect to database. Please close application ...";
    }

    GroupMaster groupM;
    RoleMaster roleM;
    UserMaster userM;

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("_groupMaster", &groupM);
    engine.rootContext()->setContextProperty("_roleMaster",&roleM);
    engine.rootContext()->setContextProperty("_userMaster",&userM);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
