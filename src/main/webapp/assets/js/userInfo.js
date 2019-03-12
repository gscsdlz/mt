;(function ($) {
    $.fn.userInfo = function (options) {
        let defaults = {
            'data': [],
            'updateURL': '',
        };
        let settings = $.extend({}, defaults, options);
        let target = $(this);
        //Add Modal

        $("body").append('' +
            '<div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="infoModalLabel">' +
            '    <div class="modal-dialog" role="document">' +
            '        <div class="modal-content">' +
            '            <div class="modal-header">' +
            '                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>' +
            '                <h4 class="modal-title">修改设置</h4>' +
            '            </div>' +
            '            <div class="modal-body">' +
            '                <div class="row">' +
            '                    <div class="col-md-12">' +
            '                        <form class="form-horizontal" id="infoForm">' +
            '                            ' +
            '                        </form>' +
            '                    </div>' +
            '                </div>' +
            '            </div>' +
            '            <div class="modal-footer">' +
            '                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>' +
            '                <button type="button" class="btn btn-primary" id="save">保存</button>' +
            '            </div>' +
            '        </div>' +
            '    </div>' +
            '</div>');
        //renderData
        let infoData = settings.data;
        for (let i = 0; i < infoData.length; i++) {
            $(target).append('' +
                '<div class="profile-info-row">' +
                '    <div class="profile-info-name"> ' + infoData[i].key + ' </div>' +
                '    <div class="profile-info-value">' +
                '        <span class="editable editable-click"> ' + infoData[i].val + ' </span>' +
                '    </div>' +
                '</div>');
            if (typeof infoData[i].type !== 'undefined') {
                $("#infoForm").append('' +
                    '<div class="form-group">' +
                    '    <label class="col-sm-3 control-label">' + infoData[i].key + '</label>' +
                    '    <div class="col-sm-9">' +
                    renderForm(infoData[i].type, infoData[i].name, infoData[i].option, infoData[i].val) +
                    '    </div>' +
                    '</div>')
            }
        }

        $(target).after('<hr/><button class="btn btn-sm btn-primary" type="button" data-toggle="modal" data-target="#infoModal">修改信息</button>');

        function renderForm(type, name, options, value) {
            let str = '';
            if (type === 'select') {
                str += '<select class="form-control" name="' + name + '">';
                for (let i = 0; i < options.length; i++) {
                    if (value === options[i].val) {
                        str += '<option selected value="' + options[i].val + '">' + options[i].key + '</option>'
                    } else {
                        str += '<option value="' + options[i].val + '">' + options[i].key + '</option>'
                    }
                }
                str += '</select>'
            } else if (type === 'radio') {
                str += '<div class="radio">';
                for (let i = 0; i < options.length; i++) {
                    if (value === options[i].key) {
                        str += '<label><input class="ace" checked name="' + name + '" value="' + options[i].val + '" type="radio"><span class="lbl">' + options[i].key + '</span></label>'
                    } else {
                        str += '<label><input class="ace" name="' + name + '" value="' + options[i].val + '" type="radio"><span class="lbl">' + options[i].key + '</span></label>'
                    }
                }
                str += '</div>'
            } else if (type === 'checkbox') {
                str += '<div class="checkbox">';
                for (let i = 0; i < options.length; i++) {
                    if (value === options[i].key) {
                        str += '<label><input class="ace" checked name="' + name + '" value="' + options[i].val + '" type="checkbox"><span class="lbl">' + options[i].key + '</span></label>'
                    } else {
                        str += '<label><input class="ace" name="' + name + '" value="' + options[i].val + '" type="checkbox"><span class="lbl">' + options[i].key + '</span></label>'
                    }
                }
                str += '</div>'
            } else if (type === 'hidden'){
                str += '<input readonly type="text" name="' + name + '" value="' + value + '" class="form-control"/>'
            } else {
                str += '<input type="' + type + '" name="' + name + '" value="' + value + '" class="form-control"/>'
            }
            return str;
        }
        
        $("body").on("click", "#save", function () {
            let data = {};
            for (let i = 0; i < infoData.length; i++) {
                if (typeof infoData[i].type !== 'undefined') {
                    let selector = null;
                    if (infoData[i].type === 'radio' || infoData[i].type === 'checkbox') {
                        selector = "[name='"+infoData[i].name+"']:checked";
                    } else {
                        selector = "[name='"+infoData[i].name+"']";
                    }

                    let key = infoData[i].name;
                    data[key] = $(selector).val();
                }
            }

            $.post(settings.updateURL, {'json': JSON.stringify(data)}, function (response) {
                if (response.status) {
                    window.location.reload();
                } else {
                    alert(response.info);
                }
            })
        })
    }
})(jQuery);