jQuery(document).ready(function($) {
    //Tell Rails that we’re sending a JavaScript request
    /*$.ajaxSetup({ 
        'beforeSend': function (xhr){
        xhr.setRequestHeader("Accept", "text/javascript")}  
    });*/
    $(".from_piece").change(function() {
        $.ajax({
            url: '/items/from_piece',
            dataType: 'text',
            data: {
                id: $(this).val()
            },
            success : function(result) {
                eval(result);
            },
            error : function(xhr, ajaxOptions, thrownError) {
                alert(thrownError);
            }
        });
    });

    $('.from_type').change(function() {
        $.ajax({
            url: '/items/from_type',
            dataType: 'text',
            data: {
                id: $(this).val()
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