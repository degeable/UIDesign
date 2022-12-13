pragma Singleton
import QtQuick 2.15

QtObject{
    id: root

    function updatePersonalInformation(name, surname, address, phone, email) {
        root.name = name
        root.surname = surname
        root.address = address
        root.phone = phone
        root.email = email
    }

    function get(id) {
        switch(id.toLowerCase()){
        case "name": return name
        case "surname": return surname
        case "address": return address
        case "phone": return phone
        case "email": return email
        case "ssn": return ssn
        case "company": return company
        }
    }

    function set(id, value){
        switch(id.toLowerCase()){
        case "name": name = value; break;
        case "surname": surname = value; break;
        case "address": address = value; break;
        case "phone": phone = value; break;
        case "email": email = value; break;
        case "ssn": ssn = value; break;
        case "company": company = value; break;
        }
    }

    function addReport(report) {
        console.log("PUSHED!", report)
        reports.push(report)
        console.log(reports[0])
    }

    function getReport(index) {
        console.log("called!!", index, reports[index])
        return reports[index]
    }

    property ListModel reports: ({})
    property string name: ""
    property string surname: ""
    property string address: ""
    property string phone: ""
    property string email: ""

    property string ssn: ""
    property string company: ""
}
