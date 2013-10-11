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
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/product.png" alt="" /> <?php echo "首页数据";//$heading_title; ?></h1>
      <div class="buttons"><a onclick="location = '<?php echo $insert; ?>'" class="button"><span><?php echo $button_insert; ?></span></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-homepage" >
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
             
			  <td class="left title"><?php if ($sort == 's.id') { ?>
                <a href="<?php echo $sort_id; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_id; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_id; ?>"><?php echo $column_id; ?></a>
                <?php } ?>
              </td>
              <td class="left title"><?php if ($sort == 's.title') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_title; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_title; ?></a>
                <?php } ?>
              </td>
              <td class="left pcode"><?php echo $column_pcode; ?>
              </td>
<!--			  <td class="left name"><?php echo $column_name; ?>
              </td>
			  <td class="left title"><?php echo $column_title_en; ?>
              </td>
			  <td class="left summary"><?php echo $column_summary; ?>
              </td>
			  <td class="left summary"><?php echo $column_summary_en; ?>
              </td>-->
			  <td class="left price_origin"><?php echo $column_price_origin; ?>
              </td>
			  <td class="left price_now"><?php echo $column_price_now; ?>
              </td>
<!--			  <td class="left contact"><?php echo $column_contact; ?>
              </td>-->
			  <td class="left quantity"><?php echo $column_quantity; ?>
              </td>
			  <td class="left order_num"><?php echo $column_order_num; ?>
              </td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <tr class="filter">
              <td></td>
              <td><input type="text" name="filter_id" value="<?php echo isset($filter_id)?$filter_id:''; ?>" /></td>
			  <td><input type="text" name="filter_name" value="<?php echo isset($filter_name)?$filter_name:''; ?>" /></td>
              <td></td>
              <td align="left"></td>
              <td align="right"></td>
              <td></td>
			  <td></td>
              <td align="right"><a onclick="filter();" class="button"><span><?php echo $button_filter; ?></span></a></td>
            </tr>
            <?php if ($pagedatas) { ?>
            <?php foreach ($pagedatas as $pagedata) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($pagedata['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $pagedata['pagedata_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $pagedata['pagedata_id']; ?>" />
                <?php } ?></td>
			  <td class="left title"><?php echo $pagedata['pagedata_id']; ?></td>
              <td class="left title"><?php echo $pagedata['title']; ?></td>
              <td class="left pcode"><?php echo $pagedata['pcode']; ?></td>
<!--			  <td class="left name"><?php echo $pagedata['name']; ?></td>
			  <td class="left title"><?php echo $pagedata['title_en']; ?></td>
			  <td class="left summary"><?php echo $pagedata['summary']; ?></td>
			  <td class="left summary"><?php echo $pagedata['summary_en']; ?></td>-->
			  <td class="left price_origin"><?php echo $pagedata['price_origin']; ?></td>
			  <td class="left price_now"><?php echo $pagedata['price_now']; ?></td>
<!--			  <td class="left contact"><?php echo $pagedata['contact']; ?></td>-->
			  <td class="left quantity"><?php echo $pagedata['quantity']; ?></td>
			  <td class="left order_num"><?php echo $pagedata['order_num']; ?></td>
              <td class="right"><?php foreach ($pagedata['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="7"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=homemanager/pagedata&token=<?php echo $token; ?>';
	
	var filter_id = $('input[name=\'filter_id\']').attr('value');
	if (filter_id) {
		url += '&filter_id=' + encodeURIComponent(filter_id);
	}
	
	var filter_name = $('input[name=\'filter_name\']').attr('value');
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}

	location = url;
}
//--></script> 
<script type="text/javascript"><!--
$('#form-homepage input').keydown(function(e) {
	if (e.keyCode == 13) {
		e.preventDefault();
		$('.filter .button').click();
	}
});
//--></script> 
 
<?php echo $footer; ?>