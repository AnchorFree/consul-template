#!groovy

pipeline {
    agent { label 'ubuntu16'
    }

    stages {
        stage('Build') {
            steps {
                dockerBuildTagPush(
                    build_args: (String[])[
                        "--file=docker/alpine/Dockerfile"
                    ]
                )
            }
        }
    }
}
