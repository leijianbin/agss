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
                <td><?php echo $entry_pcode; ?></td>
                <td><select name="pcode" class="pcode">
						<option value="0" ><?php echo $text_select?></option>
				    <?php foreach($pcode as $v){?>
						<option value="<?php echo $v['id']?>" <?php echo $v['id'] == isset($pagedatas['pcode']) && $pagedatas['pcode']?'selected':''?>><?php echo $v['position']?>---<?php echo $v['name']?></option>
					<?php }?>
					</select>
				</td>
              </tr>
              <tr class="title">
                <td> <?php echo $entry_title; ?></td>
                <td><input type="text" name="title"  value="<?php echo isset($pagedatas['title']) ? $pagedatas['title'] : ''; ?>" />
                 </td>
              </tr>
			  <tr class="title_en" >
                <td> <?php echo $entry_title_en; ?></td>
                <td><input type="text" name="title_en"  value="<?php echo isset($pagedatas['title_en']) ? $pagedatas['title_en'] : ''; ?>" />
                 </td>
              </tr>
			<tr class="quantity">
                <td><?php echo $entry_quantity; ?></td>
                <td><input type="text" name="quantity" value="<?php echo isset($pagedatas['quantity']) ? $pagedatas['quantity'] : ''; ?>" /></td>
              </tr>
			  <tr class="titlelink">
                <td><?php echo $entry_titlelink; ?></td>
                <td><input type="text" name="titlelink" value="<?php echo isset($pagedatas['titlelink']) ? $pagedatas['titlelink'] : ''; ?>"/></td>
              </tr>
			  <tr class="summary">
				  <td><?php echo $entry_summary; ?></td>
				  <td><textarea name="summary" id="pagedata_summary"> <?php echo isset($pagedatas['summary']) ? $pagedatas['summary'] : ''; ?></textarea></td>
			  </tr>
			   <tr class="summary_en">
				  <td><?php echo $entry_summary_en; ?></td>
				  <td><textarea name="summary_en" id="pagedata_summary_en"><?php echo isset($pagedatas['summary_en']) ? $pagedatas['summary_en'] : ''; ?></textarea></td>
			  </tr>
			  <tr class="image">
              <td><?php echo $entry_image; ?></td>
              <td><input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
                <img src="<?php echo $preview; ?>" alt="" id="preview" class="image" onclick="image_upload('image', 'preview');" style="margin-top: 0px;"/></td>
            </tr>
			  <tr class="price_origin">
                <td><?php echo $entry_price_origin; ?></td>
                <td><input type="text" name="price_origin" value="<?php echo isset($pagedatas['price_origin']) ? $pagedatas['price_origin'] : ''; ?>"/></td>
              </tr>
			  <tr class="price_now">
                <td><?php echo $entry_price_now; ?></td>
                <td><input type="text" name="price_now" value="<?php echo isset($pagedatas['price_now']) ? $pagedatas['price_now'] : ''; ?>"/></td>
              </tr>
			  
			  <tr class="isshow">
                <td><?php echo $entry_isshow; ?></td>
                <td><input type="checkbox" name="isshow" value="<?php echo isset($pagedatas['isshow']) ? $pagedatas['isshow'] : '1'; ?>" <?php echo isset($pagedatas['isshow']) ? ($pagedatas['isshow']==1?'checked':'') : 'checked'; ?>/></td>
              </tr>
			  <tr class="contact">
                <td><?php echo $entry_contact; ?></td>
                <td><input type="text" name="contact" value="<?php echo isset($pagedatas['contact']) ? $pagedatas['contact'] : ''; ?>"/></td>
              </tr>
			  <tr class="order_num" >
                <td><?php echo $entry_order_num; ?></td>
                <td><input type="text" name="order_num" value="<?php echo isset($pagedatas['order_num']) ? $pagedatas['order_num'] : '1'; ?>"/></td>
              </tr>
			  <tr>
                <td><input type="hidden" name="subpcode" value="<?php echo isset($pagedatas['subpcode']) ? $pagedatas['subpcode'] : ''; ?>"/></td>
              </tr>
            </table>
          </div>
		</div>
     
       
 
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--

CKEDITOR.replace('pagedata_summary', {toolbar : 'Full1', height:130});
CKEDITOR.replace('pagedata_summary_en', {toolbar : 'Full1', height:130});
//--></script> 
<script type="text/javascript"><!--
function image_upload(field, preview) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>',
					type: 'POST',
					data: 'image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(data) {
						$('#' + preview).replaceWith('<img src="' + data + '" alt="" id="' + preview + '" class="image" onclick="image_upload(\'' + field + '\', \'' + preview + '\');" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 700,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
<script type="text/javascript"><!--
	
    function showFields(){
	switch($('.pcode').val()){
		case '1':
			$('.title').show();
			$('.title_en').show();
			$('.titlelink').show();
			$('.summary').hide();
			$('.summary_en').hide();
			$('.image').hide();
			$('.price_origin').hide();
			$('.contact').hide();
			$('.quantity').hide();
			$('.price_now').hide();
			break;
		
		default:
			$('.title').show();
			$('.title_en').show();
			$('.titlelink').show();
			$('.summary').show();
			$('.summary_en').show();
			$('.image').show();
			$('.price_origin').show();
			$('.contact').show();
			$('.quantity').show();
			$('.price_now').show();
			break;
			
	}
}

showFields();

$('.pcode').change(function(){
	showFields();
	
});

//--></script> 
<?php echo $footer; ?>