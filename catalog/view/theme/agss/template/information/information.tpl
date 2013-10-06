<?php echo $header; ?>
<div id="widecontent"><div class="content wrapper">
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <div id="deal" style="margin-top:5px; width:720px; border-right:1px dashed #EFEFEF; padding-right:10px;">
  <h1><?php echo $heading_title; ?></h1>
  <div class="box" style="width:720px; border:1px solid #efefef;">
  <div class="bigbanner"><?php echo $description; ?></div>
 
  <?php echo $content_bottom; ?>
      </div>
      </div>
       <div id="banners"  style="margin-top:-27px;">
    	<div class="bannershow" style="width:100%;margin-bottom:10px;">
                	<a target="_blank" href="#"><img src="/images/banner1.jpg" /></a>
                </div> 
        <div class="bannershow" style="width:100%;margin-bottom:10px;">
                	<a target="_blank" href="#"><img src="/images/banner2.jpg" /></a>
                </div>
  		<div class="bannershow" style="width:100%;margin-bottom:10px;">
                	<a target="_blank" href="#"><img src="/images/banner3.jpg" /></a>
                </div>
                <div class="bannershow" style="width:100%;margin-bottom:10px;">
                	<a target="_blank" href="#"><img src="/images/banner4.jpg" /></a>
                </div>
        </div>
    
  </div>

</div></div>
<?php echo $footer; ?>
