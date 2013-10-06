
window.onload=function(){
//Nifty("div#menu a","small transparent top");
//Nifty("ul#intro li","same-height");
//Nifty("div.date");
//Nifty("div#content,div#side","same-height");
//Nifty("div.comments div");
//Nifty("div#footer");
//Nifty("div#container","bottom");
//
//Nifty("ul#split h3","top");
//Nifty("ul#split div","bottom same-height");

}

	function cal()
	{
		var rate = 0.1;
		var exchangerate = 6.20;
		
		
		var unitprice = parseFloat(document.getElementById("cal_unitprice").value);
		
	
		var domesticshipping = parseFloat(document.getElementById("domesticshipping").value);
		
		if (document.forma.iftax[1].checked) 
			tax_rate = parseFloat(0.08875);
		else
			tax_rate = parseFloat(0.0);
		
		var totalpriceinusd = (unitprice  + domesticshipping)*(1.0+tax_rate);

	if (totalpriceinusd <50.0)
		{
			var firstpound = 11;
			var costperpound =5.5;
		}
		
		if ((totalpriceinusd <100.0) && (totalpriceinusd >=50.0))
		{
			var firstpound = 11;
			var costperpound =5.5;
		}
		
		if ((totalpriceinusd >=100.0) && (totalpriceinusd<300))
		{
			rate = parseFloat(rate*0.9);
			var firstpound = 11;
			var costperpound =5.5;
		}
		
		if ((totalpriceinusd >=300.0) && (totalpriceinusd<500)) 
		{
			rate = parseFloat(rate*0.85);
			var firstpound = 11;
			var costperpound =5.5;	
		}
		
		if (totalpriceinusd >=500.0) 
		{
			rate = parseFloat(rate*0.8);
			var firstpound = 11;
			var costperpound =5.5;
		}



		var weight = parseFloat(document.getElementById("weight").value);
		var inter_shipping;
		
		if (weight <= 1.0 && weight !=0) 
			inter_shipping = parseFloat(firstpound);
		else
			inter_shipping = Math.round(parseFloat((weight-1) * costperpound + firstpound)*100)/100;
		
		if (weight == 0)
			inter_shipping =0;
		
		document.getElementById("inter_shipping").innerHTML = inter_shipping;
		
		
		
		var tax = Math.round((unitprice + domesticshipping) * tax_rate*100)/100;
		var daigoufei = Math.round(totalpriceinusd*rate*100)/100;
		
		if (daigoufei<10.0) daigoufei =10.0; 
		
		//if (totalpriceinusd <100) daigoufei = 10.0;
		
		document.getElementById("daigoufei").innerHTML = daigoufei;
		document.getElementById("tax").innerHTML = tax;
				
		var finalPrice = Math.round((inter_shipping*1.0 + daigoufei*1.0+totalpriceinusd*1.0)*exchangerate*100)/100;
		document.getElementById("finalPrice").innerHTML = finalPrice;
		
		totalpriceinusd = Math.round(totalpriceinusd*100)/100;
		var summary = "人民币初步核算价"+finalPrice+"元.美国购买总价$"+totalpriceinusd+"(其中美国运费$"+domesticshipping+",消费税$"+tax+").包裹预估"+weight
		+",国际邮费预收$"+inter_shipping+"多退少补,代购费$"+daigoufei;
		document.getElementById("summary").innerHTML = summary;
		 
	}


function newshoppingguidewindow(){
//	myWindow=window.open('shoppingguide.html','Shopping Guide','toolbar=no,menubar=no,scrollabars=no,resizable=0,width=210,height=600');	
	myWindow=window.open('http://shop.freshwired.com/shoppingguide.html','','toolbar=0,menubar=0,scrollbars=1,resizable=1,fullscreen=no,width=200,height=600');	
}



$.fn.infiniteCarousel = function () {

    function repeat(str, num) {
        return new Array( num + 1 ).join( str );
    }
  
    return this.each(function () {
        var $wrapper = $('> div', this).css('overflow', 'hidden'),
            $slider = $wrapper.find('> ul'),
            $items = $slider.find('> li'),
            $single = $items.filter(':first'),
            
            singleWidth = $single.outerWidth(), 
            visible = Math.ceil($wrapper.innerWidth() / singleWidth), // note: doesn't include padding or border
            currentPage = 1,
            pages = Math.ceil($items.length / visible);            


        // 1. Pad so that 'visible' number will always be seen, otherwise create empty items
        if (($items.length % visible) != 0) {
            $slider.append(repeat('<li class="empty" />', visible - ($items.length % visible)));
            $items = $slider.find('> li');
        }

        // 2. Top and tail the list with 'visible' number of items, top has the last section, and tail has the first
        $items.filter(':first').before($items.slice(- visible).clone().addClass('cloned'));
        $items.filter(':last').after($items.slice(0, visible).clone().addClass('cloned'));
        $items = $slider.find('> li'); // reselect
        
        // 3. Set the left position to the first 'real' item
        $wrapper.scrollLeft(singleWidth * visible);
        
        // 4. paging function
        function gotoPage(page) {
            var dir = page < currentPage ? -1 : 1,
                n = Math.abs(currentPage - page),
                left = singleWidth * dir * visible * n;
            
            $wrapper.filter(':not(:animated)').animate({
                scrollLeft : '+=' + left
            }, 500, function () {
                if (page == 0) {
                    $wrapper.scrollLeft(singleWidth * visible * pages);
                    page = pages;
                } else if (page > pages) {
                    $wrapper.scrollLeft(singleWidth * visible);
                    // reset back to start position
                    page = 1;
                } 

                currentPage = page;
            });                
            
            return false;
        }
        
        $wrapper.after('<a class="arrow back">&lt;</a><a class="arrow forward">&gt;</a>');
        
        // 5. Bind to the forward and back buttons
        $('a.back', this).click(function () {
            return gotoPage(currentPage - 1);                
        });
        
        $('a.forward', this).click(function () {
            return gotoPage(currentPage + 1);
        });
        
        // create a public interface to move to a specific page
        $(this).bind('goto', function (event, page) {
            gotoPage(page);
        });
    });  
};

$(document).ready(function () {
  $('.infiniteCarousel').infiniteCarousel();
});