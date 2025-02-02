# you need to add code in your jenkins pipeline

stage("Trigger ArgoCD Deployment") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'argocd-credentials', 
                passwordVariable: 'ARGO_PASS', usernameVariable: 'ARGO_USER')]) {
                    sh "argocd login localhost:8080 --username $ARGO_USER --password $ARGO_PASS --insecure"
                    sh "argocd app sync basic-app"
                }
                echo "ArgoCD Deployment Triggered"
            }
        }
