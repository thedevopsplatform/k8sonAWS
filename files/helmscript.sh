rm -rf mychart/templates/*
helm template . --namespace nginx-ingress -f custom.yml > nginx-ingress.yml
kubectl create namespace nginx-ingress
kubectl apply -f nginx-ingress.yml -n nginx-ingress