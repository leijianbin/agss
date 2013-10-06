<?php echo $header; ?>
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
      <h1><img src="view/image/information.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <div id="tabs" class="htabs"><a href="#tab-data"><?php echo $tab_data; ?></a></div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        
        <div id="tab-data">
          <table class="form">
            
			<tr>
              <td><?php echo $entry_email; ?></td>
              <td><input type="text" name="email" value="<?php echo $email; ?>" /></td>
            </tr>
			<tr>
              <td><?php echo $entry_phone; ?></td>
              <td><input type="text" name="phone" value="<?php echo $phone; ?>" /></td>
            </tr>
			<tr>
              <td><?php echo $entry_address; ?></td>
              <td><input type="text" name="address" value="<?php echo $address; ?>" /></td>
            </tr>
			<tr>
              <td><?php echo $entry_map_1; ?></td>
              <td><textarea name="map_1" ><?php echo $map_1; ?></textarea></td>
            </tr>
			<tr>
              <td><?php echo $entry_map_2; ?></td>
              <td><textarea name="map_2"><?php echo $map_2; ?></textarea></td>
            </tr>
			<tr>
              <td><?php echo $entry_map_3; ?></td>
              <td><textarea name="map_3" ><?php echo $map_3; ?></textarea></td>
            </tr>
			<tr>
              <td><?php echo $entry_map_4; ?></td>
              <td><textarea name="map_4" ><?php echo $map_4; ?></textarea></td>
            </tr>
            
                       
          
            
          </table>
        </div>
        
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('description<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
$('#languages a').tabs(); 
//--></script> 
<?php echo $footer; ?>