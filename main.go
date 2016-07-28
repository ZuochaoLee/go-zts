package main

import (
	"github.com/astaxie/beego"
	"go-zts/models"
	_ "go-zts/routers"
)

func main() {
	go models.InitTask()
	beego.Run()

}
