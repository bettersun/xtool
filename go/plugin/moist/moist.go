package moist

import (
	"log"

	"github.com/go-flutter-desktop/go-flutter"
	"github.com/go-flutter-desktop/go-flutter/plugin"

	"github.com/bettersun/moist"
)

// go-flutter插件需要声明包名和函数名
// dart代码中调用时需要指定相应的包名和函数名
const (
	channelName = "bettersun.go-flutter.plugin.moist"
	explorer    = "explorer"
)

/// 声明插件结构体
type MoistPlugin struct{}

/// 指定为go-flutter插件
var _ flutter.Plugin = &MoistPlugin{}

/// 初始化插件
func (MoistPlugin) InitPlugin(messenger plugin.BinaryMessenger) error {
	channel := plugin.NewMethodChannel(messenger, channelName, plugin.StandardMethodCodec{})
	channel.HandleFunc(explorer, explorerFunc)
	return nil
}

// 具体的逻辑处理函数，有参数传递
func explorerFunc(arguments interface{}) (reply interface{}, err error) {

	// 检查参数
	argsMap := arguments.(map[interface{}]interface{})
	// log.Println(argsMap)

	rootPath, ok := argsMap["rootPath"].([]interface{})
	if !ok {
		log.Println("ERROR: The argument is not a ExplorerOption.[rootPath]")
	}

	includeSubPath, ok := argsMap["includeSubPath"].(bool)
	if !ok {
		log.Println("ERROR: The argument is not a ExplorerOption.[includeSubPath]")
	}

	ignorePath, ok := argsMap["ignorePath"].([]interface{})
	if !ok {
		log.Println("ERROR: The argument is not a ExplorerOption.[ignorePath]")
	}

	ignoreFile, ok := argsMap["ignoreFile"].([]interface{})
	if !ok {
		log.Println("ERROR: The argument is not a ExplorerOption.[ignoreFile]")
	}

	// 组合参数
	var p []string
	for _, path := range rootPath {
		p = append(p, path.(string))
	}

	var igPath []string
	for _, val := range ignorePath {
		igPath = append(igPath, val.(string))
	}

	var igFile []string
	for _, val := range ignoreFile {
		igFile = append(igFile, val.(string))
	}

	// 搜索选项
	var option moist.ExplorerOption
	option.RootPath = p
	option.IncludeSubPath = includeSubPath
	option.IgnorePath = igPath
	option.IgnoreFile = igFile
	// log.Println(option)

	var result = moist.Explorer(option)
	// log.Println(result)

	// 转换成Map(Key类型为interface{})
	m, err := moist.StrctToIfKeyMap(result)
	if err != nil {
		log.Println(err)
	}

	// log.Println(m)
	return m, nil
}
