$(document).ready(function(){
    $("#drop_country").on('change', function(){
        var countr = ($(this).val())
        $.ajax({
                url: '/province',
                type: "get",
                data: {
                    country: countr,
                },
                success: function(data) {
                    var opt;
                    opt = '<option value="" selected>Select Your Province</option>';
                    if (data.data.length === 0) {
                    } else {
                    data.data.forEach(function(i) {
                        opt += '<option value="' + i + '">' + i + '</option>';
                    });
                    $("#drop_province").html(opt);
                    }
                }
            });
    });
    $("#drop_province").on('change', function(){
        var provinc = ($(this).val())
        $.ajax({
                url: '/cities',
                type: "get",
                data: {
                    country: $("#drop_country").val(),
                    province: provinc
                },
                success: function(data) {
                    var opt;
                    opt = '<option value="" selected>Select Your City</option>';
                    if (data.data.length === 0) {
                    } else {
                    data.data.forEach(function(i) {
                        opt += '<option value="' + i + '">' + i + '</option>';
                    });
                    $("#drop_city").html(opt);
                    }
                }
            });
    });
  });






