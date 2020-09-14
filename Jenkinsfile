pipeline {
	agent any

	tools { nodejs "NodeJS"	}

	stages {
		stage("Install node packages") {
			parallel {
				stage("Get Node Information") {
					steps {
						sh 'echo " --- Getting NODE and NPM Information --- "'
						sh '''
							node --version
							npm --version
						'''
					}
				}
				stage("Install Blue Application packages") {
					steps {
						sh 'echo " --- Installing Node packages for Blue application --- "'
						sh 'cd ./blue-app/ && npm install'
					}
				}
				stage("Install Green Application packages") {
					steps {
						sh 'echo " --- Installing Node packages for Green application --- "'
						sh 'cd ./green-app/ && npm install'
					}
				}
			}
		}
		stage("Lint static files") {
			parallel {
				stage("Lint Javascript files") {
					steps {
						sh 'echo " --- Running ESlint to check for Javascript Errors --- "'
						sh 'cd ./blue-app/ && npm run lint'
						sh 'cd ./green-app/ && npm run lint'
					}
				}
				stage("Lint HTML files") {
					steps {
						sh 'echo " --- Running Tidy to Check for for Javascript Errors --- "'
						sh 'tidy -q -e ./blue-app/public/*.html'
						sh 'tidy -q -e ./green-app/public/*.html'
					}
				}
			}
		}
		stage("Script Permissions") {
			steps {
				sh 'echo " --- Adding permission to execute the scripts --- "'
				sh '''
					cd ./blue-app
					chmod +x ./build_docker.sh
					chmod +x ./upload_docker.sh
				'''
			}
		}
		stage("Docker") {
			parallel {
				stage("Build Blue Image") {
					steps {
						withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]) {
							sh 'echo " ---- Building Blue Image --- "'
							sh '''
								echo $BUILD_ID
								cd ./blue-app
								./build_docker.sh
							'''
						}
					}
				}
				stage("Push Docker Image") {
					steps {
						withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]) {
							sh 'echo " ---- Pushing Docker Image to the Repository --- "'
							sh '''
								cd ./blue-app
								./upload_docker.sh
							'''
						}
					}
				}
				stage("Build Green Image") {
					steps {
						withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]) {
							sh 'echo " ---- Building Green Image --- "'
						}
					}
				}
				stage("Removing Docker Image") {
					steps {
						sh 'echo " ---- Removing Docker Image --- "'
					}
				}
			}
		}
		stage("Kubernetes Cluster in AWS EKS") {
			parallel {
				stage("Create K8s Cluster") {
					steps {
						withAWS(region:'ap-southeast-2',credentials:'aws-static') {
							sh 'echo " ---- Creating Kubernetes Cluster in AWS --- "'
						}
					}
				}
				stage("Update K8s Cluster Configuration") {
					steps {
						withAWS(region:'ap-southeast-2',credentials:'aws-static') {
							sh 'echo " ---- Updating Kubernetes Cluster Config --- "'
						}
					}
				}
			}
		}
		stage("Run Blue Application") {
			steps {
				sh 'echo " ---- Running Blue Application Container --- echo "'
			}
		}
		stage("Get Kubernetes Info") {
			steps {
				sh 'echo "---- Getting kubectl Info --- "'
			}
		}
		stage("Switch to Green Application") {
			steps {
				sh 'echo " ---- Switching Application from Blue to Green --- echo "'
			}
		}
	}
}