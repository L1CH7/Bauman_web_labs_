var sum = 0;

function add() {
    nm = document.getElementById("name").value;
    cst = document.getElementById("cost").value;
    if (!isNaN(cst) && (cst > 0)) {
        sum += Number(cst);
        var tbody = document.getElementById("tbd");
        var row = document.createElement("tr");
        var td1 = document.createElement("td");
        td1.innerHTML = nm;
        var td2 = document.createElement("td");
        td2.innerHTML = cst;
        td2.setAttribute('class', "cost-td");
        row.appendChild(td1);
        row.appendChild(td2);
        tbody.appendChild(row);
    }
    else {
        alert("В поле цены введено не положительное число!");
    }

}

function summ() {
    document.getElementById("calc-res").innerText = sum;
}