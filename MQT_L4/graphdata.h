#ifndef GRAPHDATA_H
#define GRAPHDATA_H

#include <QObject>
#include <QList>

class graphData : public QObject
{
    Q_OBJECT
public:
    explicit graphData(QObject *parent = nullptr);
    Q_INVOKABLE void makeCalculation(int);
    Q_INVOKABLE double getX(int);
    Q_INVOKABLE double getY(int);
    Q_INVOKABLE int getCount();
    QList<double> coordX;
    QList<double> coordY;
    enum graphType {SIN_X, YeqX, YeqX_25, YeqXX, YeqLOG2X };
private:


signals:

};

#endif // GRAPHDATA_H
