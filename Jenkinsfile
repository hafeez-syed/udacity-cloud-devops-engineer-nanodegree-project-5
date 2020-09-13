pipeline {
	agent any
	stages {
		stage('Lint HTML') {
              steps {
				  sh 'tidy -q -e blue-app/public/*.html'
				  sh 'tidy -q -e green-app/public/*.html'
              }
         }
		stage('Build') {
			steps {
				nodejs(nodeJSInstallationName: 'node12.8.3') {
					sh 'node --version'
					sh 'npm --version'
					sh 'cd blue-app/ && npm install'
					sh 'cd green-app/ && npm install'
				}
			}
		}
		stage('Lint static files') {
			parallel {
				stage('Lint Javascript files') {
					steps {
						sh 'cd blue-app/ && npm run lint'
						sh 'cd green-app/ && npm run lint'
					}
				}
				stage('Lint HTML files') {
					steps {
						sh 'tidy -q -e blue-app/public/*.html'
						sh 'tidy -q -e green-app/public/*.html'
					}
				}
			}
		}
	}
}