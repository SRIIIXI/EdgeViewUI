import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.3
import QtQuick.Effects

ApplicationWindow
{
    id: mainView

    Material.theme: Material.Light
    Material.accent: applicationData.Theme.AccentColor

    objectName: "mainViewID"
    visible: true

    minimumHeight: 768
    minimumWidth: 1024

    property int iconHeight : width*0.075
    property int iconWidth : width*0.075
    property string oldPage: ""
    property bool isClosing: false

    Component.onCompleted:
    {
        entityForm.close();
        updateMenu("home")
    }

    Label
    {
        id: dummy
    }

    Rectangle
    {
        id: userArea
        height: applicationData.Theme.BarHeight*2
        width:  200
        anchors.top: parent.top
        anchors.left: parent.left
        color: applicationData.Theme.NavigationBarColor
        antialiasing: true

        Rectangle
        {
            id: userImageRect
            width: parent.height*0.5
            height: parent.height*0.5
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: userArea.top
            anchors.topMargin: 10
            radius: height*0.5
            antialiasing: true

            Image
            {
                id: userImage
                source: "../images/SampleUser.png"
                anchors.top: userImageRect.top
                anchors.centerIn: parent
                width: parent.height
                height: parent.height
                visible: false
                antialiasing: true
            }

            MultiEffect
            {
                source: userImage
                anchors.fill: userImage
                maskEnabled: true
                maskSource: mask
                antialiasing: true
            }

            Item
            {
                id: mask
                width: userImage.width
                height: userImage.height
                layer.enabled: true
                visible: false
                antialiasing: true

                Rectangle
                {
                    width: userImage.width
                    height: userImage.height
                    radius: width/2
                    color: applicationData.Theme.NavigationBarColor
                    antialiasing: true
                }
            }
        }

        Label
        {
            text: "Logged User"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: userImageRect.bottom
            anchors.topMargin: 5
            color: applicationData.Theme.FontColor
        }
    }

    Rectangle
    {
        id: menuArea
        width: 200
        height: parent.height - userArea.height
        color: applicationData.Theme.NavigationBarColor
        anchors.left: parent.left
        anchors.top: userArea.bottom

        CustomMenuItem
        {
            id: menuHome
            menuWidth: 200
            menuHeight: applicationData.Theme.BarHeight
            anchors.top: parent.top
            anchors.left: parent.left
            text: "Home"
            isActive: false
            menuIconSource:
            {
                if(applicationData.IsDarkTheme === true)
                {
                    return "../images/HomeWhite.png";
                }
                else
                {
                    return "../images/HomeBlack.png";
                }
            }
            normalColor: applicationData.Theme.NavigationBarColor
            textColor: applicationData.Theme.FontColor
            onClicked:
            {
                updateMenu("home")
                applicationData.invokeSaveCurrentPage("Home.qml")
            }
        }

        CustomMenuItem
        {
            id: menuEnterprises
            menuWidth: 200
            menuHeight: applicationData.Theme.BarHeight
            anchors.top: menuHome.bottom
            anchors.left: parent.left
            text: "Enterprises"
            isActive: false
            menuIconSource:
            {
                if(applicationData.IsDarkTheme === true)
                {
                    return "../images/EnterprisesWhite.png";
                }
                else
                {
                    return "../images/EnterprisesBlack.png";
                }
            }
            normalColor: applicationData.Theme.NavigationBarColor
            textColor: applicationData.Theme.FontColor
            onClicked:
            {
                updateMenu("enterprises")
                applicationData.invokeSaveCurrentPage("Enterprises.qml")
            }
        }

        CustomMenuItem
        {
            id: menuSites
            menuWidth: 200
            menuHeight: applicationData.Theme.BarHeight
            anchors.top: menuEnterprises.bottom
            anchors.left: parent.left
            text: "Sites"
            isActive: false
            menuIconSource:
            {
                if(applicationData.IsDarkTheme === true)
                {
                    return "../images/SitesWhite.png";
                }
                else
                {
                    return "../images/SitesBlack.png";
                }
            }
            normalColor: applicationData.Theme.NavigationBarColor
            textColor: applicationData.Theme.FontColor
            onClicked:
            {
                updateMenu("sites")
                applicationData.invokeSaveCurrentPage("Sites.qml")
            }
        }

        CustomMenuItem
        {
            id: menuAreas
            menuWidth: 200
            menuHeight: applicationData.Theme.BarHeight
            anchors.top: menuSites.bottom
            anchors.left: parent.left
            text: "Areas"
            isActive: false
            menuIconSource:
            {
                if(applicationData.IsDarkTheme === true)
                {
                    return "../images/AreasWhite.png";
                }
                else
                {
                    return "../images/AreasBlack.png";
                }
            }
            normalColor: applicationData.Theme.NavigationBarColor
            textColor: applicationData.Theme.FontColor
            onClicked:
            {
                updateMenu("areas")
                applicationData.invokeSaveCurrentPage("Areas.qml")
            }
        }

        CustomMenuItem
        {
            id: menuDevices
            menuWidth: 200
            menuHeight: applicationData.Theme.BarHeight
            anchors.top: menuAreas.bottom
            anchors.left: parent.left
            text: "Devices"
            isActive: false
            menuIconSource:
            {
                if(applicationData.IsDarkTheme === true)
                {
                    return "../images/DevicesWhite.png";
                }
                else
                {
                    return "../images/DevicesBlack.png";
                }
            }
            normalColor: applicationData.Theme.NavigationBarColor
            textColor: applicationData.Theme.FontColor
            onClicked:
            {
                updateMenu("devices")
                applicationData.invokeSaveCurrentPage("Devices.qml")
            }
        }

        CustomMenuItem
        {
            id: menuAssets
            menuWidth: 200
            menuHeight: applicationData.Theme.BarHeight
            anchors.top: menuDevices.bottom
            anchors.left: parent.left
            text: "Assets"
            isActive: false
            menuIconSource:
            {
                if(applicationData.IsDarkTheme === true)
                {
                    return "../images/AssetsWhite.png";
                }
                else
                {
                    return "../images/AssetsBlack.png";
                }
            }
            normalColor: applicationData.Theme.NavigationBarColor
            textColor: applicationData.Theme.FontColor
            onClicked:
            {
                updateMenu("assets")
                applicationData.invokeSaveCurrentPage("Assets.qml")
            }
        }

        CustomMenuItem
        {
            id: menuRules
            menuWidth: 200
            menuHeight: applicationData.Theme.BarHeight
            anchors.top: menuAssets.bottom
            anchors.left: parent.left
            text: "Rules"
            isActive: false
            menuIconSource:
            {
                if(applicationData.IsDarkTheme === true)
                {
                    return "../images/RulesWhite.png";
                }
                else
                {
                    return "../images/RulesBlack.png";
                }
            }
            normalColor: applicationData.Theme.NavigationBarColor
            textColor: applicationData.Theme.FontColor
            onClicked:
            {
                updateMenu("rules")
                applicationData.invokeSaveCurrentPage("Rules.qml")
            }
        }

        CustomMenuItem
        {
            id: menuRoles
            menuWidth: 200
            menuHeight: applicationData.Theme.BarHeight
            anchors.top: menuRules.bottom
            anchors.left: parent.left
            text: "Roles"
            isActive: false
            menuIconSource:
            {
                if(applicationData.IsDarkTheme === true)
                {
                    return "../images/RolesWhite.png";
                }
                else
                {
                    return "../images/RolesBlack.png";
                }
            }
            normalColor: applicationData.Theme.NavigationBarColor
            textColor: applicationData.Theme.FontColor
            onClicked:
            {
                updateMenu("roles")
                applicationData.invokeSaveCurrentPage("Roles.qml")
            }
        }

        CustomMenuItem
        {
            id: menuUsers
            menuWidth: 200
            menuHeight: applicationData.Theme.BarHeight
            anchors.top: menuRoles.bottom
            anchors.left: parent.left
            text: "Users"
            isActive: false
            menuIconSource:
            {
                if(applicationData.IsDarkTheme === true)
                {
                    return "../images/UsersWhite.png";
                }
                else
                {
                    return "../images/UsersBlack.png";
                }
            }
            normalColor: applicationData.Theme.NavigationBarColor
            textColor: applicationData.Theme.FontColor
            onClicked:
            {
                updateMenu("users");
                applicationData.invokeSaveCurrentPage("Users.qml")
            }
        }

        CustomMenuItem
        {
            id: menuApplications
            menuWidth: 200
            menuHeight: applicationData.Theme.BarHeight
            anchors.top: menuUsers.bottom
            anchors.left: parent.left
            text: "Applications"
            isActive: false
            menuIconSource:
            {
                if(applicationData.IsDarkTheme === true)
                {
                    return "../images/ApplicationsWhite.png";
                }
                else
                {
                    return "../images/ApplicationsBlack.png";
                }
            }
            normalColor: applicationData.Theme.NavigationBarColor
            textColor: applicationData.Theme.FontColor
            onClicked:
            {
                updateMenu("applications")
                applicationData.invokeSaveCurrentPage("Applications.qml")
            }
        }

        CustomMenuItem
        {
            id: menuTelemetry
            menuWidth: 200
            menuHeight: applicationData.Theme.BarHeight
            anchors.top: menuApplications.bottom
            anchors.left: parent.left
            text: "Telemetry"
            isActive: false
            menuIconSource:
            {
                if(applicationData.IsDarkTheme === true)
                {
                    return "../images/TelemetryWhite.png";
                }
                else
                {
                    return "../images/TelemetryBlack.png";
                }
            }
            normalColor: applicationData.Theme.NavigationBarColor
            textColor: applicationData.Theme.FontColor
            onClicked:
            {
                updateMenu("telemetry")
                applicationData.invokeSaveCurrentPage("Telemetry.qml")
            }
        }

        CustomMenuItem
        {
            id: menuAlarms
            menuWidth: 200
            menuHeight: applicationData.Theme.BarHeight
            anchors.top: menuTelemetry.bottom
            anchors.left: parent.left
            text: "Alarms"
            isActive: false
            menuIconSource:
            {
                if(applicationData.IsDarkTheme === true)
                {
                    return "../images/AlarmsWhite.png";
                }
                else
                {
                    return "../images/AlarmsBlack.png";
                }
            }
            normalColor: applicationData.Theme.NavigationBarColor
            textColor: applicationData.Theme.FontColor
            onClicked:
            {
                updateMenu("alarms")
                applicationData.invokeSaveCurrentPage("Alarms.qml")
            }
        }

        CustomMenuItem
        {
            id: menuConfiguration
            menuWidth: 200
            menuHeight: applicationData.Theme.BarHeight
            anchors.top: menuAlarms.bottom
            anchors.left: parent.left
            text: "Configuration"
            isActive: false
            menuIconSource:
            {
                if(applicationData.IsDarkTheme === true)
                {
                    return "../images/ConfigurationWhite.png";
                }
                else
                {
                    return "../images/ConfigurationBlack.png";
                }
            }
            normalColor: applicationData.Theme.NavigationBarColor
            textColor: applicationData.Theme.FontColor
            onClicked:
            {
                updateMenu("configuration")
                applicationData.invokeSaveCurrentPage("Configuration.qml")
            }
        }

        CustomMenuItem
        {
            id: menuAbout
            menuWidth: 200
            menuHeight: applicationData.Theme.BarHeight
            anchors.top: menuConfiguration.bottom
            anchors.left: parent.left
            text: "About"
            isActive: false
            menuIconSource:
            {
                if(applicationData.IsDarkTheme === true)
                {
                    return "../images/AboutWhite.png";
                }
                else
                {
                    return "../images/AboutBlack.png";
                }
            }
            normalColor: applicationData.Theme.NavigationBarColor
            textColor: applicationData.Theme.FontColor
            onClicked:
            {
                updateMenu("about")
                applicationData.invokeSaveCurrentPage("About.qml")
            }
        }

        CustomMenuItem
        {
            id: menuExit
            menuWidth: 200
            menuHeight: applicationData.Theme.BarHeight
            anchors.top: menuAbout.bottom
            anchors.left: parent.left
            text: "Exit"
            isActive: false
            menuIconSource:
            {
                if(applicationData.IsDarkTheme === true)
                {
                    return "../images/ExitWhite.png";
                }
                else
                {
                    return "../images/ExitBlack.png";
                }
            }
            normalColor: applicationData.Theme.NavigationBarColor
            textColor: applicationData.Theme.FontColor
            onClicked:
            {
                applicationData.invokeExit();
            }
        }
    }

    Header
    {
        id: headerPanel
        height: applicationData.Theme.BarHeight
        width: parent.width -  menuArea.width
        anchors.top: parent.top
        anchors.right: parent.right
        headerTitle: "Edge Manager"
    }

    Rectangle
    {
        id: clientArea
        height: parent.height - headerPanel.height
        width: parent.width -  menuArea.width
        anchors.top: headerPanel.bottom
        anchors.right: parent.right

        Home
        {
            id: homePage
            anchors.fill: parent
            visible: false
        }

        Enterprises
        {
            id: enterprisesPage
            anchors.fill: parent
            visible: false
        }

        Sites
        {
            id: sitesPage
            anchors.fill: parent
            visible: false
        }

        Areas
        {
            id: areasPage
            anchors.fill: parent
            visible: false
        }

        Devices
        {
            id: devicesPage
            anchors.fill: parent
            visible: false
            onEditRequested:
            {
                entityForm.open();
            }
        }

        Assets
        {
            id: assetsPage
            anchors.fill: parent
            visible: false
        }

        Rules
        {
            id: rulesPage
            anchors.fill: parent
            visible: false
        }

        Roles
        {
            id: rolesPage
            anchors.fill: parent
            visible: false
        }

        Users
        {
            id: usersPage
            anchors.fill: parent
            visible: false
            onEditRequested:
            {
                entityForm.open();
            }
        }

        Applications
        {
            id: applicationsPage
            anchors.fill: parent
            visible: false
        }

        Telemetry
        {
            id: telemetryPage
            anchors.fill: parent
            visible: false
        }

        Alarms
        {
            id: alarmsPage
            anchors.fill: parent
            visible: false
        }

        Configuration
        {
            id: configurationPage
            anchors.fill: parent
            visible: false
        }

        About
        {
            id: aboutPage
            anchors.fill: parent
            visible: false
        }
    }


    Popup
    {
        id: entityForm
        height: mainView.height
        width: mainView.width*0.5
        y: 0
        x: mainView.width*0.5
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

        background: Rectangle
        {
            color:
            {
                if(applicationData.IsDarkTheme === true)
                {
                    return "darkgrey";
                }
                else
                {
                    return "lightgrey";
                }
            }

            border.color:
            {
                if(applicationData.IsDarkTheme === true)
                {
                    return "white";
                }
                else
                {
                    return "black";
                }
            }
        }

        ToolButton
        {
            anchors.top: parent.top
            anchors.right: parent.right
            height: headerPanel.height*0.75
            width: headerPanel.height*0.75
            icon.source:
            {

                if(applicationData.IsDarkTheme === true)
                {
                    return "../images/CloseWhite.png"
                }
                else
                {
                    return "../images/CloseBlack.png"
                }
            }
            onClicked:
            {
                entityForm.close();
            }
        }
    }

    function updateMenu(menuname)
    {
        menuAlarms.isActive = false;
        menuAreas.isActive = false;
        menuAssets.isActive = false;
        menuDevices.isActive = false;
        menuEnterprises.isActive = false;
        menuHome.isActive = false;
        menuRoles.isActive = false;
        menuRules.isActive = false;
        menuSites.isActive = false;
        menuTelemetry.isActive = false;
        menuUsers.isActive = false;
        menuApplications.isActive = false;
        menuConfiguration.isActive = false;
        menuAbout.isActive = false;

        homePage.visible = false;
        enterprisesPage.visible = false;
        sitesPage.visible = false;
        areasPage.visible = false;
        devicesPage.visible = false;
        assetsPage.visible = false;
        rulesPage.visible = false;
        rolesPage.visible = false;
        usersPage.visible = false;
        applicationsPage.visible = false;
        telemetryPage.visible = false;
        alarmsPage.visible = false;
        configurationPage.visible = false;
        aboutPage.visible = false;

        switch(menuname)
        {
        case "home":
        {
            menuHome.isActive = true;
            homePage.visible = true;
            break;
        }
        case "enterprises":
        {
            menuEnterprises.isActive = true;
            enterprisesPage.visible = true;
            break;
        }
        case "sites":
        {
            menuSites.isActive = true;
            sitesPage.visible = true;
            break;
        }
        case "areas":
        {
            menuAreas.isActive = true;
            areasPage.visible = true;
            break;
        }
        case "devices":
        {
            menuDevices.isActive = true;
            devicesPage.visible = true;
            break;
        }
        case "assets":
        {
            menuAssets.isActive = true;
            assetsPage.visible = true;
            break;
        }
        case "rules":
        {
            menuRules.isActive = true;
            rulesPage.visible = true;
            break;
        }
        case "roles":
        {
            menuRoles.isActive = true;
            rolesPage.visible = true;
            break;
        }
        case "users":
        {
            menuUsers.isActive = true;
            usersPage.visible = true;
            break;
        }
        case "applications":
        {
            menuApplications.isActive = true;
            applicationsPage.visible = true;
            break;
        }
        case "telemetry":
        {
            menuTelemetry.isActive = true;
            telemetryPage.visible = true;
            break;
        }
        case "alarms":
        {
            menuAlarms.isActive = true;
            alarmsPage.visible = true;
            break;
        }
        case "configuration":
        {
            menuConfiguration.isActive = true;
            configurationPage.visible = true;
            break;
        }
        case "about":
        {
            menuAbout.isActive = true;
            aboutPage.visible = true;
            break;
        }
        }
    }

    Connections
    {
        target: applicationData

        function onMenuAction()
        {
            menuModel = applicationData.Menu
        }

        function onPageAction(pg)
        {
            if(pg === 0)
            {
                applicationData.invokeSaveCurrentPage("Home.qml")
            }

            if(pg === 1)
            {
                applicationData.invokeSaveCurrentPage("Enterprises.qml")
            }

            if(pg === 2)
            {
                applicationData.invokeSaveCurrentPage("Sites.qml")
            }

            if(pg === 3)
            {
                applicationData.invokeSaveCurrentPage("Areas.qml")
            }

            if(pg === 4)
            {
                applicationData.invokeSaveCurrentPage("Devices.qml")
            }

            if(pg === 5)
            {
                applicationData.invokeSaveCurrentPage("Assets.qml")
            }

            if(pg === 6)
            {
                applicationData.invokeSaveCurrentPage("Rules.qml")
            }

            if(pg === 7)
            {
                applicationData.invokeSaveCurrentPage("Roles.qml")
            }

            if(pg === 8)
            {
                applicationData.invokeSaveCurrentPage("Users.qml")
            }

            if(pg === 9)
            {
                applicationData.invokeSaveCurrentPage("Telemetry.qml")
            }

            if(pg === 10)
            {
                applicationData.invokeSaveCurrentPage("Alarms.qml")
            }
        }
    }
}
