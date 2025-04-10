# Cloudreve安装教程

### 前言

​	在日常生活中我们有各种各样的网盘服务，比如*GoogleDrive*、*OneDrive*、*Dorpbox*、*Mega*以及一些国内的，*百度网盘*、*阿里网盘*、*115网盘*、*天翼云*、*坚果云*、*蓝奏云*等等，网盘的服务太多了，但大部分同学使用中遇到的最多的问题是...『**限速**』，经历了*百度网盘*成为国内网盘界龙头的过程中，我们大部分使用*百度网盘*的同学都会烦恼这一点，在一些技术大牛的开发下，出现了一些不限速的第三方客户端，比如非常出名的*PanDownload*,甚至到现在还能看到合租*百度云盘*，多人共用一个帐号的行为，做为个人来说我觉得这样不好；在限速这个制约下我们的体验已经下降了很多，但还有一个关键因素影响我们的体验，那就是『**网盘容量**』， 一个网盘能存多少内容是它的最基础条件，随着物质生活和需求提升我们个人对网盘空间的需求也就越大，；是所有网盘最终的目的是为了营利，所为他们推出了以营利为目的会员制度，如果有会员会解决限速和一定程度上的空间问题，『**付费**』这是很多同学不想的，但这不是市场接受的。

### Cloudreve作者GitHub	

​	https://github.com/cloudreve/Cloudreve

## 安装步骤

* 服务器一台/Nas
* 安装脚本
* 运行测试

步骤：

​	一：选择一台服务器，这里选择一台Ubuntu环境下的VPS用来做演示，首先要SSH连接至服务器进行操作

``` shell
sudo apt update #更新
wget https://github.com/cloudreve/Cloudreve/releases/download/3.3.2/cloudreve_3.3.2_linux_amd64.tar.gz #下载安装包,依据不同时间下载版本可能不同
ls #查看当前文件的安装包，依据名称解压
tar -zxvf cloudreve_3.3.2_linux_amd64.tar.gz #注意版本
chmod +x ./cloudreve # 赋予执行权限
./cloudreve #启动 Cloudreve

```

​	二：进程守护

``` shell
vim /usr/lib/systemd/system/cloudreve.service

# 将下文 PATH_TO_CLOUDREVE 更换为程序所在目录：
[Unit]
Description=Cloudreve
Documentation=https://docs.cloudreve.org
After=network.target
After=mysqld.service
Wants=network.target

[Service]
WorkingDirectory=/PATH_TO_CLOUDREVE
ExecStart=/PATH_TO_CLOUDREVE/cloudreve
Restart=on-abnormal
RestartSec=5s
KillMode=mixed

StandardOutput=null
StandardError=syslog

[Install]
WantedBy=multi-user.target

```

管理命令：

```shell
# 启动服务
systemctl start cloudreve

# 停止服务
systemctl stop cloudreve

# 重启服务
systemctl restart cloudreve

# 查看状态
systemctl status cloudreve
```

