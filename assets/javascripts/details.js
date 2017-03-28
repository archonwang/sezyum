function setListener() {
    $(".details-close").click(function _(e) {
        e.preventDefault();
        $("#details").addClass("hidden");
    });
}

function percentage(numerator, denominator, color) {
    console.log(color + ": eklendi");
    $("#distribution").append("<div style='width: " + 100 * (numerator / denominator) + "%; background-color: " + color + ";'></div>");
}
