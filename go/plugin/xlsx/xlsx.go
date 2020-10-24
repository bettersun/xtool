package xlsx

import (
	"log"

	"github.com/go-flutter-desktop/go-flutter"
	"github.com/go-flutter-desktop/go-flutter/plugin"

	"github.com/360EntSecGroup-Skylar/excelize"
)

// go-flutter插件需要声明包名和函数名
// dart代码中调用时需要指定相应的包名和函数名
const (
	channelName = "bettersun.go-flutter.plugin.xlsx"
	readCell    = "readCell"
)

/// 声明插件结构体
type XlsxPlugin struct{}

/// 指定为go-flutter插件
var _ flutter.Plugin = &XlsxPlugin{}

/// 初始化插件
func (XlsxPlugin) InitPlugin(messenger plugin.BinaryMessenger) error {
	channel := plugin.NewMethodChannel(messenger, channelName, plugin.StandardMethodCodec{})
	channel.HandleFunc(readCell, readCellFunc)
	return nil
}

// 具体的逻辑处理函数，有参数传递
func readCellFunc(arguments interface{}) (reply interface{}, err error) {

	// 检查参数
	argsMap := arguments.(map[interface{}]interface{})
	// log.Println(argsMap)

	file, ok := argsMap["file"].(interface{})
	if !ok {
		log.Println("ERROR: The argument is not a [file]")
	}

	sheetName, ok := argsMap["sheetName"].(interface{})
	if !ok {
		log.Println("ERROR: The argument is not a [sheetName]")
	}

	axis, ok := argsMap["axis"].(interface{})
	if !ok {
		log.Println("ERROR: The argument is not a [axis]")
	}

	// log.Println(file)
	// log.Println(sheetName)
	// log.Println(axis)

	pFile := file.(string)
	pSheetName := sheetName.(string)
	pAxis := axis.(string)

	log.Println(pFile)
	log.Println(pSheetName)
	log.Println(pAxis)

	result, err := read(pFile, pSheetName, pAxis)
	if err != nil {
		log.Println(err)
		result = ""
	}

	return result, nil
}

func read(file string, sheetName string, axis string) (string, error) {

	tmp := ""
	xlsx, err := excelize.OpenFile("/Users/sunjiashu/Documents/Develop/github.com/bettersun/xtool/go_plugin/xlsx/hello.xlsx")
	if err != nil {
		log.Println(err)
		return tmp, nil
	}

	//
	tmp = xlsx.GetCellValue("Sheet1", "A1")
	log.Println(tmp)
	return tmp, nil
}
