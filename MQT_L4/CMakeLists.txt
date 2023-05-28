cmake_minimum_required(VERSION 3.16)

project(MQT_L4 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick Charts)

qt_standard_project_setup()

qt_add_executable(appMQT_L4
    main.cpp
    graphdata.h graphdata.cpp
)

qt_add_qml_module(appMQT_L4
    URI MQT_L4
    VERSION 1.0
    QML_FILES Main.qml
)

set_target_properties(appMQT_L4 PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appMQT_L4
    PRIVATE Qt6::Quick Qt6::Charts

)

install(TARGETS appMQT_L4
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
