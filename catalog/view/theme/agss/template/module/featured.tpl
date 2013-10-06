<div id="widecontent">
	<div class="content wrapper">
<div id="middle">
	<div class="both">
		<div class="round">
			<img src="catalog/view/theme/agss/image/content_heartshape.jpg" />
		</div>
		<div class="rightshow">
			<div class="click click1">
				<a href="http://agss.yibadatech.com/index.php?route=purchase/purchase">

				</a>
			</div>
			<div class="shortshow">在国内网站上自已订购商品后，卖家不发国际包裹，怎么办？可将购买后的商品寄至代购仓库集中存放，后期一起打包邮寄</div>
		</div>
	</div>
	<div class="both">
		<div class="round dash">
			<img src="catalog/view/theme/agss/image/content_flower.jpg" />
		</div>
		<div class="rightshow">
			<div class="click click2">
				<a href="index.php?route=product/category&path=20">

				</a>
			</div>
			<div class="shortshow">人在国外想给国内亲友送份礼物，可将礼物链接地址提交给金采网，我们为您购买并由商家直接寄至亲友处。</div>
		</div>
	</div>
</div>
<div class="clear"></div>
<div id="box">
	<div id="left">
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
	<div id="right">
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
		<div class="bannershow" style="width:100%;margin-bottom:10px;">
			<a target="_blank" href="#"><img src="catalog/view/theme/agss/image/banner7.jpg" /></a>
		</div>
		<div class="bannershow" style="width:100%;margin-bottom:10px;">
			<a target="_blank" href="#"><img src="catalog/view/theme/agss/image/banner8.jpg" /></a>
		</div>
		<div class="bannershow" style="width:100%;margin-bottom:10px;">
			<a target="_blank" href="#"><img src="catalog/view/theme/agss/image/banner9.jpg" /></a>
		</div>
	</div>

</div>
</div>
</div>