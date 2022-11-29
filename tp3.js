function affichage_tableau(){
    document.write("<table border=2 width=30%;>");
        for (i=0; i <=5; i++)
        {
            document.write("<tr><td>*</td><td>*</td><td>*</td></tr>")
        }
        document.write("</table>");
}

function affichage_tableau2()
{
    var ligne = prompt("Donner le nombre de ligne à afficher");
    document.write("<table border=2; width=30%;>");
        for (i=1; i <=ligne; i++)
        {
            document.write("<tr><td>"+i+"</td><td>*</td><td>*</td></tr>")
        }
        document.write("</table>");


}

function connexion(){
    var id = prompt("Donnez votre nom d'utilisateur");
    var mdp = prompt("Entrez votre mot de passe");
    if (id == "admin" && mdp == "admin")
    {
        document.write("Bienvenue:   " + id);
    }
    else
    {
        alert("Accès refusé");
    }

}

function connexion2(){
    var i = 0;

    do {
        var id = prompt("Donnez votre nom d'utilisateur");
        var mdp = prompt("Entrez votre mot de passe");

        if (id == "admin" && mdp == "admin")
        {
            document.write("Bienvenue:    "+ id);
            break;
        }

        else

        alert("Accès refusé");

        i+= 1;
    
         } while (i<3);
    if (i == 3)
    alert("Délai dépassé");
}

function fun_switch()
{
    var color = prompt("entrez une couleur");

    switch(color)
    {
        case "vert": document.body.style.background = "green";;
        break;
        case "VERT": document.body.style.background = "green" ;;
        break;
        case "bleu" : document.body.style.background = "blue";;
        break;
        case "BLEU" : document.body.style.background = "blue" ;;
        break;
            default:alert("Couleur non définie");
    }
}

function chaine_caractere()
{
    var chaine=prompt("Donnez un mot")
    document.write(chaine.toUpperCase()+"<br>");
    document.write(chaine.toLowerCase()+"<br>");
    document.write("la chaine contient    " + chaine.length+"   caractères   " + "<br>");
    document.write("la premiere lettre est    "+chaine.substr(0,1)+"<br>");
}

function chaine_caractere2()
{
    var chaine2 = prompt("Donnez un mot")
    document.write("<b>Le mot saisie est   : "+ chaine2 +" </b><br>")
    document.write("la premiere lettre est"+chaine2.substr(0,1)+"<br>");
    document.write("la chaine contient :"+ chaine2.length+" caractères <br>");
    document.write("la derniere lettre est  :" + chaine2.substr(-1)+"<br>");
}

var nbClic=0;
function clic()
{
    nbClic++; //incrémente nbClic de 1
    if (nbClic>=3){
        alert ('Perdu!!!\Vous avez cliqué   ' + nbClic+'  fois');
    }
}

function raz()
{
    nbClic+0;
}