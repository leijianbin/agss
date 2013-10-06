<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
<div class="content wrapper" style="border:none;">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <div id="deal" style="margin-top:10px; width:720px; padding-right:10px;">
  <h1><?php echo $heading_title; ?></h1>
  <?php echo $text_message; ?>
  
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  </div>
  
  <div id="banners"  style="margin-top:-27px;">
    	<div class="bannershow" style="width:100%;margin-bottom:10px;">
                	<a target="_blank" href="#"><img src="/images/banner1.jpg" /></a>
                </div> 
   
    </div>
    
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>