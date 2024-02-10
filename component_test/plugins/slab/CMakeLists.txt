cmake_minimum_required(VERSION 3.16)

project(slab_project VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(QT_QML_OUTPUT_DIRECTORY  ${CMAKE_BINARY_DIR})

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_library(slab STATIC)

qt_add_qml_module(slab
    URI "com.lilith.slab"
    QML_FILES
        Slab.qml
        SlabControls.qml
    SOURCES
        slab.h
        slab.cpp
)

target_compile_definitions(slab
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(slab
    PRIVATE Qt6::Quick)

target_include_directories(slab PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

