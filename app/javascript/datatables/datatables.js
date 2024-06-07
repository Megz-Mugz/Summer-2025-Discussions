import $ from 'jquery'
import DataTable from 'datatables.net'
window.DataTable = DataTable
$(document).on('turbo:load', function() {
    $('#users').dataTable({
        processing: true,
        responsive: true,
        serverSide: true,
        paging: false,
        dom: 'lftrip',
        columns: [
            {
                width: '10%',
                orderable: false
            },
            {
                width: '10%',
                orderable: false
            },
            {
                width: '10%',
                orderable: false
            },
            {
                width: '10%',
                orderable: false
            },
            {
                width: '10%',
                orderable: false
            }
        ],
        ajax: {
            url: $('#users').data('source'),
            data: function(data) {
                return $.extend( {}, data, {
                });
            }
        }
    });
});


$(document).on('turbo:load', function() {
    $('#mistakes').dataTable({
        processing: true,
        responsive: true,
        serverSide: true,
        paging: false,
        dom: 'lftrip',
        columns: [
            {
                width: '10%',
                orderable: false
            },
            {
                width: '10%',
                orderable: false
            },
            {
                width: '10%',
                orderable: false
            },
            {
                width: '10%',
                orderable: false
            }
        ],
        ajax: {
            url: $('#mistakes').data('source'),
            data: function(data) {
                return $.extend( {}, data, {
                });
            }
        }
    });
});