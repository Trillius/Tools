
# This command is used a LOT both below and in daily life
Set-Alias -Name k -Value kubectl

# Execute a kubectl command against all namespaces
Set-Alias -Name kca -Value 'f(){ kubectl "$@" --all-namespaces;  unset -f f; }; f'

# Apply a YML file
Set-Alias -Name kaf -Value 'kubectl apply -f'

# Drop into an interactive terminal on a container
Set-Alias -Name keti -Value 'kubectl exec -ti'

# Manage configuration quickly to switch contexts between local, dev ad staging.
Set-Alias -Name kcuc -Value 'kubectl config use-context'
Set-Alias -Name kcsc -Value 'kubectl config set-context'
Set-Alias -Name kcdc -Value 'kubectl config delete-context'
Set-Alias -Name kccc -Value 'kubectl config current-context'

# List all contexts
Set-Alias -Name kcgc -Value 'kubectl config get-contexts'

# General aliases
Set-Alias -Name kdel -Value 'kubectl delete'
Set-Alias -Name kdelf -Value 'kubectl delete -f'

# Pod management.
Set-Alias -Name kgp -Value 'kubectl get pods'
Set-Alias -Name kgpw -Value 'kgp --watch'
Set-Alias -Name kgpwide -Value 'kgp -o wide'
Set-Alias -Name kep -Value 'kubectl edit pods'
Set-Alias -Name kdp -Value 'kubectl describe pods'
Set-Alias -Name kdelp -Value 'kubectl delete pods'

# get pod by label: kgpl "app -Value myapp" -n myns
Set-Alias -Name kgpl -Value 'kgp -l'

# Service management.
Set-Alias -Name kgs -Value 'kubectl get svc'
Set-Alias -Name kgsw -Value 'kgs --watch'
Set-Alias -Name kgswide -Value 'kgs -o wide'
Set-Alias -Name kes -Value 'kubectl edit svc'
Set-Alias -Name kds -Value 'kubectl describe svc'
Set-Alias -Name kdels -Value 'kubectl delete svc'

# Ingress management
Set-Alias -Name kgi -Value 'kubectl get ingress'
Set-Alias -Name kei -Value 'kubectl edit ingress'
Set-Alias -Name kdi -Value 'kubectl describe ingress'
Set-Alias -Name kdeli -Value 'kubectl delete ingress'

# Namespace management
Set-Alias -Name kgns -Value 'kubectl get namespaces'
Set-Alias -Name kens -Value 'kubectl edit namespace'
Set-Alias -Name kdns -Value 'kubectl describe namespace'
Set-Alias -Name kdelns -Value 'kubectl delete namespace'
Set-Alias -Name kcn -Value 'kubectl config set-context $(kubectl config current-context) --namespace'

# ConfigMap management
Set-Alias -Name kgcm -Value 'kubectl get configmaps'
Set-Alias -Name kecm -Value 'kubectl edit configmap'
Set-Alias -Name kdcm -Value 'kubectl describe configmap'
Set-Alias -Name kdelcm -Value 'kubectl delete configmap'

# Secret management
Set-Alias -Name kgsec -Value 'kubectl get secret'
Set-Alias -Name kdsec -Value 'kubectl describe secret'
Set-Alias -Name kdelsec -Value 'kubectl delete secret'

# Deployment management.
Set-Alias -Name kgd -Value 'kubectl get deployment'
Set-Alias -Name kgdw -Value 'kgd --watch'
Set-Alias -Name kgdwide -Value 'kgd -o wide'
Set-Alias -Name ked -Value 'kubectl edit deployment'
Set-Alias -Name kdd -Value 'kubectl describe deployment'
Set-Alias -Name kdeld -Value 'kubectl delete deployment'
Set-Alias -Name ksd -Value 'kubectl scale deployment'
Set-Alias -Name krsd -Value 'kubectl rollout status deployment'

# Rollout management.
Set-Alias -Name kgrs -Value 'kubectl get rs'
Set-Alias -Name krh -Value 'kubectl rollout history'
Set-Alias -Name kru -Value 'kubectl rollout undo'

# Port forwarding
Set-Alias -Name kpf -Value "kubectl port-forward"

# Tools for accessing all information
Set-Alias -Name kga -Value 'kubectl get all'
Set-Alias -Name kgaa -Value 'kubectl get all --all-namespaces'

# Logs
Set-Alias -Name kl -Value 'kubectl logs'
Set-Alias -Name klf -Value 'kubectl logs -f'

# File copy
Set-Alias -Name kcp -Value 'kubectl cp'

# Node Management
Set-Alias -Name kgno -Value 'kubectl get nodes'
Set-Alias -Name keno -Value 'kubectl edit node'
Set-Alias -Name kdno -Value 'kubectl describe node'
Set-Alias -Name kdelno -Value 'kubectl delete node'