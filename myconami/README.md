# CoNami = Container + JS + H2 -> 微信小程序后端

## 动机

微信小程序后端开发需要实现一个Web服务器，并配置相应数据库，上手门槛较高。这个项目的目的是让开发者在半天只内就能最小化的运行自己的微信小程序后端，以最低的时间成本完成产品业务逻辑，降低试错成本。

## 小程序技术栈

| 模块       | 简介                                       | 运行                              | CoNami工作量   | 一般方案                 | Demo/源代码                                 |
| -------- | ---------------------------------------- | ------------------------------- | ----------- | -------------------- | ---------------------------------------- |
| 前端页面     | web应用，由js, wxml(其实就是html被腾讯换了个名字), wxss(again就是css被腾讯换了个名字)组成 | 微信小程序内的类浏览器环境                   | 花半小时左右注册并实名 | =CoNami              | https://gitee.com/yingpo/weixin-xiaochengxu-vote/tree/master/app |
| 后端Web服务器 | 符合微信API要求的，带https的标准Web服务                | 容器化运行                           | <1小时        | 适配微信API，>5人天         | https://gitee.com/yingpo/weixin-xiaochengxu-vote/tree/master/nami |
| 后端数据库    | 持久化数据保存                                  | 存在公有云的云硬盘上，达到一般的数据库可靠性，不受虚机死亡影响 | 内嵌，0        | 单独运行配置>1人天，需要额外购买服务器 | 无                                        |

由上述的表格可以看出，CoNami提供的方案比腾讯云目前自身的方案的时间成本还要低很多，并且由于使用了容器，后端可以达到较高的DevOps能力，在5分钟之内完成一次业务逻辑迭代上线操作。

## 基本使用-[《CoNami小程序Demo端到端开发指南》](doc/nami-hello.md)

* 本代码库为框架的基本镜像构建用库，一般用户可能用不上，但也欢迎大家修改使用

构建: docker build -t nami .
运行：docker run -d -p 8080:8080 -p 8090:8090 nami bash /nami/start.sh

## 致谢 

基于
* [nami项目](https://github.com/wodenwang/nami)
* [H2数据库](http://h2database.com/html/main.html)
* Docker容器