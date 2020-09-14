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
		stage("Adding Script Permissions") {
			steps {
				sh 'echo " --- Adding permission to execute the scripts --- "'
				sh '''
					cd ./blue-app
					chmod +x ./build_docker.sh
					chmod +x ./upload_docker.sh
					chmod +x ./remove_docker.sh
					chmod +x ./blue-app.yaml
					chmod +x ./blue-service.yaml
				'''
				sh '''
					cd ./green-app
					chmod +x ./build_docker.sh
					chmod +x ./upload_docker.sh
					chmod +x ./remove_docker.sh
					chmod +x ./green-app.yaml
					chmod +x ./green-service.yaml
				'''
			}
		}
		stage("Build Docker Images") {
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
				stage("Build Green Image") {
					steps {
						withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]) {
							sh 'echo " ---- Building Green Image --- "'
							sh '''
								echo $BUILD_ID
								cd ./green-app
								./build_docker.sh
							'''
						}
					}
				}
				stage("List Images after Building") {
					sh 'echo " ---- Listing Dockers Images --- "'
					sh 'docker images'
				}
			}
		}
		stage("Push Docker Images") {
			parallel {
				stage("Push Blue Image") {
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
				stage("Push Green Image") {
					steps {
						withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]) {
							sh 'echo " ---- Pushing Docker Image to the Repository --- "'
							sh '''
								cd ./green-app
								./upload_docker.sh
							'''
						}
					}
				}
				stage("List Images after Pushing to Registry") {
					sh 'echo " ---- Listing Dockers Images --- "'
					sh 'docker images'
				}
			}
		}
		stage("Remove Docker Images") {
			parallel {
				stage("Remove Blue Image") {
					steps {
						sh 'echo " ---- Removing Blue Image --- "'
						sh '''
							cd ./blue-app
							./remove_docker.sh
						'''
					}
				}
				stage("Remove Green Image") {
					steps {
						sh 'echo " ---- Removing Green Image --- "'
						sh '''
							cd ./green-app
							./remove_docker.sh
						'''
					}
				}
				stage("List Images after Deleting") {
					sh 'echo " ---- Listing Dockers Images --- "'
					sh 'docker images'
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