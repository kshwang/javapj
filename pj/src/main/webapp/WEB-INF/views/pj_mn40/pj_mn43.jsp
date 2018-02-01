<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>eNno Bootstrap Template</title>

    <!-- Bootstrap -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/animate.css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/css/font-awesome.css">
    <link rel="stylesheet" href="/resources/css/jquery.bxslider.css">
    <link href="/resources/css/overwrite.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/resources/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/set1.css" />
    <link href="/resources/css/style.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    
      <%@ include file="../header.jsp"%>
    
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="portfolios">
                    <div class="text-center">
                        <h2>Portfolio</h2>
                        <p>Lorem ipsum dolor sit amet consectetur adipiscing elit Cras suscipit arcu<br>
                        vestibulum volutpat libero sollicitudin vitae Curabitur ac aliquam <br>
                        </p>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
    </div>
    
    <div class="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <a href="/resources/img/26.jpg" class="flipLightBox">
                        <img src="/resources/img/26.jpg" width="230" height="230" alt="Image 1" />
                        <span><b>LightBox Group 1, Image 1</b> Text to accompany first lightbox image</span>
                    </a>

                    <a href="/resources/img/27.jpg" class="flipLightBox">
                        <img src="/resources/img/27.jpg" width="230" height="230" alt="Image 2" />
                        <span><b>LightBox Group 1, Image 2</b><br />Text to accompany 2nd lightbox image</span>
                    </a>

                    <a href="/resources/img/28.jpg" class="flipLightBox">
                        <img src="/resources/img/28.jpg" width="230" height="230" alt="Image 3" />
                        <span><b>LightBox Group 1, Three</b> Text to accompany the third lightbox image</span>
                    </a>

                    <a href="img/29.jpg" class="flipLightBox">
                        <img src="/resources/img/29.jpg" width="230" height="230" alt="Image 4" />
                        <span><b>The Group 1 Final LightBox</b> Text to accompany the last of the lighboxes</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <div class="portfolio-2">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <a href="/resources/img/30.jpg" class="flipLightBox">
                        <img src="/resources/img/30.jpg" width="250" height="250" alt="Image 1" />
                        <span><b>LightBox Group 1, Image 1</b> Text to accompany first lightbox image</span>
                    </a>

                    <a href="/resources/img/31.jpg" class="flipLightBox">
                        <img src="/resources/img/31.jpg" width="250" height="250" alt="Image 2" />
                        <span><b>LightBox Group 1, Image 2</b><br />Text to accompany 2nd lightbox image</span>
                    </a>

                    <a href="/resources/img/32.jpg" class="flipLightBox">
                        <img src="/resources/img/32.jpg" width="250" height="250" alt="Image 3" />
                        <span><b>LightBox Group 1, Three</b> Text to accompany the third lightbox image</span>
                    </a>

                    <a href="/resources/img/33.jpg" class="flipLightBox">
                        <img src="/resources/img/33.jpg" width="250" height="250" alt="Image 4" />
                        <span><b>The Group 1 Final LightBox</b> Text to accompany the last of the lighboxes</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    
      <%@ include file="../footer.jsp"%>
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/resources/js/jquery-2.1.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/wow.min.js"></script>
    <script src="/resources/js/jquery.easing.1.3.js"></script>
    <script src="/resources/js/jquery.isotope.min.js"></script>
    <script src="/resources/js/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="/resources/js/fliplightbox.min.js"></script>
    <script src="/resources/js/functions.js"></script>
    <script type="text/javascript">$('.portfolio').flipLightBox()</script>
  </body>
</html>