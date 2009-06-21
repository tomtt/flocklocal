/*
*         ________           __   __                     __
*        / ____/ /___  _____/ /__/ /   ____  _________ _/ /
*       / /_  / / __ \/ ___/ //_/ /   / __ \/ ___/ __ `/ / 
*      / __/ / / /_/ / /__/ ,< / /___/ /_/ / /__/ /_/ / /  
*     /_/   /_/\____/\___/_/|_/_____/\____/\___/\__,_/_/   
*                                                          
*     Do good. Fast.                      
*/


document.observe("dom:loaded", function() {
	// Set location
	if($('location') != null) {
		var loc = Cookie.get('loc');
		if(!loc) {
			geofill.find({
				callback:function(o){
					$('location').value = o.city;
					Cookie.set('loc', o.city, 1209600);
				}
			});
		} else {
			$('location').value = loc;
			Cookie.set('loc', loc, 1209600);
		}
		
		$('location').observe('blur', function() {
			Cookie.set('loc', $F('location'), 1209600);
		});
	}
	
	if($('welcome') != null) {
		$('welcome').hide() // Always starts hidden
		
		var timesSeen = Cookie.get('wt') || 0;
		if(timesSeen <= 2) {
			new Effect.BlindDown($('welcome'), {duration:0.5, delay:3, afterFinish:function() {
				$$('#welcome a')[0].observe('click', function() {
					Cookie.set('wt', 99, 1209600);
				});
				Cookie.set('wt', ++timesSeen, 1209600);
			}});
		}
	}
});




var Cookie = {
	set: function(name,value,seconds){
		if(seconds){
			d = new Date();
			d.setTime(d.getTime() + (seconds * 1000));
			expiry = '; expires=' + d.toGMTString();
		}else
			expiry = '';
		document.cookie = name + "=" + value + expiry + "; path=/";
	},
	get: function(name){
		nameEQ = name + "=";
		ca = document.cookie.split(';');
		for(i = 0; i < ca.length; i++){
			c = ca[i];
			while(c.charAt(0) == ' ')
				c = c.substring(1,c.length);
			if(c.indexOf(nameEQ) == 0)
				return c.substring(nameEQ.length,c.length);
		}
		return null
	},
	unset: function(name){
		Cookie.set(name,'',-1);
	}
}
