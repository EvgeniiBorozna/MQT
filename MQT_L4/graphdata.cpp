#include "graphdata.h"
#include <QDebug>

graphData::graphData(QObject *parent)
    : QObject{parent}
{

}

void graphData::makeCalculation(int typeFunc)
{
    coordX.clear();
    coordY.clear();
    for (double i = 0; i <= 5; i += 0.1) {
        coordX.push_back(i);
        if(typeFunc == 0)
            coordY.push_back(sin(i));
        if (typeFunc == 1)
            coordY.push_back(i);
        if(typeFunc == 2)
            coordY.push_back(abs(i - 2.5));
        if(typeFunc == 3)
            coordY.push_back(i * i);
        if(typeFunc == 4)
            coordY.push_back(log2(i));
    }
    if(typeFunc == 5) {
        coordX.clear();
        QList<int> cX, cY;
        double Sx=0, Sy=0, Sx2=0, Sxy=0, N=0;
        cX << QList<int>() << 7 << 31 << 61 << 99 << 129 << 178 << 209;
        cY << QList<int>() << 13 << 10 << 9 << 10 << 12 << 20 << 26;
        N = cX.size() - 1;
        qDebug() << N;
        for(int i = 0; i < N; i++) {
            Sx += cX.at(i);
            Sy += cY.at(i);
            Sx2 += cX.at(i) * cX.at(i);
            Sxy += cX.at(i) * cY.at(i);
        }
        qDebug() << Sx << " " << Sy << " " << Sx2 << " " << Sxy;
        double a, b;
        a = (N*Sxy - (Sx*Sy)) / (N*Sx2 - Sx*Sx);
        b = (Sy - a*Sx) / N;
        coordX.push_back(0);
        coordY.push_back(b);
        coordX.push_back(cX.at(N));
        coordY.push_back(a * cX.at(N) + b);
        qDebug() << a << " " << b;
    }
}

double graphData::getX(int pos)
{
    return coordX.at(pos);
}

double graphData::getY(int pos)
{
    return coordY.at(pos);
}

int graphData::getCount()
{
    return coordX.size();
}
