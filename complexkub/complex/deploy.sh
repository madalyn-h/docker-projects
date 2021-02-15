docker build -t madalynharger/multi-client:latest -t madalynharger/multi-client:$SHA ./client/Dockerfile ./client
docker build -t madalynharger/multi-server:latest -t madalynharger/multi-server:$SHA ./server/Dockerfile ./server
docker build -t madalynharger/multi-worker:latest -t madalynharger/multi-worker:$SHA ./worker/Dockerfile ./worker
docker push madalynharger/multi-client:latest
docker push madalynharger/multi-client:$SHA
docker push madalynharger/multi-server:latest
docker push madalynharger/multi-server:$SHA
docker push madalynharger/multi-worker:latest
docker push madalynharger/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=madalynharger/multi-server:$SHA
kubectl set image deployments/client-deployment client=madalynharger/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=madalynharger/multi-worker:$SHA
