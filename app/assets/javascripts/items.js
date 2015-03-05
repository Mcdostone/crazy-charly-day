$('.from_piece').change(function() {
    $.ajax({
        url: '/item/from_piece',
        //contentType: 'js',
        data: {id : $(this).val()}
    });
});

$('.from_type').change(function() {

});