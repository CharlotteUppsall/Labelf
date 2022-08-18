pipeline {
        agent any
            stages{
               
   
                    stage('Delete Old Screenshots'){
                            steps{
                                     catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                          sh 'sudo rm Results/selenium-screenshot-*.png'  
                                  }
                          }
                    }
                    stage('AG-16') {
        steps {   
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE')  { 
                

                sh 'robot -d Results -o AG-16-output -l AG-16-log -r AG-16-report Tests/AG-16.robot' }
              
                
                    }
                    post {
                        always {
                            script {
                                  step(
                                        [
                                          $class              : 'RobotPublisher',
                                          outputPath          : 'Results',
                                          outputFileName      : '**/AG-16-output.xml',
                                          reportFileName      : '**/AG-16-report.html',
                                          logFileName         : '**/AG-16-log.html',
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
                    
                    stage('AG-56') {
        steps {   
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE')  { 
                

                sh 'robot -d Results -o AG-56-output -l AG-56-log -r AG-56-report Tests/AG-56.robot' }
              
                
                    }
                    post {
                        always {
                            script {
                                  step(
                                        [
                                          $class              : 'RobotPublisher',
                                          outputPath          : 'Results',
                                          outputFileName      : '**/AG-56-output.xml',
                                          reportFileName      : '**/AG-56-report.html',
                                          logFileName         : '**/AG-56-log.html',
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

                    stage('AG-52') {
        steps {   
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE')  { 
                

                sh 'robot -d Results -o AG-52-output -l AG-52-log -r AG-52-report Tests/AG-52.robot' }
              
                
                    }
                    post {
                        always {
                            script {
                                  step(
                                        [
                                          $class              : 'RobotPublisher',
                                          outputPath          : 'Results',
                                          outputFileName      : '**/AG-52-output.xml',
                                          reportFileName      : '**/AG-52-report.html',
                                          logFileName         : '**/AG-52-log.html',
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
                    
stage('AG-95') {
            steps {      

                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE'){
                sh 'robot -d Results -o AG-95-output -l AG-95-log -r AG-95-report Tests/AG-95.robot'
                    }
                
                    }
                    post {
                        always {
                            script {
                                  step(
                                        [
                                          $class              : 'RobotPublisher',
                                          outputPath          : 'Results',
                                          outputFileName      : '**/AG-95-output.xml',
                                          reportFileName      : '**/AG-95-report.html',
                                          logFileName         : '**/AG-95-log.html',
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
                    
stage('AG-51') {
            steps {      
                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE'){

                sh 'robot -d Results -o AG-51-output -l AG-51-log -r AG-51-report Tests/AG-51.robot'
                   }
                
                    }
                    post {
                        always {
                            script {
                                  step(
                                        [
                                          $class              : 'RobotPublisher',
                                          outputPath          : 'Results',
                                          outputFileName      : '**/AG-51-output.xml',
                                          reportFileName      : '**/AG-51-report.html',
                                          logFileName         : '**/AG-51-log.html',
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
              stage('AG-111-117') {
            steps {      
                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE'){

                sh 'robot -d Results -o AG-111-output -l AG-111-log -r AG-111-report Tests/AG-111.robot'
                   }
                
                    }
                    post {
                        always {
                            script {
                                  step(
                                        [
                                          $class              : 'RobotPublisher',
                                          outputPath          : 'Results',
                                          outputFileName      : '**/AG-111-output.xml',
                                          reportFileName      : '**/AG-111-report.html',
                                          logFileName         : '**/AG-111-log.html',
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
