$("#subscribeRegisterBtn").click(function () {
    $.ajax({
        url: "../Subscriber/Register",
        type: "POST",
        data: {
            name: $("#subscribeRegisterNameInput").val(),
            email: $("#subscribeRegisterEmailInput").val()
        },
        success: function (result) {
            if (result.toString() == '200') {
                Swal.fire({
                    text: 'ایمیل شما با موفقیت در سامانه اطلاع رسانی ما ثبت شد',
                    icon: 'success'
                });
            } else if (result.toString() == '400') {
                Swal.fire({
                    text: 'لطفا مشخصات خود را بازنگری کرده و سپس مجددا امتحان کنید',
                    icon: 'error',
                });
            } else if (result.toString() == '500') {
                Swal.fire({
                    text: 'سرور موقتا در دسترس نیست، لطغا در زمانی دیگر مجددا تلاش کنید',
                    icon: 'error',
                });
            } else {
                Swal.fire({
                    title: 'عملیات نامشخص',
                    icon: 'question',
                });
            }
        },
        error: function(result) {
            Swal.fire({
                text: 'سرور موقتا در دسترس نیست، لطغا در زمانی دیگر مجددا تلاش کنید',
                icon: 'error',
            });
        }
    });
});