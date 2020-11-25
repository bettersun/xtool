package main

import (
	"github.com/go-flutter-desktop/go-flutter"

	// go.mod中引入的hello插件URI
	"github.com/bettersun/go-flutter-plugin/hello"

	// go.mod中引入的moist插件URI
	"github.com/bettersun/go-flutter-plugin/moist"

	// go.mod中引入的moist的proxy插件URI
	"github.com/bettersun/go-flutter-plugin/moist/proxy"

	// go.mod中引入的xlsx插件URI
	"github.com/bettersun/go-flutter-plugin/xlsx"
)

var options = []flutter.Option{
	flutter.WindowInitialDimensions(1280, 720),

	// 添加插件
	flutter.AddPlugin(hello.HelloPlugin{}),
	flutter.AddPlugin(moist.MoistPlugin{}),
	flutter.AddPlugin(xlsx.XlsxPlugin{}),
	flutter.AddPlugin(proxy.ProxyPlugin{}),
}
