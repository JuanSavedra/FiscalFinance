function showPassword() {
    var input = document.getElementById("Senha");

    if (input.type === "password") {
        input.type = "text";
    } else {
        input.type = "password";
    }
}