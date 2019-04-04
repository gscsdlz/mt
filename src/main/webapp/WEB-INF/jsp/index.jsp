<script>
    $(document).ready(function () {
        getTypeList();
    });
    function getTypeList() {
        let typeList = {};
        $.get("/", function (resp) {
            if (resp.status) {
                const data = resp.data;
                for (let i = 0; i < data.length; i++) {
                    if (typeof typeList[data[i].mainType] === "undefined") {
                        typeList[data[i].mainType] = [
                            {
                                'id': data[i].id,
                                'typeName': data[i].typeName,
                            }
                        ]
                    } else {
                        typeList[data[i].mainType].push(
                            {
                                'id': data[i].id,
                                'typeName': data[i].typeName,
                            }
                        )
                    }
                }
                //render

            } else {
                //
            }
        })
    }
</script>