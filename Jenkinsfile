
pipeline {
        agent any
            stages{
            
                    stage('test') {
        steps {   
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE')  { 
                

                sh 'robot -d Results Tests/basic_functions.robot' }
              
                
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
