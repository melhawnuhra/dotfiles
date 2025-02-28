if not set -q kube_abbrs_initialized
  set -U kube_abbrs_initialized
  echo -n Setting Kubernetes abbreviations...

  abbr k 'kubectl'
  abbr ka 'kubectl apply'

  abbr kc 'kubectl config get-contexts'
  abbr kcs 'kubectl config set current-context'

  abbr kd 'kubectl describe'
  abbr kdd 'kubectl describe deployment'
  abbr kdi 'kubectl describe ingress'
  abbr kdp 'kubectl describe pod'
  abbr kdr 'kubectl describe replicaset'
  abbr kdn 'kubectl describe namespace'
  abbr kds 'kubectl describe service'
  abbr ke 'kubectl exec'
  abbr keb 'kubectl exec -it bash'
  abbr kes 'kubectl exec -it sh'

  abbr kg 'kubectl get'
  abbr kga 'kubectl get all'
  abbr kgd 'kubectl get deployment'
  abbr kgi 'kubectl get ingress'
  abbr kgp 'kubectl get pod'
  abbr kgr 'kubectl get replicaset'
  abbr kgn 'kubectl get namespace'
  abbr kgs 'kubectl get service'
  abbr kl 'kubectl logs'
  abbr klf 'kubectl logs -f'
end

