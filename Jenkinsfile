pipeline {
	agent any
	stages {	
			
		stage('Lint static files') {
			parallel {
				stage('Lint Javascript files) {
					steps {
						sh 'cd blue-app/ && npm run lint'
						sh 'cd green-app/ && npm run lint'
					}
				}
				stage('Lint HTML files) {
					steps {
						sh 'tidy -q -e blue-app/public/*.html'
						sh 'tidy -q -e green-app/public/*.html'
					}
				}
			}
		}
		
		stage('Build Docker Image') {
			steps {
				withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'Dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
					sh '''
						docker build -t andresaaap/cloudcapstone:$BUILD_ID .
					'''
				}
			}
		}

		stage('Push Image To Dockerhub') {
			steps {
				withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'Dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
					sh '''
						docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
						docker push andresaaap/cloudcapstone:$BUILD_ID
					'''
				}
			}
		}

		stage('Set current kubectl context') {
			steps {
				withAWS(region:'us-east-1', credentials:'aws-static') {
					sh '''
						kubectl config use-context arn:aws:eks:us-east-1:546547842218:cluster/prodalvima2
					'''
				}
			}
		}

		stage('Create blue container') {
			steps {
				withAWS(region:'us-east-1', credentials:'aws-static') {
					sh '''
						kubectl run blueimage --image=andresaaap/cloudcapstone:$BUILD_ID --port=80
					'''
				}
			}
		}

		stage('Expose container') {
			steps {
				withAWS(region:'us-east-1', credentials:'aws-static') {
					sh '''
						kubectl expose deployment blueimage --type=LoadBalancer --port=80
					'''
				}
			}
		}

		stage('Domain redirect blue') {
			steps {
				withAWS(region:'us-east-1', credentials:'aws-static') {
					sh '''
						aws route53 change-resource-record-sets --hosted-zone-id ZKCU19G790VD6 --change-batch file://alias-record.json
					'''
				}
			}
		}
	}
}