var contador = 0;
var contadorMorado = 3;
var contadorRojo = 0;
var elemArrastrableId = "";
var origen = "";

function start(e) {
    /*funciones de los elementos cuadraditos*/
    console.log("start");
    e.dataTransfer.effectAllowed = "move";
    e.dataTransfer.setData("Data", e.target.id); /*Data arrastrable1*/
    $("#" + e.target.id).css("opacity", "0.4");
    elemArrastrableId = e.target.id;
    origen = e.target.parentNode.id;
}

function end(e) {
    console.log(end);
    e.target.style.opacity = '';
    e.dataTransfer.clearData("Data");
    elemArrastrableId = "";
}

function enter(e) {
    console.log("enter");
    e.target.style.border = "12px dotted #555";
}

function leave(e) {
    console.log("leave");
    //e.target.style.border="";
    $("#" + e.target.id).css("border", "");
}

function over(e) {
    console.log("over");
    var id = e.target.id;
    if ((id == "cuadro1") || (id == "cuadro3") || (id == "papelera")) {
        //return false
        e.preventDefault();
    } else {
        return true;
    }
}

function drop(e) {
    console.log("drop");
    var elementoArrastrado = e.dataTransfer.getData("Data");
    if (contadorMorado < 3) {
        alert("aun hay espacio: " + contadorMorado);
        e.target.appendChild(document.getElementById(elementoArrastrado));
        if (origen == "cuadro3") {
            contadorRojo--;
            contadorMorado++;
        }
    }
    e.target.style.border = "";

}


function eliminar(e) {
    console.log("eliminar");
    var elementoArrastrado = document.getElementById(e.dataTransfer.getData("Data")); //arrastrable1
    elementoArrastrado.parentNode.removeChild(elementoArrastrado);
    e.target.style.border = "";
    if (origen == "cuadro1") {
        contadorMorado--;
    }

    if (origen == "cuadro3") {
        contadorRojo--;
    }
}

function clonar(e) {
    console.log("clonar");
    var elementoArrastrado = document.getElementById(e.dataTransfer.getData("Data"));//Arrastrable1
    elementoArrastrado.style.opacity = "";
    if (contadorRojo < 3) {
        var elementoClonado = elementoArrastrado.cloneNode(true);
        elementoClonado.id = "ElementoClonado" + contador;
        contador++; //1
        elementoClonado.style.position = "static";
        e.target.appendChild(elementoClonado);
        contadorRojo++;
    }
    e.target.style.border = "";
    console.log(contador);


}