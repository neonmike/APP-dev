allprojects {
    repositories {
        // 优先使用官方仓库（最全）
        google()
        mavenCentral()

        // 可选：使用阿里云镜像作为 fallback（解决部分网络问题）
        maven { url = uri("https://maven.aliyun.com/repository/google") }
        maven { url = uri("https://maven.aliyun.com/repository/central") }
        maven { url = uri("https://maven.aliyun.com/repository/gradle-plugin") }

        // 已废弃的 jcenter 镜像不要用了，可能导致构建失败
        // maven { url = uri("https://maven.aliyun.com/repository/jcenter") }
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
