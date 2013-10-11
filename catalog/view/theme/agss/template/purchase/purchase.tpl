<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<script type="text/javascript">
	$(document).ready(function() {

        // increase and decrease the input quantity button
        $(".btn-increase").live('click',function() {
            $(this).parent().parent().find('.quantity').val(
                parseInt($(this).parent().parent().find('.quantity').val())+1
            );
        });

        $(".btn-decrease").live('click',function() {
            if(parseInt($(this).parent().parent().find('.quantity').val()) > 1) {
                $(this).parent().parent().find('.quantity').val(
                    parseInt($(this).parent().parent().find('.quantity').val())-1
                );
            }
        });


        // dynamic change the products input form according to the current selected products quantity
		$('#quantity').change(function() {
            var quantity = parseInt($(this).val());
            var count_rows = $('.product-row').length;
            if(quantity < count_rows) {
                for(var i=quantity+1; i<=count_rows; i++) {
                    $('#product-'+i).hide().remove();
                }
            }
            for(var i=count_rows+1; i<=quantity; i++) {
                $('.products-all').append(parseTemplate($("#ItemTemplate").html(), {id: i})).show();
            }
        });
	});
</script>
<script id="ItemTemplate" type="text/html">
	<div class="product-row added-row" id="product-<#= id #>">
		<div class="goods1" >
			商品<#= id #>
		</div>
		<p class="good-p">	
			购买商品网址： <input class="link1" type="text" name="link[]" value="" />
		</p>
		<div class="fill2">
			<div>
				<p>商品名称：<input class="name" type="text" name="product[]" value="" /></p></div>
			<div><p>商品单价：<span> $ </span><input class="size" type="text" name="price[]" value="" /></br></p></div>
			<div style="float:left;"><p>购买数量：<input class="number quantity" type="text" name="quantity[]" value="1"  style="font-size:14px; line-height:20px;"/></p></div>
			<div style="float:left; margin-top:29px; margin-left:4px;">
				<button class="btn-increase" type="button"  style="cursor:pointer; width:17px; height:17px;">
					<img src="catalog/view/theme/agss/image/plus.png" />
				</button>
				<button class="btn-decrease" type="button"  style="cursor:pointer; width:17px; height:17px; border:none;">
					<img src="catalog/view/theme/agss/image/minus.png" />
				</button>
			</div>
			<div class="clear"></div>
			<div style="float:left;"><p>商品尺寸：<input class="sale" type="text" name="size[]" value="" />
				</p>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<div style="float:left; margin-left:52px;">
				<p>商品颜色：<input class="color" type="text" name="color[]" value="" /></br></p></div>
			<div class="clear"></div>
			<div class="remark">
				<p style="margin-top:20px;">商品备注：<input id="agree_userterm"  type="checkbox" checked="true" />
					<label for="agree_userterm">如果无特殊商品备注说明—请勾选此项</label></p>
				<textarea class="block"  rows="4" cols="" name="description[]"></textarea>
			</div>
			<div class="middleline"  style="margin-top:70px;">
			</div>
		</div>
	</div>
</script>
<div id="widecontent">
	<div class="shop wrapper" style="margin-top:10px;">
		<div class="shopping">
			<div class="aboutshopping">
				<p class="about">关于自助购</p>
				<div class="abouttext">             
					您在美鑫采购网代购商品一定生产的费用：美元原价、国际运费、代购服务费。可能产生的费用：美国当地销售税、美国国内运费、运输保险费还有可能的中国海关关税。具体解释如下：</br>
					代购总费用=网站明码标价+美国国内运费+美国国内消费税+代购服务费+国际运费+可能的海关关税或者保险。
				</div>
			</div>
			<form name="forma" style="margin-left:38px; margin-top:6px; width:640px;">
				<p class="about" style="margin-bottom:10px;">到手价预估</p>
				<table align="center" cellpadding="0" cellspacing="2" bgcolor="#cccccc" width="640">
					<tbody >
						<tr bgcolor="#ffffff"><td align="center"><p>网站标价</p></td><td align="center"><p>美国国内运费</p></td>
							<td align="center" width="80" nowrap=""><p>消费税率</p></td><td align="center"><p>包裹重量</p></td><td align="center"><p>税金</p></td><td align="center"><p>国际运费</p></td><td align="center"><p>代购费</p></td><td align="center"><p>人民币到手价</p></td></tr>
						<tr bgcolor="#ffffff"><td align="center">$<input id="cal_unitprice" size="3" onkeyup="cal()">美元</td>
							<td align="center">$<input id="domesticshipping" size="5" value="0" onkeyup="cal()">美元</td>
							<td align="center"><input id="iftax" type="radio" name="iftax" value="0" checked="" onclick="cal()">无<input id="iftax" name="iftax" type="radio" value="1" onclick="cal()">有</td>
							<td align="center"><input id="weight" name="weight" size="2" value="1" onkeyup="cal()">磅(=0.454kg)</td> 
							<td align="center"><span id="tax"></span>美元</td>
							<td align="center"><span id="inter_shipping" style="color:GREEN; font-size:20px;"></span>美元</td>
							<td align="center"><span id="daigoufei" style="color:GREEN; font-size:20px;"></span>美元</td>
							<td align="center"><span id="finalPrice" style="color:GREEN; font-size:20px;"></span>元</td></tr>
						<tr><td colspan="8" align="left"><span id="summary" style="color:red; font-size:12px;"></span></td></tr>
					</tbody>
				</table>
			</form>
			<form class="link">
				<div class="about" style="margin-bottom:14px; margin-top:-2px;">自助购订单</div>
				<div class="specious"><p>商品种数：
						<select id="quantity" name="quantity" style=" width:74px; height:30px; border:#eeeeee 1px solid; font-size:14px; text-align:0 auto; margin-bottom:20px;">
							<option selected="selected" value="1" style="font-size:16px;">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select></p>
				</div>
			</form> 
			<form class="fill">
				<div class="products-all">
					<!-- item row start -->
					<div class="product-row" id="product-1">
						<div class="goods1">
							商品1
						</div>
						<p class="good-p">	
							购买商品网址： <input class="link1" type="text" name="link[]" value="" />
						</p>
						<div class="fill2">
							<div>
								<p>商品名称：<input class="name" type="text" name="product[]" value="" /></p></div>
							<div><p>商品单价：<span> $ </span><input class="size" type="text" name="price[]" value="" /></br></p></div>
							<div style="float:left;"><p>购买数量：<input class="number quantity" type="text" name="quantity[]" value="1"  style="font-size:14px; line-height:20px;"/></p></div>
							<div style="float:left; margin-top:29px; margin-left:4px;">
								<button class="btn-increase" type="button"  style="cursor:pointer; width:17px; height:17px;">
									<img src="catalog/view/theme/agss/image/plus.png" />
								</button>
								<button class="btn-decrease" type="button"  style="cursor:pointer; width:17px; height:17px; border:none;">
									<img src="catalog/view/theme/agss/image/minus.png" />
								</button>
							</div>
							<div class="clear"></div>
							<div style="float:left;"><p>商品尺寸：<input class="sale" type="text" name="size[]" value="" />
								</p>
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;
							<div style="float:left; margin-left:52px;">
								<p>商品颜色：<input class="color" type="text" name="color[]" value="" /></br></p></div>
							<div class="clear"></div>
							<div class="remark">
								<p style="margin-top:20px;">商品备注：<input id="agree_userterm"  type="checkbox" checked="true" />
									<label for="agree_userterm">如果无特殊商品备注说明—请勾选此项</label></p>
								<textarea class="block"  rows="4" cols="" name="description[]"></textarea>
							</div>
							<div class="middleline"  style="margin-top:25px;">
							</div>
						</div>
					</div>
					<!-- item row end -->
				</div> <!-- end all products -->
				<div class="clear"></div>
				<div  style=" margin-top:20px; padding-left: 70px;">
					<button id="button-cart" class="second" type="button" style="background-color:#e463a3; width:62px; height:34px; font-size:14px; color:#fff; cursor:pointer; ">提交</button>
					<a href="#">清空</a>
				</div>
			</form>
		</div>
		<div id="dotline">
		</div>
		<div id="banners">
			<div class="bannershow" style="width:100%;margin-bottom:10px;">
				<a target="_blank" href="#"><img src="catalog/view/theme/agss/image/banner1.jpg" /></a>
			</div>
			<div class="bannershow" style="width:100%;margin-bottom:10px;">
				<a target="_blank" href="#"><img src="catalog/view/theme/agss/image/banner2.jpg" /></a>
			</div>
			<div class="bannershow" style="width:100%;margin-bottom:10px;">
				<a target="_blank" href="#"><img src="catalog/view/theme/agss/image/banner3.jpg" /></a>
			</div>
			<div class="bannershow" style="width:100%;margin-bottom:10px;">
				<a target="_blank" href="#"><img src="catalog/view/theme/agss/image/banner4.jpg" /></a>
			</div>
			<div class="bannershow" style="width:100%;margin-bottom:10px;">
				<a target="_blank" href="#"><img src="catalog/view/theme/agss/image/banner5.jpg" /></a>
			</div>
			<div class="bannershow" style="width:100%;margin-bottom:10px;">
				<a target="_blank" href="#"><img src="catalog/view/theme/agss/image/banner6.jpg" /></a>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript"><!--
$('#button-cart').bind('click', function(e) {
	e.preventDefault();
	$.ajax({
		url: 'index.php?route=checkout/cart/selforder',
		type: 'post',
		data: $('.products-all input[type=\'text\'], .products-all input[type=\'hidden\'], .products-all input[type=\'radio\']:checked, .products-all input[type=\'checkbox\']:checked, .products-all select, .products-all textarea'),
		dataType: 'json',
		success: function(json) {
			if (json['success']) {
                location.href="index.php?route=checkout/cart";
			}	
		}
	});
});
//--></script>
<?php echo $footer; ?>


<script type="text/javascript"><!--
$(document). ready(function(){
	$('select').css('border-color', '#cccccc' )
})
//--></script> 



