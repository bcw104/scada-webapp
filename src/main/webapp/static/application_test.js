$.comet.init().subscribe("/admin", function(msg){
        console.log(msg);alert(msg);
        $('#latestMessage').html(msg);
    });
