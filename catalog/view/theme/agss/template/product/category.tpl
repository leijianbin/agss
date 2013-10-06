<?php echo $header; ?><?php echo $column_right; ?>

    <div id="widecontent">
    	<div class="content wrapper">
        	<div id="deal" style="margin-top:0;">
		<?php foreach ($products as $product) { ?>
			<div class="deal_box">
				<div class="text">
					<h2><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
					<p>仅售129元，菲拉格慕Ferragamo蝶忆绽放女士香水30ml，清新的香调，掀起了新一波诱惑，同时融合了多种不同风格</p>
					<a href="<?php echo $product['href']; ?>" class="pricecover">
						<div class="price">
							<div class="p_number">
								<div class="p"><?php echo $product['price']; ?></div>

							</div>
							<div class="p_deal"><?php if ($product['special']) { ?>
									<div class="special line"><?php echo $product['special']; ?></div>
								<?php } ?>
								<div class="special"><?php echo $product['price']; ?></div>
							</div>
						</div>
					</a>
				</div>
				<div class="img">
					<a href="<?php echo $product['href']; ?>">
						<?php if ($product['thumb']) { ?>
							<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
						<?php } ?>
						<div class="over" >
							<img src="catalog/view/theme/agss/image/content_ordercar.jpg"  />
						</div>
					</a>
				</div>
			</div>
		<?php } ?>
                
                
            </div>
            <div id="banners">
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
                <div class="bannershow" style="width:100%;margin-bottom:10px;">
                	<a target="_blank" href="#"><img src="/images/banner5.jpg" /></a>
                </div>
                <div class="bannershow" style="width:100%;margin-bottom:10px;">
                	<a target="_blank" href="#"><img src="/images/banner6.jpg" /></a>
                </div>
                <div class="bannershow" style="width:100%;margin-bottom:10px;">
                	<a target="_blank" href="#"><img src="/images/banner7.jpg" /></a>
                </div>
                <div class="bannershow" style="width:100%;margin-bottom:10px;">
                	<a target="_blank" href="#"><img src="/images/banner8.jpg" /></a>
                </div>
                <div class="bannershow" style="width:100%;margin-bottom:10px;">
                	<a target="_blank" href="#"><img src="/images/banner9.jpg" /></a>
                </div>
    
    
            </div>
            
                        <div class="pagenumber">
            	<div class="pagelist">
						<?php echo $pagination; ?>
                </div>
            </div>
            
        </div>
        </div>
<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {
			html  = '<div class="right">';
			html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
			html += '</div>';			
			
			html += '<div class="left">';
			
			var image = $(element).find('.image').html();
			
			if (image != null) { 
				html += '<div class="image">' + image + '</div>';
			}
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
					
			html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
			html += '  <div class="description">' + $(element).find('.description').html() + '</div>';
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
				
			html += '</div>';

						
			$(element).html(html);
		});		
		
		$('.display').html('<b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display(\'grid\');"><?php echo $text_grid; ?></a>');
		
		$.cookie('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.product-grid > div').each(function(index, element) {
			html = '';
			
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}
			
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			html += '<div class="description">' + $(element).find('.description').html() + '</div>';
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
						
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
			
			$(element).html(html);
		});	
					
		$('.display').html('<b><?php echo $text_display; ?></b> <a onclick="display(\'list\');"><?php echo $text_list; ?></a> <b>/</b> <?php echo $text_grid; ?>');
		
		$.cookie('display', 'grid');
	}
}

view = $.cookie('display');

if (view) {
	display(view);
} else {
	display('list');
}
//--></script> 
<?php echo $footer; ?>


<script type="text/javascript"><!--
$(document).ready(function(){
	$('.content').css('margin-top',$('#sub').height()+10)
});
//--></script> 
