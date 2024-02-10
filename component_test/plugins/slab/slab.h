#ifndef SLAB_H
#define SLAB_H
#include <QObject>
#include <qqml.h>


class slab :public QObject //: public QQuickPaintedItem
{
    Q_OBJECT
    QML_ELEMENT
    Q_DISABLE_COPY(slab)


public:
    explicit slab(QObject *parent = nullptr);
    ~slab() override;
};

#endif // SLAB_H
