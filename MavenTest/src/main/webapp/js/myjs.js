//alert("load files...");
//	$(document).ready(function(){
//		alert("document loaded")
//	})

function dolike(pid,uid)
{
	//alert("like click");
	console.log("pid: "+pid+" , "+"uid: "+uid);
	
	const d={
		uid:uid,
		pid:pid,
		operation:'like'
	}
	
	$.ajax({
		url:"/MavenTest/like",
		data: d,
		
		success: function(data,textStatus,jqXHR){
		console.log(data);
		
		//please check only data return (true) operation other wise it not work 
		//bcz it does not check all values so check liked key value only
		if(data.trim() == 'true')
		{
		  let c = $(".like-counter").html();
			c++;
			$('.like-counter').html(c);
		}
		
		},
		
		error: function(jqXHR,textStatus,errorThrown){
		consle.log(jqXHR);
		}
	})
}