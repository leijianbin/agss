<?php if (isset($_SERVER['HTTP_USER_AGENT']) && !strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE 6')) echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" xml:lang="<?php echo $lang; ?>">
	<head>
		<title><?php echo $title; ?></title>
		<base href="<?php echo $base; ?>" />
		<?php if ($description) { ?>
			<meta name="description" content="<?php echo $description; ?>" />
		<?php } ?>
		<?php if ($keywords) { ?>
			<meta name="keywords" content="<?php echo $keywords; ?>" />
		<?php } ?>
		<?php if ($icon) { ?>
			<link href="<?php echo $icon; ?>" rel="icon" />
		<?php } ?>
		<?php foreach ($links as $link) { ?>
			<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
		<?php } ?>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" type="text/css" href="catalog/view/theme/agss/stylesheet/stylesheet.css" />
		<link rel="stylesheet" type="text/css" href="catalog/view/theme/agss/stylesheet/style.css" />
		<link rel="stylesheet" type="text/css" href="catalog/view/theme/agss/stylesheet/general.css" />
		<?php foreach ($styles as $style) { ?>
			<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
		<?php } ?>
		<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
		<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
		<script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
		<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>
		<script type="text/javascript" src="catalog/view/javascript/jTemplate.js"></script>
		<script type="text/javascript" src="catalog/view/javascript/cal.js"></script>
		<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />
		<script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
		<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
		<?php foreach ($scripts as $script) { ?>
			<script type="text/javascript" src="<?php echo $script; ?>"></script>
		<?php } ?>
		<!--[if IE 7]>
		<link rel="stylesheet" type="text/css" href="catalog/view/theme/agss/stylesheet/ie7.css" />
		<![endif]-->
		<!--[if lt IE 7]>
		<link rel="stylesheet" type="text/css" href="catalog/view/theme/agss/stylesheet/ie6.css" />
		<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
		<script type="text/javascript">
		DD_belatedPNG.fix('#logo img');
		</script>
		<![endif]-->
		<?php echo $google_analytics; ?>
    <!–[if lt IE 9]>
    <script src=”http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js”></script>
    <![endif]–>
		<script language="JavaScript">
			navHover = function() {
				var lis = document.getElementById("menu").getElementsByTagName("li");
				for (var i = 0; i < lis.length; i++) {
					lis[i].onmouseover = function() {
						this.className += " iehover";
					}
					lis[i].onmouseout = function() {
						this.className = this.className.replace(new RegExp(" iehover\\b"), "");
					}
				}
			}
			if (window.attachEvent)
				window.attachEvent("onload", navHover);
		</script>
	</head>
	<body>
			<div id="wideheader">
				<div class="header wrapper">
					<div id="top">
						<div id="topleft">
							<p>AGSS旗下网站  <a href="<?php echo $top_logo_side_link[0]['titlelink']?>"><?php echo $top_logo_side_link[0]['title']?></a></p>
							<div class="logo"><a href="<?php echo $home; ?>"><img src="catalog/view/theme/agss/image/logo.png" /></a></div>
            </div>
            <div class="cart">
				<a href="<?php echo $shopping_cart;?>"><?php echo $text_shopping_cart; ?></a>
						</div>
            <div id="topright">
							<div id="toplogin">

    <?php if (!$logged) { ?>
    <?php echo $text_welcome; ?>
    <?php } else { ?>
    <?php echo $text_logged; ?>
    <?php } ?>
            </div>
					</div>
					</div>
					<ul id="submenu">
						<li class="special<?php if(isset($_GET['route']) && $_GET['route'] == 'common/home') echo ' current'?>"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>
						<li class="<?php if(isset($_GET['route']) && $_GET['route'] == 'purchase/purchase') echo 'current';?>"><a href="index.php?route=purchase/purchase">自助购</a></li>
            <li class="<?php if(isset($_GET['route']) && ($_GET['route'] == 'product/category' || $_GET['route'] == 'product/product' )) echo 'current'?>">
							<a id="main-menu" href="<?php echo $categories[0]['href']; ?>">现货订购</a>
							<ul id="sub">
								<?php if ($categories) : ?>
	<?php foreach ($categories as $category) { ?>
										<li class="<?php if(isset($_GET['path']) && $_GET['path'] == $category['path']) echo 'current'?>"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
										</li>
									<?php } ?>
<?php endif ?>
							</ul>
            </li>
            <li class="<?php if(isset($_GET['route']) && $_GET['route'] == 'information/information' &&  $_GET['information_id'] == 7) echo 'current'?>"><a href="index.php?route=information/information&information_id=7">产品与服务</a></li>
            <li class="<?php if(isset($_GET['route']) && $_GET['route'] == 'information/information' &&  $_GET['information_id'] == 8) echo 'current'?>"><a href="index.php?route=information/information&information_id=8">帮助中心</a></li>
            <li class="<?php if(isset($_GET['route']) && $_GET['route'] == 'information/contact') echo 'current';?>"><a href="<?php echo $contact; ?>">联系我们</a></li>
					</ul>
				</div>
			</div>
			<div id="notification"></div>

