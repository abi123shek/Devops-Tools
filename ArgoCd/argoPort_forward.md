# port forward on the basis of your port define in nodeport
```bash kubectl port-forward service/argocd-server -n argocd 32547:443 --address=0.0.0.0 & ```

after configuring your argo service then run in your browser using ``` bash https://<yourip>:<your port> ```

# Default Username and Password
* username: admin
* password: ``` kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode```
  first we need to retirve default password using above commnad
