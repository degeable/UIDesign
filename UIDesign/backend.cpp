#include "backend.h"

backend::backend(int type, QObject* parent)
{
    switch(type) {
    // 0 = User information
    case 0: {
        m_data << Data("Name", "")
               << Data("Surname", "")
               << Data("Address", "")
               << Data("Phone", "")
               << Data("Email", "");
         break;
    }
        // 0 = Insurance information
        case 1: {
            m_data << Data("SSN", "")
                   << Data("Company", "");
             break;
        }
        // 2 = Exmaination Results
        case 2: {
           // m_data << Data("Mon Dec 12", "Example text for an examination Report.");
             break;
        }
        // 3 = Exmaination Results
    case 3: {
      //  m_data << Data("Mon Dec 12, 8am", "Boston Medical Center");
        break;
    }
    }
}

int backend::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()){
        return 0;
    }

    return m_data.count();
}

QHash<int, QByteArray> backend::roleNames() const
{
    static QHash<int ,QByteArray> mapping {
        {NameRole, "key"},
        {ValueRole, "value"}
    };

    return mapping;
}

QVariant backend::data(const QModelIndex &index, int role) const
{
    if ( !index.isValid() )
        return QVariant();

    const Data &data = m_data.at(index.row());

    if ( role == NameRole ){
        return data.key;
    }
    else if ( role == ValueRole )
        return data.value;
    else
        return QVariant();
}

void backend::removeData(int row)
{
    if (row < 0 || row >= m_data.count())
        return;

    beginRemoveRows(QModelIndex(), row, row);
    m_data.removeAt(row);
    endRemoveRows();
}

bool backend::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (!hasIndex(index.row(), index.column(), index.parent()) || !value.isValid())
        return false;

    Data &item = m_data[index.row()];
    if (role == NameRole) {
        item.key = value.toString();
    } else if (role == ValueRole) {
        item.value = value.toString();
    } else return false;

    emit dataChanged(index, index, { role } );

    return true ;
}

bool backend::insertRows(int row, int count, const QModelIndex &parent)
{
    beginInsertRows(QModelIndex(), row, row+count-1);

    for (int r = 0; r < count; ++r) {
        m_data.append(Data("new", "row"));
    }

    endInsertRows();
    return true;

}
