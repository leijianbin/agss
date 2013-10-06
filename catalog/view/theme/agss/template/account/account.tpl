<?php echo $header; ?>
<div id="widecontent"><div class="shop wrapper" style="margin-top:10px;">
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <div id="deal" style="margin-top:10px; width:720px; border-right:1px dashed #EFEFEF; padding-right:10px;">
  <h1><?php echo $heading_title; ?></h1>
  <h2><?php echo $text_my_account; ?></h2>
  <div class="content">
    <ul>
      <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
      <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
      <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
    </ul>
  </div>
  <h2><?php echo $text_my_orders; ?></h2>
  <div class="content">
    <ul>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
     
    </ul>
  </div>
 	</div>
      <div id="banners"  style="margin-top:-27px;"+>
    	<div class="bannershow" style="width:100%;margin-bottom:10px;">
                	<a target="_blank" href="#"><img src="/images/banner1.jpg" /></a>
                </div> 
        <div class="bannershow" style="width:100%;margin-bottom:10px;">
                	<a target="_blank" href="#"><img src="/images/banner2.jpg" /></a>
                </div>
    </div>
  <?php echo $content_bottom; ?></div>
</div></div>
<?php echo $footer; ?> 
