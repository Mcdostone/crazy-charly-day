jQuery(document).ready(function ($) {
    //Tell Rails that we’re sending a JavaScript request
    /*$.ajaxSetup({
        'beforeSend': function (xhr){
        xhr.setRequestHeader("Accept", "text/javascript")}  
    });*/
    $(".from_piece").change(function() {
        var type = $('.from_type option:selected').val();
        var data = {
            piece_id: $(this).val()
        };

        if(type !== '')
            data.type_id = type;

        $.ajax({
            url: '/items/from_piece',
            dataType: 'text',
            data: data,
            success : function(result) {
                eval(result);
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError);
            }
        });
    });

    $('.from_type').change(function() {
        var piece = $('.from_piece option:selected').val();
        var data = {
            type_id: $(this).val()
        };

        if(piece !== '')
            data.piece_id = piece;

        $.ajax({
            url: '/items/from_type',
            dataType: 'text',
            data: data,
            success : function(result) {
                eval(result);
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError);
            }
        });
    });
    
    $('#like_item').click(function() {
        var item_id = $('#item_id').val();
        $.ajax({
            url: '/items/like',
            dataType: 'text',
            data: {
                id: parseInt(item_id)
            },
            success : function(result) {
                eval(result);
            },
            error : function(xhr, ajaxOptions, thrownError) {
                alert(thrownError);
            }
        });
    });
});