# dnmp

使用 docker-compose 快速搭建 php 运行环境

## 安装

1. 克隆 dnmp 仓库
```bash
git clone https://github.com/duoyuhub/dnmp.git
```
2. 进入 dnmp 目录
```bash
cp env-example .env
cp docker-compose-example.yml docker-compose.yml
```
3. 修改 .env 文件
```
ROOT_DIR= ~/Sites
MYSQL5_ROOT_PASSWORD=123456
```
4. 运行容器

```bash
docker-compose up -d
```



## 使用
1. 运行指定容器

```bash
docker-compose up -d  nginx mysql5
```

2. 进入容器

```bash
docker-compose exec nginx sh
```

3. 编辑数据库配置文件

```bash
DB_HOST=mysql5
REDIS_HOST=redis
```

4. 打开浏览器访问 localhost

## 文档
[Docker]

### 列出正在运行的容器
```
docker ps
```
也可用一下命令查看某个项目的容器
```
docker-compose ps
```

### 进入某个容器
```
docker-compose exec {container-name} bash
```

### 关闭所有容器
```
docker-compose stop
```
停止某个容器
```
docker-compose stop {容器名称}
```
### 删除所有容器
```
docker-compose down
```




