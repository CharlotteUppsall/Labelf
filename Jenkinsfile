pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/CharlotteUppsall/Labelf.git'
            }
        }
             stage('Robot Framework System tests with Selenium') {
                    steps {

                        sh 'robot --variable BROWSER:headlesschrome -d Results -i appWorkspace Tests'
                    }
                    post {
                        always {
                            script {
                                  step(
                                        [
                                          $class              : 'RobotPublisher',
                                          outputPath          : 'Results',
                                          outputFileName      : '**/output.xml',
                                          reportFileName      : '**/report.html',
                                          logFileName         : '**/log.html',
                                          disableArchiveOutput: false,
                                          passThreshold       : 50,
                                          unstableThreshold   : 40,
                                          otherFiles          : "**/*.png,**/*.jpg",
                                        ]
                                       )
                                  }
                            }
                        }
                    }
            }
        
    }
