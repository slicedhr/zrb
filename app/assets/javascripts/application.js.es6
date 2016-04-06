// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require wice_grid
//= require turbolinks
//= require select2
//= require_tree .
$(document).ready( () => {

    Turbolinks.enableProgressBar()


    //####Materialize components#####
    $('select').not('.autocomplete').material_select();

    $(".button-collapse").sideNav();

    $('.tooltipped').tooltip({delay: 50});

    $('.modal-trigger').leanModal();

    $('.collapsible').collapsible({
      accordion : false 
    });

    /////####Materialize components#####

    setTimeout(() => {

        $(".app-alerts").slideUp('slow').fadeOut('slow');

    }, 10000);

    $( ".datepicker" ).dateDropper({
        lang: 'es',
        lock: 'to',
        minYear: 1980
    });

    $('[data-slide-target]').on('click', e => {

        let target = $(e.delegateTarget).attr('data-slide-target');

        $(target).slideToggle();

    })

    $(document).on("page:fetch", () => {

        let $content = $('#content');

        $('#loading').fadeIn();

        addOrRemoveAnimation('fadeOut');

    });

    $(document).on("page:change", () => {

        $('#loading').fadeOut();

        addOrRemoveAnimation('fadeIn');

    });

    $(document).on("page:receive", () => {

        $('#loading').fadeOut();

    });

    $('[data-checkbox-sh]').on('change', function(e){
        let $this = $(this);

        let columnTarget = $this.attr('data-checkbox-sh');

        let checked = e.target.checked;

        $(`[data-column='${columnTarget}']`).fadeToggle();
    })

    $('[data-add-remove-class]').on('click', function(e){

        let $target = $($(this).attr('data-add-remove-class-target'));

        let className = $(this).attr('data-add-remove-class-name');

        $target.toggleClass(className);

    });

    $( ".autocomplete" ).select2({
        theme: "bootstrap",
        ajax: {
            url: "/asset_names",
            dataType: 'json',
            delay: 250,
            data: function (params) {
              return {
                    name: params.term, // search term
                }
            }
        }
    });


    //Assets

    $('[data-asset]').on('click', $event => {

        let $el = $event.delegateTarget;

        const $id = $el.dataset.asset;

        let $target_tr = $(`[data-tr="${$id}"]`);

        const colspan = $target_tr.find('td').attr('colspan');

        $target_tr.fadeToggle("fast");

        $($el).find('i').toggleClass('fa-arrow-circle-down');

        if (!$target_tr.attr('loaded'))

            loadAssetsChildren($id)
                .success(data => {

                    $target_tr.attr('loaded','true')

                    let tr = '';

                    data.forEach(el => {
                        tr += `<tr>
                                <td>
                                   ${el.asset_name.joined} 
                                </td>
                                <td>
                                   ${el.serial} 
                                </td>
                                <td>
                                   ${el.model} 
                                </td>
                                <td>
                                   ${el.current_plaque} 
                                </td>
                            </tr>`

                    })

                    let table = `<td colspan="${colspan}" style="display:none;padding:0"><table>
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Serial</th>
                            <th>Modelo</th>
                            <th>Placa Actual</th>
                        </tr>
                    </thead>

                    <tbody>${tr}</tbody></table></td>`;

                    $target_tr.html(table).find('td').fadeIn('slow')

                })
                .error(err => { console.info(err) });


    })



});

function addOrRemoveAnimation(animation){

    let $content = $('#content')
   
    $content.addClass(`animated ${animation}`);

    setTimeout(()=>{

            $content.removeClass(animation)

    }, 1000);

}


function loadAssetsChildren($id){

    return $.ajax({
        type: "GET",
        dataType: "json",
        url: `/af_asset/${$id}/af_assets`
    }); 

}
     
function setSelectValue(hiddenfield, el){

     let $el = $(el),
$hiddenfield = $('#'+hiddenfield),
        text = $el.parent().find('input')[0].value,
     options = $el.find('option'),
      length = options.length,
       value;

    for (let i = 0; i < length; i++)

        if (options[i].innerText == text)

            value = options[i].value
        
    $hiddenfield.attr('value', value);

    $el.attr('value', value);

}