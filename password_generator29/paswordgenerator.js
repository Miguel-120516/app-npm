
function generatRandomPassword(len){
    const charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    let password = '';
    for(var i=0;i<len;i++){
        const randomIndex = Math.floor(Math.random() * charset.length);
        password += charset.charAt(randomIndex);
    }
    return password;
}
module.exports = generatRandomPassword;

//const passwordGenerator = require("password_generator_essa");
//console.log(passwordGenerator(20))
