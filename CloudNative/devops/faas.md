<https://mp.weixin.qq.com/s/7WeUUXWIdxWrC70NwBOivg>

```bash
kubectl create namespace fission

kubectl -n fission apply -f https://github.com/fission/fission/releases/download/1.7.1/fission-all-1.7.1-minikube.yaml


curl -Lo fission https://github.com/fission/fission/releases/download/1.7.1/fission-cli-linux && chmod +x fission && sudo mv fission /usr/local/bin/

kubectl --namespace fission get svc



fission env create --name nodejs --image fission/node-env:1.7.1


fission env create --name nodejs --image fission/node-env

fission function create --name hello --env nodejs --code hello.js

fission function test --name hello

fission route create --method GET --url /hello --function hello

curl http://localhost:8888/hello

curl http://localhost:32783/hello

curl http://localhost:80/hello

fission function create --name weather --env nodejs --code weather.js
fission function create --name world --env nodejs --code world.js

fission route create --method POST --url /weather --function weather


curl -qs -H "Content-Type: application/json" -X POST -d '{"location":"Sieteiglesias, Spain"}' http://127.0.0.1:31314/weather|jq

curl -qs -H "Content-Type: application/json" -X POST -d '{"location":"Sieteiglesias, Spain"}' http://127.0.0.1:31314/weather|jq
```
