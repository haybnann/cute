cmake_minimum_required(VERSION 3.16)

project(component_test VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appcomponent_test
    main.cpp
)

qt_add_qml_module(appcomponent_test
    URI component_test
    QML_FILES Main.qml
)

add_subdirectory(plugins)

qt_import_plugins(appcomponent_test
    #add all statically linked plugins
    slabplugin
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appcomponent_test PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appcomponent_test
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

add_definitions(-DQT_STATIC_PLUGIN)

target_link_libraries(appcomponent_test
    PRIVATE
        Qt6::Quick
        slabplugin
)


include(GNUInstallDirs)
install(TARGETS appcomponent_test
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
