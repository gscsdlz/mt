<script>
    let storeList = [];
    $(document).ready(function () {
        $("[sort]").click(function () {
            let op = $(this).attr('sort');
            $("[sort]").removeClass('');
            $(this).addClass("");

            if (op === "name") {
                storeList.sort(function (a, b) {
                   //
                });
            }
        });
        
        $("[fetch]").click(function () {

        })
    });

    function render() {
        if (storeList.length === 0) {
          //empty description
        } else {
            for (let i = 0; i < storeList.length; i++) {
                //
            }
        }
    }

    function loadData() {
        $.get("", function (resp) {
            if (resp.status) {
                const data = resp.data;
                for (let i = 0; i < data.length; i++) {
                    storeList.push(data[i]);
                }
                render();
            } else {
                //
            }
        })
    }

</script>