function pagination(){
  $(document).on('click', ".pagination a", function() {
    $(".pagination").html("<span class='loading'>Loading...</span>");
    console.log(this.href);
    $.ajax({
      url: this.href,
      dataType: "script",
      error: function (xhr, ajaxOptions, thrownError) {
        alert(xhr.responseText);
    }
    });
    return false;
  });
}
