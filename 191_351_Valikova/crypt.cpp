#include "crypt.h"
#include <QString>
#include <openssl/conf.h>
#include <openssl/evp.h>
#include <openssl/err.h>
#include <QFile>
#include <QByteArray>
#include <QImage>
#include <QIODevice>
#include <QObject>
#include <QTemporaryFile>
#include <openssl/aes.h>
#include <QBuffer>


crypt::crypt(QObject *parent) : QObject(parent)
{

}

bool crypt::encriptpassword(const QString & mkey){ //, const QString & out_file

    EVP_CIPHER_CTX *ctx;

    if(!(ctx = EVP_CIPHER_CTX_new())){ // выделение памяти, аналогичное new()
        return false;
    }

    if(1 != EVP_EncryptInit_ex(ctx,
                               EVP_aes_256_cfb(), // тип шифрования
                               NULL,
                               reinterpret_cast<unsigned char *>(mkey.toLatin1().data()), // из QML ключ
                               iv)) // вектор инициализации
    {
        return false;
    }

    unsigned char mytext[256] = {0};
    unsigned char plaintexttext[256] = {0};
    int len = 0, plaintext_len = 0;
    QFile file("C:/exam/191_351_Valikova/file/1.txt");
    file.open(QIODevice::ReadWrite | QIODevice::Truncate);
    plaintext_len = mkey.length();

    while(plaintext_len > 0/*условие конфа файла*/){ // цикл шифрования

        if(1 != EVP_EncryptUpdate(ctx, // уже заполненная структура с настройками
                                  mytext, // выходной параметр, бувур, куда записывается шифрованный текст
                                  &len, // выходной параметр, количество зашифрованных символов, объем в байтах
                                  plaintexttext, // входной параметр, шифруемый буфер
                                  plaintext_len)) // входной параметр, количество исходных символов
        {
            return false;
        }
        file.write((char *)mytext, len);
        plaintext_len-=1;
    }

    if(1 != EVP_EncryptFinal_ex(ctx,
                                mytext + len,
                                &len))
    {
        return false;
    }
    file.write((char*)mytext, len);
    EVP_CIPHER_CTX_free(ctx);
    file.close();
    return true;
}

bool crypt::decript(const QString & mkey){ //, const QString & out_file

    EVP_CIPHER_CTX *ctx; // СИшная структура
    if(!(ctx = EVP_CIPHER_CTX_new())){ // выделение памяти, аналогичное оператору-C++ new()
        return false;
    }
    if(1 != EVP_DecryptInit_ex(ctx, // уже выделенная в памяти структура, в которую будут заноситься параметры
                               EVP_aes_256_cfb(), // параметр, отвечающий за тип шифрования
                               NULL,
                               reinterpret_cast<unsigned char *>(mkey.toLatin1().data()), // ключ шифрования, из QML
                               iv)) // вектор инициализации
    {
        return false;
    }
    unsigned char mytext[256] = {0};
    unsigned char plaintexttext[256] = {0};
    int len = 0, plaintext_len = 0;
    // открыть файл с исходными данными (только для чтения) через QFile file_in(mkey); file_in.open(QFile::ReadOnly);
    QFile file("C:/exam/191_351_Valikova/file/1.txt");

    file.open(QIODevice::ReadWrite | QIODevice::Truncate);
    plaintext_len = mkey.length();

    while(plaintext_len > 0/*условие конфа файла*/){ // цикл шифрования


        if(1 != EVP_DecryptUpdate(ctx, mytext, &len, plaintexttext, plaintext_len))
        {
            return false;
        }
        //Запись mytext в файл шифрованных данных
        file.write((char *)mytext, len);
        plaintext_len-=1;

    }

    if(!EVP_DecryptFinal_ex(ctx, mytext + len, &len))
                return false;

    file.write((char*)mytext, len);
    EVP_CIPHER_CTX_free(ctx);
    file.close();
    return true;
}


QString crypt:: decryptpassword(){
    QFile file("C:/exam/191_351_Valikova/file/1.txt");
    file.open(QIODevice::ReadWrite | QIODevice::Truncate);
}
