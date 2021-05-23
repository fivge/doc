### OpenStack

https://github.com/openstack

- 中文(Mitaka)

  OpenStack Installation Guide for Ubuntu

  https://docs.openstack.org/mitaka/zh_CN/install-guide-ubuntu/index.html

- 英文(Ocata)

  OpenStack Installation Tutorial for Ubuntu

  https://docs.openstack.org/ocata/install-guide-ubuntu/index.html

> 服务

> 实例

> Term

---

### OpenStack 环境搭建

> ### 0x01 设置镜像源
>
> ### 0x02 设置 pip

<https://mirrors.tuna.tsinghua.edu.cn/help/pypi/>

```
修改 ~/.pip/pip.conf (没有就创建一个)， 修改 index-url至tuna，例如

[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
```

> ### 0x03 安装 mysql

**不要安装 mariadb**

> ### 0x04

---

> 直接执行脚本

- Devstackhttps://pom.nops.cloud/deployment_tool/devstack.html

- 官方文档

  - 安装 https://docs.openstack.org/developer/devstack/

  - GitHub https://github.com/openstack-dev/devstack

  - 配置 https://docs.openstack.org/developer/devstack/configuration.html

> 手动部署

OpenStack Mitaka for Ubuntu 16.04 LTS 部署指南 https://www.zybuluo.com/ncepuwanghui/note/389373

官方文档 OpenStack Installation Guide for Ubuntu

https://docs.openstack.org/mitaka/zh_CN/install-guide-ubuntu/index.html

> 第三方文档(仅供参考)

- [ubuntu 16.04 上安装 OpenStack Mitaka （all-in-one）：Nova 安装与配置](http://blog.csdn.net/zhujie_hades/article/details/52181244)

  http://blog.csdn.net/zhujie_hades/article/details/52181244

- 在 Ubuntu 上安装和配置 OpenStack Nova 及 25 问题总结

  http://www.aboutyun.com/thread-6914-1-1.html

- 在 Ubuntu 上安装和配置 OpenStack Nova

  http://www.vpsee.com/2011/05/install-openstack-nova-on-ubuntu/

### 部署迁移

- OPENSTACK 云计算平台管理员手册 -> 配置迁移

  http://docs.ocselected.org/openstack-manuals/kilo/admin-guide-cloud/content/section_configuring-compute-migrations.html

- IBM(主要参考)

  虚拟机在 OpenStack 里没有共享存储条件下的在线迁移

  https://www.ibm.com/developerworks/cn/cloud/library/1508_wangyx_openstacklivemigrate/index.html
