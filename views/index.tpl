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
      <li id="new1" onclick="change(4)">配置修改</li>
    </ul>
    <!--iframe src="http://www.baidu.com"></iframe-->
    <!--首页-->
    <div id="sy" class="sec" style="display:block;">
      <div class="t2">欢迎使用任务调度监控系统</div>
      <div class="t3">使&nbsp用&nbsp说&nbsp明</div>
      <div class="t4">
        
      </div>
    </div>
    <!--进行中的-->
    <div id="now" class="sec" style="display:none;">
      <div class="t2">任务列表</div>
      <div class="table">
        <ul>
          <li class="action">任务名称</li>
          <li>ETL</li>
          <li>北京链家二手房</li>
          <li>上海小区</li>
        </ul>
        <ul>
          <li class="action">任务状态</li>
          <li class="on">进行中</li>
          <li class="off">停止</li>
          <li class="off">停止</li>
        </ul>
        <ul>
          <li class="action">执行时间</li>
          <li>0 5 * * * *</li>
          <li>0 5 * * * *</li>
          <li>0 5 * * * *</li>
        </ul>
        <ul>
          <li class="action">任务操作</li>
          <li><button class="on">开启任务</button></li>
          <li><button class="on">开启任务</button></li>
          <li><button class="off">停止任务</button></li>
        </ul>
      </div>
    </div>
    <!--添加任务-->
    <div id="new" class="sec" style="display:none;">
      <div class="t2">添加任务</div>
    </div>
  </section>
  <footer>
    
  </footer>
  <script type="text/javascript" src="http://cdn.bootcss.com/jquery/3.1.0/jquery.min.js"></script>
  <script type="text/javascript">
    function change(flag){
      if(flag==1){
        $("#sy").show();
        $("#now").hide();
        $("#new").hide();
        $("#sy1").attr("class","action");
        $("#now1").attr("class","");
        $("#new1").attr("class","");
      }else if(flag==2){
        $("#sy").hide();
        $("#now").show();
        $("#new").hide();
        $("#sy1").attr("class","");
        $("#now1").attr("class","action");
        $("#new1").attr("class","");
      }else{
        $("#sy").hide();
        $("#now").hide();
        $("#new").show();
        $("#sy1").attr("class","");
        $("#now1").attr("class","");
        $("#new1").attr("class","action");
      }
    }
  </script>
</body>
</html>
