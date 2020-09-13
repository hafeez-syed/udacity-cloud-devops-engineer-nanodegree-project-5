pipeline {
	agent any

	tools { nodejs 'NodeJS'	}

	stages {
		stage('Install node packages') {
			steps {
				sh 'node --version'
				sh 'npm --version'
				sh 'cd blue-app/ && npm install'
				sh 'cd green-app/ && npm install'
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