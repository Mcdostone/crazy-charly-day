var ajx = (function () {
    return {
        modules: {}
    }
})();

ajx.modules.items = (function () {
    return {
        init: function () {
            $('#myForm').on('submit', function (e) {
                ajx.modules.items.filtre(e);
            })
        },
        filtre: function (e) {
            e.preventDefault();
            var color = $('#colorSelect').val();
            var type = $('#typeSelect').val();
            var piece = $('#pieceSelect').val();

            if (color === '' && type === '' && piece === '') {
                alert('please put all information');
            }else{
                $.ajax({
                    url : $this.attr('action'),
                    type: $this.attr('method'), // La méthode indiquée dans le formulaire (get ou post)
                    data: $this.serialize(), // Je sérialise les données (j'envoie toutes les valeurs présentes dans le formulaire)
                    success: function(html) { // Je récupère la réponse du fichier
                        alert(html); // J'affiche cette réponse
                    }
                });
            }
        }
    }
})();

$(document).ready = function () {
    ajx.modules.items.init();
}
