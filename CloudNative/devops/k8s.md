[在 MAC 上安装 K8S (kubernets) for Docker Desktop](https://zhuanlan.zhihu.com/p/65559363)

https://github.com/gotok8s/k8s-docker-desktop-for-mac

#### k8s

```bash
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl


curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.17.0/bin/linux/amd64/kubectl


curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.16.4/bin/linux/amd64/kubectl

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
```

#### minikube

https://minikube.sigs.k8s.io/docs/start/linux/

https://github.com/kubernetes/minikube/issues/6167

```bash

minikube start  --cpus=2 --disk-size='10g' --image-mirror-country='cn' --image-repository='registry.cn-hangzhou.aliyuncs.com/google_containers'

sudo minikube start --vm-driver=none

sudo minikube start --vm-driver=none --image-mirror-country='cn' --image-repository='registry.cn-hangzhou.aliyuncs.com/google_containers' --kubernetes-version='v1.16.4'

sudo minikube start --vm-driver=none --image-mirror-country='cn' --kubernetes-version='v1.16.4'



--kubernetes-version v1.12.1

--kubernetes-version='': The k
```

```bash
* Configuring local host environment ...
*
! The 'none' driver provides limited isolation and may reduce system security and reliability.
! For more information, see:
  - https://minikube.sigs.k8s.io/docs/reference/drivers/none/
*
! kubectl and minikube configuration will be stored in /root
! To use kubectl or minikube commands as your own user, you may need to relocate them. For example, to overwrite your own settings, run:
*
  - sudo mv /root/.kube /root/.minikube $HOME
  - sudo chown -R $USER $HOME/.kube $HOME/.minikube
*
* This can also be done automatically by setting the env var CHANGE_MINIKUBE_NONE_USER=true
* Done! kubectl is now configured to use "minikube"
* For best results, install kubectl: https://kubernetes.io/docs/tasks/tools/install-kubectl/
```

#### fussion

<https://github.com/fission/fission>

<https://docs.fission.io/docs/installation/#install-fission>

[基于 K8S 部署 fission 函数即服务](https://juejin.im/post/5b70da49f265da281b642153)

https://mp.weixin.qq.com/s/7WeUUXWIdxWrC70NwBOivg

```bash
kubectl create namespace fission



```
