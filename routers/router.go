package routers

import (
	"github.com/astaxie/beego"
	"go-zts/controllers"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	beego.Router("/t", &controllers.TestController{})
	beego.Router("/addTask", &controllers.AddTController{})
	beego.Router("/updateTask", &controllers.UpdateTController{})
	beego.Router("/updateConf", &controllers.AddCController{})
	beego.Router("/stop", &controllers.StopController{})
	beego.Router("/start", &controllers.StartController{})
}
