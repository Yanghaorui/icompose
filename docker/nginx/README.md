# Docker Image
     docker pull nginx

# 修改hosts文件
根据需要编辑etc/hosts文件，将127.0.0.1 和 服务名 对应。目的是为了在 通过服务名访问时候能命中nginx.
    
    127.0.0.1       user-service  
    127.0.0.1       permission-service
    127.0.0.1       report-service
    127.0.0.1       member-service
    127.0.0.1       masterdata-service
    127.0.0.1       trans-service

# 启动docker compose
启动docker compose, 会将conf.d文件夹中的配置推到nginx中
#### dev config 可以通过conf.d添加下列配置文件，启动好nginx后通过 http://masteredata-service访问到dev环境。
```shell
    server {
    listen       80;
    listen  [::]:80;
    server_name  masterdata-service;

    location / {
        proxy_pass https://masterdata-service.crm.dev.httpcntesting.thelegogroup.cn/; #dev.master-data 服务被ingress代理的公网地址
    }
}
```
#### local
```shell
server {
    listen       80;
    listen  [::]:80;
    server_name  masterdata-service;

    location / {
        proxy_pass http://host.docker.internal:7010/;
    }
}
```

# 切换本地和dev环境
有时候，需要切换将原本 http://masterdata-service 访问的dev 环境改为本地环境：只需要执行下列命令即可
```shell
sh run.sh local masterdata
```