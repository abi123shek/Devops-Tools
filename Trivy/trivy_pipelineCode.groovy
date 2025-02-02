  stage("Trivy Security Scan") {
            steps {
                echo "Running Trivy security scan on Docker image"
                sh '''
                    trivy image --exit-code 0 --format json --output trivy-report.json ${IMAGE_NAME}:${IMAGE_TAG}
                    trivy image --exit-code 1 --severity HIGH,CRITICAL ${IMAGE_NAME}:${IMAGE_TAG} || echo "Trivy scan found vulnerabilities!"
                '''
                
                archiveArtifacts artifacts: 'trivy-report.json', fingerprint: true
                echo "Trivy security scan completed"
            }
        }
