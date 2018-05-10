#include "groupmaster.h"
#include <QSqlQuery>
#include <QDebug>
#include <QSqlRecord>
#include <QBuffer>
#include <QScreen>
#include <QApplication>
#include <QImage>
#include <QFile>
#include <QPixmap>
#include <QLabel>

GroupMaster::GroupMaster(QObject *parent): QSqlQueryModel (parent)
{
   this->refresh();
}

QHash<int, QByteArray> GroupMaster::roleNames() const
{  
    QHash<int, QByteArray> roles;
    roles[Qt::UserRole + 1] = "Code";
    roles[Qt::UserRole + 2] = "PrinterType";
    roles[Qt::UserRole + 3] = "Ip";
    roles[Qt::UserRole + 4] = "Port";
    roles[Qt::UserRole + 5] = "BaudRate";
    return roles;
}

QVariant GroupMaster::data(const QModelIndex &index, int role) const
{
    QVariant value = QSqlQueryModel::data(index, role);
    if(role < Qt::UserRole)
    {
        value = QSqlQueryModel::data(index, role);
    }
    else
    {
        int columnIdx = role - Qt::UserRole - 1;
        QModelIndex modelIndex = this->index(index.row(), columnIdx);
        value = QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
    }
       qDebug()<< value;
    return value;
}


void GroupMaster::refresh()
{
    qDebug() << "refresh invoked" ;
    QString query = "SELECT Code,PrinterType,Ip,Port,BaudRate FROM 'PRINTERMASTER'";
    this->setQuery(query);

    QSqlQuery query1;
    query1.exec("SELECT COUNT(*) FROM 'PRINTERMASTER'");
    query1.next();
    setTotalCount(query1.value(0).toInt());
    qDebug() <<"total row count"<< m_totalCount;
}


bool GroupMaster::savePrinter(QString Code, QString PrinterType, QString Ip, QString Port, QString BaudRate)
{
    qDebug() << "savePrinter " ;
    QSqlQuery query;
    query.prepare("INSERT INTO 'PRINTERMASTER' (Code,PrinterType,Ip,Port,BaudRate) VALUES (:Code,:PrinterType,:Ip,:Port,:BaudRate)");
            query.bindValue(":Code", Code);
            query.bindValue(":PrinterType", PrinterType);
            query.bindValue(":Ip",Ip );
            query.bindValue(":Port",Port );
            query.bindValue(":BaudRate",BaudRate );

    if(!query.exec()){
        qDebug() << "error insert into " ;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

bool GroupMaster::deletePrinter()
{
    qDebug()<< "printer code"<<m_code;

    QString query1 = ("DELETE FROM 'PRINTERMASTER' WHERE Code='" + m_code + "' ");
    this->setQuery(query1);
}

bool GroupMaster::edit(QString Ip,QString Port,QString BaudRate)
{
    qDebug()<< "Edit Invoked";
    QString query1 =("UPDATE 'PRINTERMASTER' SET Ip='" + Ip + "',Port='" + Port + "',BaudRate='" + BaudRate + "'  WHERE Code='" + m_code + "'");
    this->setQuery(query1);
}

bool GroupMaster::next()
{
    if(m_totalCount!=rowValue)
    {
    rowValue++;
    setCode(record(rowValue).value("Code").toString());
    setPrinterType(record(rowValue).value("PrinterType").toString());
    setIp(record(rowValue).value("Ip").toString());
    setPort(record(rowValue).value("Port").toString());
    setBaudRate(record(rowValue).value("BaudRate").toString());
    }
    else
    {
    qDebug()<< "Empty";
    }
}

bool GroupMaster::previous()
{
    if(rowValue>=1)
    {
    rowValue--;
    setCode(record(rowValue).value("Code").toString());
    setPrinterType(record(rowValue).value("PrinterType").toString());
    setIp(record(rowValue).value("Ip").toString());
    setPort(record(rowValue).value("Port").toString());
    setBaudRate(record(rowValue).value("BaudRate").toString());
    }
}

bool GroupMaster::getCode()
{
   setCode(record(rowValue).value("Code").toString());
}

bool GroupMaster::getRole()
{
   setRole(record(rowValue).value("Role").toString());
}

QString GroupMaster::Code()
{
    return m_code;
}
void GroupMaster::setCode(QString Code)
{
    if(Code != m_code)
    {
        m_code = Code;
        emit CodeChanged();
    }
}

QString GroupMaster::PrinterType()
{
    return m_printerType;
}
void GroupMaster::setPrinterType(QString PrinterType)
{
    if(PrinterType != m_printerType)
    {
        m_printerType = PrinterType;
        emit PrinterTypeChanged();
    }
}

QString GroupMaster::Ip()
{
    return m_ip;
}
void GroupMaster::setIp(QString Ip)
{
    if(Ip != m_ip)
    {
        m_ip = Ip;
        emit IpChanged();
    }
}

QString GroupMaster::Port()
{
    return m_port;
}
void GroupMaster::setPort(QString Port)
{
    if(Port != m_port)
    {
        m_port = Port;
        emit PortChanged();
    }
}

QString GroupMaster::BaudRate()
{
    return m_baudRate;
}
void GroupMaster::setBaudRate(QString BaudRate)
{
    if(BaudRate != m_baudRate)
    {
        m_baudRate = BaudRate;
        emit BaudRateChanged();
    }
}

int GroupMaster::TotalCount()
{
    return m_totalCount;
}
void GroupMaster::setTotalCount(int TotalCount)
{
    if(TotalCount !=m_totalCount)
    {
        m_totalCount=TotalCount-1;
        emit TotalCountChanged();
    }
}

QString GroupMaster::Role()
{
    return m_role;
}
void GroupMaster::setRole(QString Role)
{
    if(Role != m_role)
    {
        m_role = Role;
        emit RoleChanged();
    }
}
