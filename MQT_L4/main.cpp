#include <QApplication>
#include <QQmlApplicationEngine>
//#include <QtQml>

#include "graphdata.h"


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/MQT_L4/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    qmlRegisterType<graphData>("ru.kpd.MyRegisteredClass", 1, 0, "GraphData");

    engine.load(url);

    return app.exec();
}
