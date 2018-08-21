if not set -q kube_abbrs_initialized
  set -U kube_abbrs_initialized
  echo -n Setting Kubernetes abbreviations...

  abbr k 'kubectl'
  abbr kd 'kubectl describe'
  abbr kdd 'kubectl describe deployment'
  abbr kdp 'kubectl describe pod'
  abbr kds 'kubectl describe service'
  abbr kg 'kubectl get'
  abbr kgd 'kubectl get deployment'
  abbr kgp 'kubectl get pod'
  abbr kgs 'kubectl get service'
  abbr kl 'kubectl logs'

  echo 'Done'
end

