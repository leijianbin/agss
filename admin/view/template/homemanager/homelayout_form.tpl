<?php echo $header; ?>
<link href="view/javascript/jquery/datepicker/jquery.datepick.css" media="screen" rel="stylesheet" type="text/css" /> 
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
    </div>
    <div class="content">
      <div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a><!--<a href="#tab-attribute"><?php echo $tab_attribute; ?></a><a href="#tab-option"><?php echo $tab_option; ?></a><a href="#tab-discount"><?php echo $tab_discount; ?></a><a href="#tab-special"><?php echo $tab_special; ?></a>--><!--<a href="#tab-reward"><?php echo $tab_reward; ?></a>--><!--<a href="#tab-design"><?php echo $tab_design; ?></a>--></div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-general">
          <div id="language">
            <table class="form">
              <tr>
                <td> <?php echo $entry_name; ?></td>
                <td><input type="text" name="name"  value="<?php echo isset($homelayouts['name']) ? $homelayouts['name'] : ''; ?>" />
                 </td>
              </tr>
              <tr>
                <td><?php echo $entry_position; ?></td>
                <td><input type="text" name="position" value="<?php echo isset($homelayouts['position']) ? $homelayouts['position'] : ''; ?>" /></td>
              </tr>
			
			<tr>
                <td><?php echo $entry_name_en; ?></td>
                <td><input type="text" name="name_en" value="<?php echo isset($homelayouts['name_en']) ? $homelayouts['name_en'] : ''; ?>" /></td>
              </tr>
			  <tr>
                <td><?php echo $entry_layout; ?></td>
                <td><input type="text" name="layout" value="<?php echo isset($homelayouts['layout']) ? $homelayouts['layout'] : ''; ?>"/></td>
              </tr>
			  
            </table>
          </div>
		</div>
     
       
 
      </form>
    </div>
  </div>
</div>

<?php echo $footer; ?>