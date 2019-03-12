;(function($) {
    $.fn.dynamicTableView = function(options) {
        let defaults = {
            originalData: [],
            renderData: [],
            pagination: true,
            autoLoad: false,
            autoLoadURL: '',
            currPage: 1,
            totalPage: 1,
            pageSize: 15,
            initURL: '',
            keysMap: [],
            renderFunc: function (data) { return null;},
        };
        let settings = $.extend({}, defaults, options);
        let tableTarget = $(this);
        $(tableTarget).append("<tbody></tbody>");
        let bodyTarget = $(this).children().eq(1);
        //init
        addSortIcon();

        //init
        (function () {
            if (settings.initURL.length !== 0) {
                $.get(settings.initURL, function(response) {
                    if (response.status) {
                        if (typeof response.totalPage !== 'undefined') {
                            settings.totalPage = response.totalPage;
                        }
                        settings.originalData = settings.renderData = response.data;
                        dataRender();
                    } else {
                        console.log(response.info);
                    }
                })
            } else if (settings.renderData.length !== 0 || settings.originalData.length !== 0) {
                if (settings.originalData.length !== 0) {
                    settings.renderData = settings.originalData;
                } else {
                    settings.originalData = settings.renderData;
                }
                dataRender();
            }
        })();

        function dataRender() {
            $(bodyTarget).children().remove();
            let str = "";
            for (let i = (settings.currPage - 1) * settings.pageSize; i < settings.renderData.length && i < settings.currPage * settings.pageSize; i++) {
                let data = settings.renderData[i];
                let res = settings.renderFunc(data);
                if (res == null) {
                    res = "<tr>";
                    if (settings.keysMap.length === 0) {
                        for (let j = 0; j < data.length; j++) {
                            res += "<td>" + data[j] + "</td>"
                        }
                    } else {
                        for (let j = 0; j < settings.keysMap.length; j++) {
                            res += "<td>" + data[settings.keysMap[j]] + "</td>"
                        }
                    }
                    res += "</tr>"
                }
                str += res;
            }
            $(bodyTarget).append(str);
            paginationRender();
        }
        
        function paginationRender() {
            $(tableTarget).next().remove();
            let str = '' +
                '<nav aria-label="Page navigation">' +
                '  <ul class="pagination">' +
                '    <li>' +
                '        <a href="#" autoLoad="1" aria-label="Previous">' +
                '        <span aria-hidden="true">&laquo;</span>' +
                '      </a>' +
                '    </li>';
            let res = '';
            for (let i = 1; i <= settings.totalPage; i++) {
                if (i === parseInt(settings.currPage)) {
                    res += '<li class="active"><a autoLoad="' + i + '" href="#">' + i + '</a></li>'
                } else {
                    res += '<li><a autoLoad="' + i + '" href="#">' + i + '</a></li>'
                }
            }
            str += res +
                '    <li>' +
                '        <a href="#" autoLoad="' + settings.totalPage  + '" aria-label="Next">' +
                '        <span aria-hidden="true">&raquo;</span>' +
                '      </a>' +
                '    </li>' +
                '  </ul>' +
                '</nav>';

            $(tableTarget).after(str);
        }
        /////////////////////////////////////Utils////////////////////////////////
        function showLoader() {
            $(tableTarget).next().after('' +
                '<div class="loader-bg">' +
                '    <div class="loader-box">' +
                '        <div class="loader">' +
                '        </div>' +
                '         <p>加载中</p>' +
                '    </div>' +
                '</div>');
            $(".loader-bg").css('top', '-' + ($(tableTarget).height() - 25) + 'px');
        }

        function hideLoader() {
            $(".loader-bg").remove();
        }

        function addSortIcon() {
            $("[data-sort]").each(function() {
               $(this).html($(this).html() + ' <span class="glyphicon glyphicon-sort"></span>');
            });
        }

        //data-fetch
        //data-fetch-option=''
        //data-fetch-auto
        function addFetchWidget() {
            $("[data-fetch]").each(function () {

            });
        }

        //////////////////////////////////////Event///////////////////////////////
        $(tableTarget).parent().on("click", "[autoLoad]", function() {
            let page = $(this).attr('autoLoad');
            if (settings.autoLoad) {
                let url = settings.autoLoadURL + '?pageSize=' + settings.pageSize + '&currPage=' + page;
                showLoader();
                $.get(url, function (response) {
                    hideLoader();
                    if (response.status) {
                        settings.renderData = response.data;
                        if (typeof response.totalPage !== 'undefined') {
                            settings.totalPage = response.totalPage;
                        }
                        settings.currPage = page;
                        dataRender();
                    } else {
                        console.log(response.info)
                    }
                })
            } else {
                settings.currPage = page;
                dataRender();
            }
        });

        //data-sort='index'?
        //data-sort-func='compareFunc'
        $("[data-sort]").click(function() {
            let index = $(this).attr('data-sort');
            let dir = 1;
            if (!settings.autoLoad) {
                let datas = settings.originalData;
                let compareFunc = $(this).attr('data-sort-func');

                if (typeof compareFunc !== 'undefined') {
                    eval('datas.sort(' + compareFunc+ ')');
                } else {
                    datas.sort(function (a, b) {
                        if (dir === 1) {
                            return a[index] > b[index];
                        } else {
                            return a[index] < b[index];
                        }
                    });
                }
                settings.renderData = datas;
                settings.currPage = 1;
                dataRender();
            } else {
                showLoader();
                $.get(settings.autoLoadURL + "?key=" + index + "&dir=" + dir, function(response){
                    hideLoader();
                    if (response.status) {
                        settings.renderData = response.data;
                        if (typeof response.totalPage !== 'undefined') {
                            settings.totalPage = response.totalPage;
                        }

                        settings.currPage = 1;
                        dataRender();
                    } else {
                        console.log(response.info)
                    }
                })
            }
        });


        $("[data-fetch]").click(function() {

        });
    }
})(jQuery);