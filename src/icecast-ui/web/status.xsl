<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
<xsl:output method="xml" media-type="text/html" indent="yes" encoding="UTF-8"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
    doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" />

<xsl:template match = "/icestats" >
<html>
  <head>
    <meta charset="utf-8"></meta>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
    <meta name="viewport" content="width=device-width, initial-scale=1"></meta>
    <title>Radio.DLine-Media.com</title>
    <link href="css/bootstrap.min.css" rel="stylesheet"></link>
    <link rel="stylesheet" href="css/style.css"></link>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"></link>
    <link rel="stylesheet" href="css/animate.css"></link>
    <link rel="stylesheet" href="css/player.css"></link>
    <script src="js/wow.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet"></link>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <header>
        <div class="container">
            <div class="row">
          <div class="col-xs-1 visible-xs text-center">
            <div class="nav dropdown">
              <a data-toggle="dropdown" href="#"><i class="fa fa-bars" aria-hidden="true"></i></a>
              <ul class="dropdown-menu  text-center" role="menu" aria-labelledby="dLabel">
                <li><a href="/admin/">Администрирование</a></li>
                <li><a href="/">Статус сервера</a></li>
                <li><a href="https://bill.dline-media.com">Биллинг</a></li>
                <li><a href="https://www.dline-media.com">О нас</a></li>
              </ul>
            </div>
          </div>
                <div class="col-md-5 col-xs-10 col-sm-5 wow fadeInLeft">
                    <img src="img/logo.png" alt="" class="img-responsive"></img>
                    <h2>Radio.DLine Media</h2>
                    <p>Информация о состоянии серверов</p>
                </div>
                <div class="col-md-7 hidden-xs col-sm-7 wow fadeInRight">
                    <div class="nav">
                        <ul class="list-inline">
                 <li><a href="/admin/">Администрирование</a></li>
                <li><a href="/">Статус сервера</a></li>
                <li><a href="https://bill.dline-media.com">Биллинг</a></li>
                <li><a href="https://www.dline-media.com">О нас</a></li>
                    </ul>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <section>
        <div class="container">
            <div class="row main">
                <div class="section_header text-center wow fadeInUp" data-wow-delay=".3s">
                    <h1>Мониторинг радио сервера</h1>
                    <p class="border-bottom">На этой странице отображается текущая статистика загрузки радио сервера компании DLine Media. Доступна такая информация, как: название радиостанции, описание потока, время запуска вещания, текущий битрейт, информация о текущем и максимальном количестве слушателей, информация о звучащем треке и др. Кроме того есть возможность послушать вещание радиостанции из браузера, либо скопировать ссылку на поток. Обратите внимание: это техническая страница и предназначена только для мониторинга состояния сервера!</p>
                </div>
        
           

<xsl:for-each select="source">
    <div class="info_block  center-block">
                    <div class="row block_header">
                        <div class="col-md-8 col-xs-6">
                            <h2>Точка монтирования <xsl:value-of select="@mount" /></h2>
                        </div>
              <div class="col-md-4 col-xs-6 text-right">
               <a href="{@mount}">  <i class="headphones">stream</i></a>
               <a href="{@mount}.m3u"> <i class="file">m3u</i></a>
              </div>
                    </div>
                    <div class="row main_inf">
                        <div class="col-md-6 col-sm-6">
                            <p class="name-rad">Название радиостанции: <xsl:value-of select="server_name" /></p>
                            <p class="stream">Описание потока: <xsl:value-of select="server_description" /></p>
                            <p class="type">Тип потока: <xsl:value-of select="server_type" /></p>
                            <p class="time">Вещание запущено: <xsl:value-of select="stream_start" /></p>
                            <p class="bit">Битрейт: <xsl:value-of select="bitrate" /></p>
                        </div>
                        <div class="col-md-5 col-sm-6">
                            <p class="listeners">Сейчас слушают: <xsl:value-of select="listeners" /></p>
                            <p class="max">Максимум слушателей: <xsl:value-of select="listener_peak" /></p>
                            <p class="genre">Жанр: <xsl:value-of select="genre" /></p>
                <p class="genre">Текущий трек: <xsl:if test="artist"><xsl:value-of select="artist" /> - </xsl:if><xsl:value-of select="title" /></p>
                            <p class="site">Адрес радиостанции: <a target="_blank" href="{server_url}"><xsl:value-of select="server_url" /></a></p>
                        </div>
                    </div>
                    <div class="row player">
              <div class="play center-block">
                <div class="player_wrapper">
                  <marquee behavior="" direction=""><xsl:if test="artist"><xsl:value-of select="artist" /> - </xsl:if><xsl:value-of select="title" /></marquee>
                  <audio id="audio-player-{position()}" src="{@mount}" type="audio/mp3" controls="controls"></audio> 
                  <div class="border"></div>  
                </div>
              </div>      
                    </div>
                </div>


</xsl:for-each>

 
                <div class="row discript center-block">
                    <div class="section_header text-center wow fadeInDown">
                        <h1>Дополнительная информация</h1>
                        <p>В случае возникновения внештатных ситуаций, Вы можете обратиться в администратору сервера. <br/>Для этого авторизуйтесь в биллинг-системе и оставьте запрос по Вашей услуге. <br/>Все станции с этой страницы попадают в общий каталог радиостанций, <br/>который доступен для прослушивание через мобильные приложения под iOS и Android устройства.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer>
        <div class="container">
            <div class="row wow fadeIn">
                <div class="col-md-5">
                    <p>Сделано в <a href="https://www.dline-media.com" target="_blank"> DLine Media</a> в 2017 году.</p>
                </div>
                <div class="col-md-2 soc">
                    <a href="https://vk.com/dline.media" target="_blank">Мы ВКонтакте</a>
                </div>
                <div class="col-md-5 text-right">
                    <div class="nav">
                        <ul class="list-inline">
                            <li>Остались вопросы? Пишите на evgen@dline-media.com</li>
                        
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
      new WOW().init();
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="js/mediaelement-and-player.min.js"></script>
  

    <script>
    $(document).ready(function() {
 

       <xsl:for-each select="source">
     $('#audio-player-<xsl:value-of select="position()" />').mediaelementplayer({
        alwaysShowControls: true,
        features: ['playpause','volume'],
        audioVolume: 'horizontal',
        audioWidth: 100+('%'),
        audioHeight: 40
      });
  </xsl:for-each>
  });
  </script>

  

  </body>
</html>

</xsl:template>
</xsl:stylesheet>
