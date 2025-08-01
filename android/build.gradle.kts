// Top-level build file where you can add configuration options common to all sub-projects/modules.

plugins {
    // Versão do plugin do Google Services, marcada como 'apply false' (será usada no app)
    id("com.google.gms.google-services") version "4.4.3" apply false
}

buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        // Plugin do Android
        classpath("com.android.tools.build:gradle:8.4.1")
        // Plugin do Google Services
        classpath("com.google.gms:google-services:4.4.3")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Diretório customizado opcional para os builds (você pode remover se não for necessário)
val newBuildDir = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.set(newBuildDir)

subprojects {
    val newSubprojectBuildDir = newBuildDir.dir(project.name)
    project.layout.buildDirectory.set(newSubprojectBuildDir)
    project.evaluationDependsOn(":app")
}

// Tarefa para limpar a build
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
