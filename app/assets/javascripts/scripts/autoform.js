function autoform(){
  $('[name="saring"]').change(function() {
    $(this).closest('form').submit();
  });
  $('[name="saring_kategori"]').change(function() {
    $(this).closest('form').submit();
  });
}
