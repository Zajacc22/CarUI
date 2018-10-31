$(function(){
	var speedContainer = $("#speedcontainer");
	var speedText = $(".speedtext");
	var speedSuffix = $(".speedkmh");
	window.addEventListener('message', function(event) {
		if (event.data.showhud) {
            speedContainer.fadeIn();
            speedText.text(event.data.speed);
            speedSuffix.text(event.data.prefix)
        }else if (event.data.hidehud) {
            speedContainer.fadeOut();
        }else if (event.data.action == "toggle"){
			if (event.data.show){
				$('#ui').show();
			} else{
				$('#ui').hide();
			}
		}else if (event.data.action == "toggleCar"){
			if (event.data.show){
				$('.carStats').show();
			} else{
				$('.carStats').hide();
			}
		}else if (event.data.action == "updateLock"){
			updateLock(event.data.lock)
		}else if (event.data.action == "updateVD"){
			updateVD(event.data.damage)
		}else if (event.data.action == "updateBelts"){
			updatePasy(event.data.belt)
		}
	});

});
function updateLock(lock){
	if(lock<=2)
	{
	$('#lock img').attr('src', 'img/vehicle/unlocked.png');
	}else if (lock>2)
	{
	$('#lock img').attr('src', 'img/vehicle/locked.png');
	}
	
}
function updateVD(damage){
	if (damage<975)
	{
		$('#damage img').attr('src', 'img/vehicle/damaged.png');
	}else{
		$('#damage img').attr('src', 'img/vehicle/work.png');
	}
}
function updatePasy(pas){
	if(pas){
		$('#gas img').attr('src', 'img/vehicle/beltson.png');
	}else{
		$('#gas img').attr('src', 'img/vehicle/beltsoff.png');
	}
}
