<div id="widecontent">
	<div class="content wrapper" style="padding: 0; border: none; margin-bottom: 0;">
<div id="banner" style="padding: 0; border: none;">
    <?php foreach ($banners as $banner) { ?>
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
    <?php } ?>
    <?php } ?>
        </div>
	</div>
</div>