pipeline {
	agent any

	tools { nodejs "NodeJS"	}

	stages {
		stage("Install node packages") {
			steps {
				sh '''
					node --version
					npm --version
					cd blue-app/ && npm install
					cd green-app/ && npm install
				'''
			}
		}
		stage("Lint static files") {
			parallel {
				stage("Lint Javascript files") {
					steps {
						sh " --- Running ESlint to check for Javascript Errors --- "
						sh "cd blue-app/ && npm run lint"
						sh "cd green-app/ && npm run lint"
					}
				}
				stage("Lint HTML files") {
					steps {
						sh " --- Running Tidy to Check for for Javascript Errors --- "
						sh "tidy -q -e blue-app/public/*.html"
						sh "tidy -q -e green-app/public/*.html"
					}
				}
			}
		}
		stage("Script Permissions") {
			steps {
				sh " --- Adding permission to execute the scripts --- "
				sh ""
				sh ""
				sh ""
				sh ""
			}
		}
		stage("Docker") {
			parallel {
				stage("Build Docker Image") {
					steps {
						sh " ---- Building Docker Image --- "
						sh ""
					}
				}
				stage("Push Docker Image") {
					steps {
						sh " ---- Pushing Docker Image to the Repository --- "
						sh ""
					}
				}
				stage("Removing Docker Image") {
					steps {
						sh " ---- Removing Docker Image --- "
						sh ""
					}
				}
			}
		}
		stage("Kubernetes Cluster in AWS") {
			parallel {
				stage("Create K8s Cluster") {
					steps {
						sh " ---- Creating Kubernetes Cluster in AWS --- "
						sh ""
					}
				}
				stage("Update K8s Cluster Configuration") {
					steps {
						sh " ---- Updating Kubernetes Cluster --- "
						sh ""
					}
				}
				stage("Removing Docker Image") {
					steps {
						sh " ---- Removing Docker Image --- "
						sh ""
					}
				}
			}
		}
		stage("Run Blue Application") {
			steps {
				sh " ---- Running Blue Application Container --- "
				sh ""
			}
		}
		stage("Get Kubernetes Info") {
			steps {
				sh " ---- Getting kubectl Info --- "
				sh ""
			}
		}
	}
}