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
    bool decript(const QString & mkey);
    QString decryptpassword();

private: // они все начинаются с m_
    unsigned char * iv = (unsigned char *)("l3j5m78sbr0iyn1m3jhen6uyg7890tr1");
    std::string in_file="file/1.txt";

};


#endif // CRYPT_H
