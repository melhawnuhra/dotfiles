function krd -d 'restart all pods in a kubernetes deployment'
  echo "Patching deployment... "; and \
  kubectl patch deployment/$argv -p \
    "{\"spec\":{\"template\":{\"metadata\":{\"annotations\":{\"dummy-date\":\"".(date +'%s')."\"}}}}}"; and \
  echo "Waiting for rollout... "; and \
  kubectl rollout status deployment/$argv
end
