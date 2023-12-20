// ███████╗██╗██╗   ██╗███████╗███████╗████████╗ █████╗ ██████╗ 
// ██╔════╝██║██║   ██║██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗
// █████╗  ██║██║   ██║█████╗  ███████╗   ██║   ███████║██████╔╝
// ██╔══╝  ██║╚██╗ ██╔╝██╔══╝  ╚════██║   ██║   ██╔══██║██╔══██╗
// ██║     ██║ ╚████╔╝ ███████╗███████║   ██║   ██║  ██║██║  ██║
// ╚═╝     ╚═╝  ╚═══╝  ╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝
// 			Copyright ® 2023 Lorem All rights FiveStar
// 		  	  5star.tebex.io | Discord.gg/HdEzqEJBdh
$(function () {
    setTimeout(() => {
        $.post("https://FiveStar-SpawnSelector/RequestLoadUIData", function (Location) {
            let index = 0
            Location.data.forEach(data => {
                index += 1 
                $(".container").append(`
                <input type="radio" name="slide" id="${index}" ${index == 1 ? "checked" : ""}>
                <label class="card" for="${index}" style="background-image: url('images/${data.Image}');">
                    <div class="row">
                        <div class="icon">${index} L</div>
                        <div class="description">
                            <h4>${data.Name}</h4>
                            <p>${data.Description}</p>
                        </div>
                        <div class="select" index="${index}">Select</div>
                    </div>
                </label>`)
            });

            $(".main-description h4").text(Location.last.Name);
            $(".main-description p").text(Location.last.Description);
            $(".main-icon").text(Location.last.MiniTxt);

            $("body").fadeIn(500);
            setTimeout(() => {
                $(".container-down").css("bottom", "1vw");
            }, 400);
        });
    }, 700);

    $(document).on("click", ".select", function () {
        const index = $(this).attr("index");
        $(".select").text("Selected");
        $(".select").css("left", "-7vw");
        $(".select").css("width", "5.604vw");
        setTimeout(() => {
            $.post("https://FiveStar-SpawnSelector/teleport", JSON.stringify({index}));
            $("body").fadeOut(500);
        }, 400);
    });

    $(document).on("click", ".container-down", function () {
        $(".container-down").css("bottom", "-4vw");
        $.post("https://FiveStar-SpawnSelector/teleport");
        $("body").fadeOut(500);
    });

    function Exit() {
        $(".container-down").css("bottom", "-4vw");
		$.post("https://FiveStar-SpawnSelector/teleport");
		$("body").fadeOut(500);
	}

	$(".ExitButtom").click((e) => Exit());

	document.addEventListener("keyup", function (data) {
		if (data.which == 27) {
			Exit();
		}
	});
});