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
	search      = "search"
)

/// 声明插件结构体
type MoistPlugin struct{}

/// 指定为go-flutter插件
var _ flutter.Plugin = &MoistPlugin{}

/// 初始化插件
func (MoistPlugin) InitPlugin(messenger plugin.BinaryMessenger) error {
	channel := plugin.NewMethodChannel(messenger, channelName, plugin.StandardMethodCodec{})
	channel.HandleFunc(explorer, explorerFunc)
	channel.HandleFunc(search, searchFunc)
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
	m, err := moist.StructToIfKeyMap(result)
	if err != nil {
		log.Println(err)
	}

	// log.Println(m)
	return m, nil
}

// 搜索的逻辑处理函数
func searchFunc(arguments interface{}) (reply interface{}, err error) {

	// 检查参数
	argsMap := arguments.(map[interface{}]interface{})

	// 目标根目录
	rootPath, ok := argsMap["rootPath"].([]interface{})
	if !ok {
		log.Println("ERROR: [rootPath]")
	}
	// 搜索子目录
	searchSubPath, ok := argsMap["searchSubPath"].(bool)
	if !ok {
		log.Println("ERROR: [searchSubPath]")
	}
	// 区分大小写
	matchCase, ok := argsMap["matchCase"].(bool)
	if !ok {
		log.Println("ERROR: [matchCase]")
	}
	// 目标文件名关键字
	fileNamePart, ok := argsMap["fileNamePart"].([]interface{})
	if !ok {
		log.Println("ERROR: [fileNamePart]")
	}
	// 目标文件类型
	fileType, ok := argsMap["fileType"].([]interface{})
	if !ok {
		log.Println("ERROR: [fileType]")
	}
	// 搜索模式
	pattern, ok := argsMap["pattern"].(string)
	if !ok {
		log.Println("ERROR: [pattern]")
	}
	// 忽略目录
	ignorePath, ok := argsMap["ignorePath"].([]interface{})
	if !ok {
		log.Println("ERROR: [ignorePath]")
	}
	// 忽略文件名关键字
	ignoreFileNamePart, ok := argsMap["ignoreFileNamePart"].([]interface{})
	if !ok {
		log.Println("ERROR: [ignoreFileNamePart]")
	}
	// 忽略文件类型
	ignoreType, ok := argsMap["ignoreType"].([]interface{})
	if !ok {
		log.Println("ERROR: [ignoreType]")
	}
	// 忽略模式
	ignorePattern, ok := argsMap["ignorePattern"].(string)
	if !ok {
		log.Println("ERROR: [ignorePattern]")
	}
	// 是否显示文件详细信息标志
	showDetail, ok := argsMap["showDetail"].(bool)
	if !ok {
		log.Println("ERROR: [showDetail]")
	}

	// 组合参数
	// 目标根目录
	var sRootPath []string
	for _, item := range rootPath {
		sRootPath = append(sRootPath, item.(string))
	}
	// 目标文件名关键字
	var sFileNamePart []string
	for _, item := range fileNamePart {
		sFileNamePart = append(sFileNamePart, item.(string))
	}
	// 目标文件类型
	var sFileType []string
	for _, item := range fileType {
		sFileType = append(sFileType, item.(string))
	}
	// 忽略目录
	var sIgnorePath []string
	for _, item := range ignorePath {
		sIgnorePath = append(sIgnorePath, item.(string))
	}
	// 忽略文件名关键字
	var sIgnoreFileNamePart []string
	for _, item := range ignoreFileNamePart {
		sIgnoreFileNamePart = append(sIgnoreFileNamePart, item.(string))
	}
	// 忽略文件类型
	var sIgnoreType []string
	for _, item := range ignoreType {
		sIgnoreType = append(sIgnoreType, item.(string))
	}

	// 搜索选项
	var option moist.SearchOption
	option.RootPath = sRootPath                     // 目标根目录
	option.SearchSubPath = searchSubPath            // 搜索子目录
	option.MatchCase = matchCase                    // 区分大小写
	option.FileNamePart = sFileNamePart             // 目标文件名关键字
	option.FileType = sFileType                     // 目标文件类型
	option.Pattern = pattern                        // 搜索模式
	option.IgnorePath = sIgnorePath                 // 忽略目录（目录名完全相同，设置此项有助于提高搜索效率，常用忽略目录: .git, .svn）
	option.IgnoreFileNamePart = sIgnoreFileNamePart // 忽略文件名关键字
	option.IgnoreType = sIgnoreType                 // 忽略文件类型
	option.IgnorePattern = ignorePattern            // 忽略模式
	option.ShowDetail = showDetail                  // 显示文件详细信息
	// log.Println(option)

	// 搜索
	var result = moist.Search(option)
	// log.Println(result)

	// 转换成Map(Key类型为interface{})
	m, err := moist.StructToIfKeyMap(result)
	if err != nil {
		log.Println(err)
	}
	// log.Println(m)

	return m, nil
}
