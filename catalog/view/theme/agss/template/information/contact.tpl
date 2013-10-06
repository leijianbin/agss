<?php echo $header; ?>
<div id="widecontent"><div class="content wrapper">
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
   <div id="deal"  style="margin-top:5px;">
   <h1>联系我们</h1> 
	<div class="contact">
        	<div class="contactinfo">
            <p>
             电话：<span><?php echo $contact_info['phone']?></span><br/></p>
             <p>邮箱：<?php echo $contact_info['email'];?><br/>
             地址：<?php echo $contact_info['address'];?><br/>
            </p>
            </div>
            <div class="map">
				<?php echo $contact_info['map_1'];?>
				<?php echo $contact_info['map_2'];?>
				<?php echo $contact_info['map_3'];?>
				<?php echo $contact_info['map_4'];?>
            	<img src="images/map.jpg"/>
            </div>
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
                	<a target="_blank" href="#"><img src="/images/banner4.jpg" /></a>
                </div>
         <div class="bannershow" style="width:100%;margin-bottom:10px;">
                	<a target="_blank" href="#"><img src="/images/banner7.jpg" /></a>
                </div>
    </div>
  <?php echo $content_bottom; ?></div>
</div></div>
<?php echo $footer; ?>
