#ifndef CRYPT_H
#define CRYPT_H

#include <QObject>
#include <QWidget>
#include <QString>

class crypt : public QObject
{
    Q_OBJECT
public:
    explicit crypt(QObject *parent = nullptr);
public slots:
    bool encriptpassword(const QString & mkey);

private: // они все начинаются с m_
    unsigned char * iv = (unsigned char *)("l3j5m78sbr0iyn1m3jhen6uyg7890tr1");

};


#endif // CRYPT_H