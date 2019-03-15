# https://github.com/BillyBigzz/kubernetes-elasticsearch-cluster

#kubectl delete -f es-discovery-svc.yaml
#kubectl delete -f es-svc.yaml
#kubectl delete -f es-master.yaml
#kubectl delete -f es-ingest-svc.yaml
#kubectl delete -f es-ingest.yaml
#kubectl delete -f es-data.yaml
#sleep 60s;

kubectl create -f es-discovery-svc.yaml
kubectl create -f es-svc.yaml
kubectl create -f es-master-svc.yaml

kubectl create -f es-launch-cluster.yaml

kubectl rollout status -f es-master.yaml

kubectl create -f es-ingest-svc.yaml
kubectl rollout status -f es-ingest.yaml

kubectl rollout status -f es-data.yaml

kubectl create -f kibana-cm.yaml
kubectl create -f kibana-svc.yaml
kubectl create -f kibana.yaml

#kubectl exec -it striim -- bash -c "curl -X PUT 'elasticsearch.default.svc.cluster.local:9200/logs_index'"

#kubectl exec -it striim -- bash -c "curl -XGET 'http://elasticsearch.default.svc.cluster.local:9200/logs_index/_search?pretty=true'"
