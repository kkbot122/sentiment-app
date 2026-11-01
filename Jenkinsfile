pipeline {
    agent any

    environment {
        SENTIMENT_PROPERTIES = 'config/sentiment.properties'
        DOCKER_IMAGE = 'sentiment-worker:latest'
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
                echo 'Checked out source code from configured Git repository.'
            }
        }
        stage('Sentiment Test Suite') {
            steps {
                sh '''
                    if [ ! -f "$SENTIMENT_PROPERTIES" ]; then
                        echo "ERROR: $SENTIMENT_PROPERTIES not found"
                        exit 1
                    fi
                    if ! grep -q '^BATCH=500$' "$SENTIMENT_PROPERTIES"; then
                        echo "ERROR: $SENTIMENT_PROPERTIES does not contain BATCH=500"
                        exit 1
                    fi
                    echo "Validation passed: $SENTIMENT_PROPERTIES contains BATCH=500"
                '''
            }
        }
        stage('Package Container') {
            steps {
                sh 'docker build -t sentiment-worker:latest -f docker/Dockerfile docker'
                echo 'Built Docker image sentiment-worker:latest'
            }
        }
    }
}
