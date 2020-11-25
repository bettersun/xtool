package proxy

import (
	"github.com/go-flutter-desktop/go-flutter"
	"github.com/go-flutter-desktop/go-flutter/plugin"

	"github.com/bettersun/moist/proxy"
)

// go-flutter插件需要声明包名和函数名
// dart代码中调用时需要指定相应的包名和函数名
const (
	channelName = "bettersun.go-flutter.plugin.moist.proxy"
	run         = "run"
	reload      = "reload"
	close       = "close"
)

/// 声明插件结构体
type ProxyPlugin struct{}

/// 指定为go-flutter插件
var _ flutter.Plugin = &ProxyPlugin{}

/// 初始化插件
func (ProxyPlugin) InitPlugin(messenger plugin.BinaryMessenger) error {
	channel := plugin.NewMethodChannel(messenger, channelName, plugin.StandardMethodCodec{})
	channel.HandleFunc(run, runFunc)
	channel.HandleFunc(reload, reloadFunc)
	channel.HandleFunc(close, closeFunc)
	return nil
}

/// 启动服务
func runFunc(arguments interface{}) (reply interface{}, err error) {

	proxy.RunServer()
	return nil, nil
}

/// 重新加载运行时代理信息
func reloadFunc(arguments interface{}) (reply interface{}, err error) {

	var proxyInfo proxy.ProxyInfo

	var proxyUrls []proxy.ProxyUrl
	var proxyUrl proxy.ProxyUrl

	proxyUrl.Url = "/goodbye"
	proxyUrl.UseProxy = false
	proxyUrl.ResponseJson = "/json/goodbye.json"

	proxyUrls = append(proxyUrls, proxyUrl)

	proxyUrl.Url = "/hello"
	proxyUrl.UseProxy = false
	proxyUrl.ResponseJson = "/json/hello.json"

	proxyUrls = append(proxyUrls, proxyUrl)

	proxyInfo.TargetHost = "http://localhost:8002"
	proxyInfo.BaseUrl = "/bettersun"
	proxyInfo.ProxyUrls = proxyUrls

	proxy.Reload(proxyInfo)
	return nil, nil
}

/// 关闭服务
func closeFunc(arguments interface{}) (reply interface{}, err error) {

	proxy.CloseServer()
	return nil, nil
}
