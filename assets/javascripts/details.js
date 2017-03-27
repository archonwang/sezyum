function setListener() {
    $(".details-close").click(function _(e) {
        e.preventDefault();
        $("#details").addClass("hidden");
    });
}
