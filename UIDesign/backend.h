#ifndef BACKEND_H
#define BACKEND_H
#include <QAbstractListModel>
#include <QDebug>

struct Data {
    Data() {}

    Data(const QString& key, const QString& value) : key(key), value(value) {}

    QString key, value;
};

class backend : public QAbstractListModel
{
    Q_OBJECT
public:

    enum Roles {
        NameRole = Qt::UserRole,
        ValueRole
    };

   explicit backend(int type, QObject* parent = 0);

   int rowCount(const QModelIndex& parent) const override;
   QVariant data(const QModelIndex& index, int role = Qt::DisplayRole ) const override;
   QHash<int, QByteArray> roleNames() const override;

   bool setData(const QModelIndex &index, const QVariant &value, int role) override;
   bool insertRows(int row, int count, const QModelIndex &parent = QModelIndex()) override;

   Q_INVOKABLE QString data(backend::Roles role = backend::Roles::ValueRole) const
   {
       return data(index(0, 0), role).toString();
   }

   Q_INVOKABLE void append(const QString& key, const QString& value) {
       insertRows(m_data.count() , 1);
       setData(index(m_data.count() -1, 0), key, NameRole);
       setData(index(m_data.count() -1, 0), value, ValueRole);
   }

public slots:
   void removeData(int index);
private:
   QVector< Data > m_data;
};

#endif // BACKEND_H
