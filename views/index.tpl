<!DOCTYPE html>

<html>
<head>
  <title>任务调度监控系统</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="stylesheet" type="text/css" href="/static/css/style.css">
</head>

<body>

  <header>
    <div class="hed"><img class="hed" src="/static/img/logo.png"></div>
    <div class="had">任务调度监控系统</div>
  </header>
  <section>
    <ul>
      <li id="sy1" class="action" onclick="change(1)">首页</li>
      <li id="now1" onclick="change(2)">任务列表</li>
      <li id="new1" onclick="change(3)">添加任务</li>
      <li id="conf1" onclick="change(4)">配置修改</li>
    </ul>
    <!--iframe src="http://www.baidu.com"></iframe-->
    <!--首页-->
    <div id="sy" class="sec" style="display:block;">
      <div class="t2">欢迎使用任务调度监控系统</div>
      <div class="t3">使&nbsp用&nbsp说&nbsp明</div>
      <div class="t4">
        
      </div>
    </div>
    <!-----------进行中的-------------------------------------->
    <div id="now" class="sec" style="display:none;">
      <div class="t2">任务列表</div>
      <div class="table">
        <ul>
          <li class="action">任务名称</li>
          {{range .Task}}
            <li>{{.Name}}</li>
          {{end}}
        </ul>
        <ul>
          <li class="action">任务状态</li>
          {{range .Task}}
            {{if eq .Status 1}}
              <li class="on">进行中</li>
            {{else}}
              <li class="off">停止</li>
            {{end}}

          {{end}}
        </ul>
        <ul>
          <li class="action">任务操作</li>
          {{range .Task}}
            {{if eq .Status 1}}
              <li><button class="off" onclick="stopt({{.Name}})">停止任务</button></li>
            {{else}}
              <li><button class="on" onclick="startt({{.Name}})">开启任务</button></li>
            {{end}}
          {{end}}
        </ul>
        <ul>
          <li class="action">任务详情</li>
          {{range .Task}}
            <li><a onclick="digJump1({{.Name}},{{.Script}},{{.Time}},{{.Command}},{{.Des}})">点击详情</a></li>
          {{end}}
        </ul>
      </div>
    </div>
    <!---------添加任务---------------------------------------------->
    <div id="new" class="sec" style="display:none;">
      <div class="t2">添加任务</div>
      <div class="from">
        <p>任务名称：<input id="n1" type="text" name="name"/></p>
        <p>执行时间：<input id="t1" type="text" name="time"/></p>
        <p>执行命令：
          <select id="s1" name="script">
            {{range .Lang}}
              <option value={{.Name}}>{{.Name}}</option>
            {{end}}
          </select>
        </p>
        <p>脚本名称：<input id="o1" type="text" name="order"/><font color="#ff0000">请填写含路径脚本名称</font></p>
        <p><span>任务描述：</span><textarea id="d1"></textarea></p>
        <div><input type="button" name="submit" value="提交" onclick="submitTask(1)" /></div>
      </div>

    </div>
    <!---------配置修改---------------------------------------------->
    <div id="conf" class="sec" style="display:none;">
      <div class="t2">配置修改</div>
      <div class="table2">
        <ul>
          <li class="action">脚本名称</li>
          {{range .Lang}}
            <li>{{.Name}}</li>
          {{end}}
        </ul>
        <ul>
          <li class="action">脚本命令</li>
          {{range .Lang}}
            <li>{{.Script}}</li>
          {{end}}
        </ul>
        <ul>
          <li class="action">修改详情</li>
          {{range .Lang}}
            <li><a onclick="digJump2(2,{{.Name}},{{.Script}})">点击修改</a></li>
          {{end}}
        </ul>
      </div>
      <button class="add" onclick="digJump2(1,'','')">添加配置</button>
    </div>
  </section>
  <footer>
    
  </footer>
  <!-------------对话框-------------------------->
  <dialog id="dig1" open class="dig">
    <button onclick="digClose()">X</button>
    <div id="t1" class="t2"></div>
    <div class="from">
        <p>任务名称：<input id="n" type="text" name="name"/></p>
        <p>执行时间：<input id="t" type="text" name="time"/></p>
        <p>执行命令：
          <select id="s" name="script">
            {{range .Lang}}
              <option value="{{.Name}}">{{.Name}}</option>
            {{end}}
          </select>
        </p>
        <p>脚本名称：<input id="o" type="text" name="order"/><font color="#ff0000">请填写含路径脚本名称</font></p>
        <p><span>任务描述：</span><textarea id="d"></textarea></p>
        <div><input type="button" name="submit" value="提交" onclick="submitTask(2)" /></div>
    </div>
  </dialog>

  <dialog id="dig2" open class="dig2">
    <button onclick="digClose()">X</button>
    <div id="t2" class="t2"></div>
    <div class="from">
        <p>脚本名称：<input id="n11" type="text" name="scriptName"/></p>
        <p>脚本命令：<input id="n2" type="text" name="scriptOrder"/></p>
        <div><input type="button" name="submit" value="提交" onclick="submitConf()" /></div>
    </div>
  </dialog>

  <script type="text/javascript" src="http://cdn.bootcss.com/jquery/3.1.0/jquery.min.js"></script>
  <script type="text/javascript">
    function change(flag){
      if(flag==1){
        $("#sy").show();
        $("#now").hide();
        $("#new").hide();
        $("#conf").hide();
        $("#sy1").attr("class","action");
        $("#now1").attr("class","");
        $("#new1").attr("class","");
        $("#conf1").attr("class","");
      }else if(flag==2){
        $("#sy").hide();
        $("#now").show();
        $("#new").hide();
        $("#conf").hide();
        $("#sy1").attr("class","");
        $("#now1").attr("class","action");
        $("#new1").attr("class","");
        $("#conf1").attr("class","");
      }else if(flag==3){
        $("#sy").hide();
        $("#now").hide();
        $("#new").show();
        $("#conf").hide();
        $("#sy1").attr("class","");
        $("#now1").attr("class","");
        $("#new1").attr("class","action");
        $("#conf1").attr("class","");
      }else{
        $("#sy").hide();
        $("#now").hide();
        $("#new").hide();
        $("#conf").show();
        $("#sy1").attr("class","");
        $("#now1").attr("class","");
        $("#new1").attr("class","");
        $("#conf1").attr("class","action");
      }
    }
    function digJump1(n,s,t,o,d){
      $("#dig2").hide();
      $("#dig1").show();
      $("#t1").text(n+"任务详情信息");
      $("#n").attr("value",n);
      $("#o").attr("value",o);
      $("#t").attr("value",t);
      $("#d").text(d);
      var ops=$("#s")[0].options;
      for (k in ops){
        if(ops[k].label==s)
          ops[k].selected=true;
      }
    }
    function digJump2(f,n,o){
      $("#dig1").hide();
      $("#dig2").show();
      if(f==1){
        $("#t2").text("添加配置");
      }else{
        $("#t2").text("修改"+n+"脚本信息");
      }
      $("#n11").attr("value",n);
      $("#n2").attr("value",o);
    }
    function digClose(){
      $("#dig1").hide();
      $("#dig2").hide();
    }
    function submitTask(f){
      if(f==1){
        var n=$("#n1")[0].value;
        var o=$("#o1")[0].value;
        var t=$("#t1")[0].value;
        var d=$("#d1")[0].value;
        var s=$("#s1").find("option:selected").text();
        alert(n+o+t+d+s);
        $.get('/addTask',{"n":n,"o":o,"t":t,"s":s,"d":d},function(data){
          if(data.code==1){
            alert("操作成功！！");
          }else{
            alert("操作失败！！");
          }
          location.reload() 
        });
      }else{
        var n=$("#n")[0].value;
        var o=$("#o")[0].value;
        var t=$("#t")[0].value;
        var d=$("#d")[0].value;
        var s=$("#s").find("option:selected").text();
        $.get('/updateTask',{"n":n,"o":o,"t":t,"s":s,"d":d},function(data){
          $("#dig1").hide();
          if(data.code==1){
            alert("操作成功！！");
          }else{
            alert("操作失败！！");
          }
          location.reload() 
        });
      }
    }
    function submitConf(){
      var n=$("#n11")[0].value;
      var o=$("#n2")[0].value;
      $.get('/updateConf',{"n":n,"o":o},function(data){
        $("#dig2").hide();
        if(data.code==1){
          alert("操作成功！！");
        }else{
          alert("操作失败！！");
        }
        location.reload() 
      });
    }
    function stopt(n){
      $.get('/stop',{"name":n},function(data){
        if(data.code==1){
          alert("操作成功！！");
        }else{
          alert("操作失败！！");
        }
        location.reload() 
      });
    }
    function startt(n){
      $.get('/start',{"name":n},function(data){
        if(data.code==1){
          alert("操作成功！！");
        }else{
          alert("操作失败！！");
        }
        location.reload() 
      });
    }
  </script>
</body>
</html>
