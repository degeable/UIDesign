#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QFont>
#include "backend.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    backend personalModel(0);
    backend insuranceModel(1);
    backend examinationModel(2);
    backend appointmentModel(3);

    const QUrl url(u"qrc:/UiDesign/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url);

    engine.rootContext()->setContextProperty("personalModel", &personalModel);
    engine.rootContext()->setContextProperty("insuranceModel", &insuranceModel);
    engine.rootContext()->setContextProperty("examinationModel", &examinationModel);
    engine.rootContext()->setContextProperty("appointmentModel", &appointmentModel);

    return app.exec();
}
