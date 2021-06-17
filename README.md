# MITMProxy 辅助机器人

使用mitmproxy作为中间抓包层。

增加DSL书写本地Restful API Mapper

支持自动重载。


# 使用说明


## 一、安装依赖

0. 确认系统中是否有

Python3+

Ruby2.7+

1. 确认安装 mitmproxy

mac 

`brew install mitmproxy`

`pip3 install mitproxy`


2. 安装Ruby依赖

> 如果没有安装 bundle 安装  `gem install bundler`

安装依赖

`bundle install`

## 二、开始使用


1. 书写本地接口

约定在 `local_proxy` 文件夹中 使用 `xxx.api.rb` 的模式新建文件。


文件中接口DSL形如

```ruby

get '/keyword/of/path' do

{
  "result": {
    "errno": "OK",
    "errmsg": "成功"
  },
  "data": {
    "details": [
      {
        "id": 123,
        "nick": "Hello",
      }
    ]
  }
}
  
end


post '/keyword/of/path' do

{
  "result": {
    "errno": "OK",
    "errmsg": "成功"
  },
  "data": {
    "details": [
      {
        "id": 123,
        "nick": "Hello",
      }
    ]
  }
}
  
end

```

支持方法有 

```
:get,:post, :patch, :put, :delete, :head, :options
```

2. 可以使用的命令

执行 `rake` 可以查看提供的工作列表


3. 启动编译DSL的 watch服务

`rake run` 或者 `rake r`

当你不断地书写 接口的DSL，服务将回归自动转换为中间JSON文件，在 `./build/mock_api.json` 可查看


4. 启动 mitmproxy 服务

命令行界面

`rake mitmproxy` 或者 `rake m`

如果想要启动 web ui

`rake mitmweb` 或者 `rake mw`


mitmproxy 会自动检查，mock_api.json ，当请求路径 包含 配置路径的时，方法匹配会进入捕捉阶段，返回配置的返回。


5. 两个服务启动，发生联动

启动两个server。可以实现 `书写DSL->热更新翻译JSON-> MITM中间层 本地Mapper热更新` 从而实现热更新 本地Mapper数据的server。

方便测试测试接口。