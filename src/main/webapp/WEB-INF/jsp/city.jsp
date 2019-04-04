<script>
    $(document).ready(function () {
       //renderCity
        $.get("", function (resp) {
            if (resp.status) {
                const data = resp.data;
                let res = [];
                for (let i = 0; i < data.length; i++) {
                    if (typeof res[data[i].province] === 'undefined') {
                        res[data[i].province] = [
                            {
                                'id': data[i].id,
                                'city': data[i].city,
                            }
                        ]
                    } else {
                        res[data[i].province].push({
                            'id': data[i].id,
                            'city': data[i].city,
                        })
                    }
                }

                //render
                for (let p in res) {
                    if (res.hasOwnProperty(p)) {
                        //
                        const data = res[p];
                        for (let i = 0; i < data.length; i++) {
                            //
                        }
                    }
                }
            }
        })
    });
</script>